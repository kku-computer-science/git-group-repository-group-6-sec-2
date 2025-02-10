<?php

            namespace App\Http\Controllers;

            use App\Models\Author;
            use Illuminate\Http\Request;
            use App\Models\User;
            use App\Models\Paper;
            use App\Models\Source_data;
            use Carbon\Carbon;
            use Illuminate\Support\Facades\Crypt;
            use Illuminate\Support\Facades\Http;
            use Illuminate\Support\Facades\DB;

            class ScopuscallController extends Controller
            {
                public function create($id)
                {
                    $id = Crypt::decrypt($id);
                    $data = User::find($id);

                    $fname = substr($data['fname_en'], 0, 1);
                    $lname = $data['lname_en'];

                    $url = Http::get('https://api.elsevier.com/content/search/scopus?', [
                        'query' => "AUTHOR-NAME($lname,$fname)",
                        'apikey' => '6ab3c2a01c29f0e36b00c8fa1d013f83',
                        'httpAccept' => 'application/json'
                    ])->json();

                    if (isset($url['error'])) {
                        return redirect()->back()->withErrors(['error' => 'Scopus API Error: ' . $url['error']]);
                    }
                    if (!isset($url["search-results"]["entry"])) {
                        return redirect()->back()->withErrors(['error' => 'No results found or API returned unexpected data.']);
                    }

                    $content = $url["search-results"]["entry"];
                    $links = $url["search-results"]["link"];

                    $nextUrl = null;
                    foreach ($links as $link) {
                        if ($link['@ref'] == 'next') {
                            $nextUrl = $link['@href'];
                            break;
                        }
                    }

                    while ($nextUrl) {
                        $link2 = Http::get($nextUrl, ['httpAccept' => 'application/json'])->json();
                        if (isset($link2['error'])) {
                            return redirect()->back()->withErrors(['error' => 'Scopus API Error (pagination): ' . $link2['error']]);
                        }
                        if (!isset($link2["search-results"]["entry"])) {
                            \Log::error("Scopus API Pagination Error: No 'entry' in search results. URL: " . $nextUrl . " Response: " . json_encode($link2));
                            break;
                        }
                        $nextcontent = $link2["search-results"]["entry"];
                        foreach ($nextcontent as $item) {
                            $content[] = $item;
                        }
                        $links = $link2["search-results"]["link"];
                        $nextUrl = null;
                        foreach ($links as $link) {
                            if ($link['@ref'] == 'next') {
                                $nextUrl = $link['@href'];
                                break;
                            }
                        }
                    }

                    foreach ($content as $item) {
                        if (isset($item['error'])) {
                            \Log::info("Skipping item due to error: " . json_encode($item));
                            continue;
                        }

                        if (Paper::where('paper_name', $item['dc:title'])->first() != null) {
                            $paper = Paper::where('paper_name', $item['dc:title'])->first();
                            $paperid = $paper->id;
                            $user = User::find($id);
                            $hasTask = $user->paper()->where('paper_id', $paperid)->exists();
                            if (!$hasTask) {
                                $useaut = Author::where([['author_fname', '=', $data->fname_en], ['author_lname', '=', $data->lname_en]])->first();
                                if ($useaut != null) {
                                    if ($paper->author()->where('authors.id', $useaut->id)->exists()) {
                                        $paper->author()->detach($useaut->id);
                                        $paper->teacher()->attach($id);
                                    } else {
                                        $paper->teacher()->attach($id);
                                    }
                                } else {
                                    $paper->teacher()->attach($id);
                                }
                            }
                            continue;
                        }

                        $scoid = explode(":", $item['dc:identifier'])[1];

                        $all = Http::withHeaders([
                            'Accept' => 'application/json'
                        ])->get("https://api.elsevier.com/content/abstract/scopus_id/$scoid", [
                            'field' => 'authors',
                            'apiKey' => '6ab3c2a01c29f0e36b00c8fa1d013f83',
                        ]);

                        if ($all->failed()) {
                            \Log::error("Scopus API Abstract Retrieval Failed: " . $all->status() . " - " . $all->body());
                            continue;
                        }
                        $all = $all->json();

                        if (isset($all['error'])) {
                            \Log::info("Skipping Abstract $scoid due to error: " . json_encode($all));
                            continue;
                        }

                        if (!isset($all['abstracts-retrieval-response'])) {
                            \Log::error("Unexpected API response structure for SCOID: $scoid. Response: " . json_encode($all));
                            continue;
                        }

                        $paper = new Paper;
                        $paper->paper_name = $item['dc:title'];
                        $paper->paper_type = $item['prism:aggregationType'];
                        $paper->paper_subtype = $item['subtypeDescription'];
                        $paper->paper_sourcetitle = $item['prism:publicationName'];
                        $paper->paper_url = $item['link'][2]['@href'];
                        $paper->paper_yearpub = Carbon::parse($item['prism:coverDate'])->format('Y');
                        $paper->paper_volume = $item['prism:volume'] ?? null;
                        $paper->paper_issue = $item['prism:issueIdentifier'] ?? null;
                        $paper->paper_citation = $item['citedby-count'];
                        $paper->paper_page = $item['prism:pageRange'] ?? null;
                        $paper->paper_doi = $item['prism:doi'] ?? null;

                        $arr_response = $all['abstracts-retrieval-response'];

                        if (isset($arr_response['item']['xocs:meta']['xocs:funding-list']['xocs:funding'])) {
                            $paper->paper_funder = json_encode($arr_response['item']['xocs:meta']['xocs:funding-list']['xocs:funding']);
                        } elseif (isset($arr_response['item']['xocs:meta']['xocs:funding-list']['xocs:funding-text'])) {
                            $funder = $arr_response['item']['xocs:meta']['xocs:funding-list']['xocs:funding-text'];
                            $paper->paper_funder = json_encode($funder);
                        } else {
                            $paper->paper_funder = null;
                        }

                        $paper->abstract = $arr_response['item']['bibrecord']['head']['abstracts'] ?? null;

                        if (isset($arr_response['item']['bibrecord']['head']['citation-info']['author-keywords'])) {
                            $key = $arr_response['item']['bibrecord']['head']['citation-info']['author-keywords']['author-keyword'];
                            $paper->keyword = json_encode($key);
                        } else {
                            $paper->keyword = null;
                        }

                        $paper->save();
                        $source = Source_data::findOrFail(1);
                        $paper->source()->sync($source);

                        if (isset($all['abstracts-retrieval-response']['authors']['author'])) {
                            $all_au = $all['abstracts-retrieval-response']['authors']['author'];
                        } else {
                            \Log::info("No Authors found for SCOID: $scoid");
                            $all_au = [];
                        }

                        $x = 1;
                        $length = count($all_au);
                        foreach ($all_au as $i) {
                            $givenName = $i['ce:given-name'] ?? ($i['preferred-name']['ce:given-name'] ?? null);
                            $surname = $i['ce:surname'] ?? null;

                            if (!$givenName || !$surname) {
                                Log::warning("Missing name parts for author: " . json_encode($i));
                                continue;
                            }

                            $user = User::where(function ($query) use ($givenName, $surname) {
                                $query->where([['fname_en', '=', $givenName], ['lname_en', '=', $surname]])
                                    ->orWhere([DB::raw("CONCAT(LEFT(fname_en, 1), '.')"), '=', $givenName], ['lname_en', '=', $surname]);
                            })->first();

                            if ($user) {
                                if ($x === 1) {
                                    $paper->teacher()->attach($user, ['author_type' => 1]);
                                } elseif ($x === $length) {
                                    $paper->teacher()->attach($user, ['author_type' => 3]);
                                } else {
                                    $paper->teacher()->attach($user, ['author_type' => 2]);
                                }
                            } else {
                                $author = Author::firstOrCreate(
                                    ['author_fname' => $givenName, 'author_lname' => $surname]
                                );

                                if ($x === 1) {
                                    $paper->author()->attach($author, ['author_type' => 1]);
                                } elseif ($x === $length) {
                                    $paper->author()->attach($author, ['author_type' => 3]);
                                } else {
                                    $paper->author()->attach($author, ['author_type' => 2]);
                                }
                            }
                            $x++;
                        }
                    }
                    return redirect()->back();
                }

                public function index()
                {
                    $year = range(Carbon::now()->year - 5, Carbon::now()->year);
                    $paper = [];
                    foreach ($year as $value) {
                        $paper[] = Paper::where(DB::raw('YEAR(paper_yearpub)'), $value)->count();
                    }
                    return view('test')->with('year', json_encode($year, JSON_NUMERIC_CHECK))->with('paper', json_encode($paper, JSON_NUMERIC_CHECK));
                }

                public function store(Request $request)
                {
                    //
                }

                public function show($id)
                {
                }

                public function edit($id)
                {
                    //
                }

                public function update(Request $request, $id)
                {
                    //
                }

                public function destroy($id)
                {
                    //
                }
            }
