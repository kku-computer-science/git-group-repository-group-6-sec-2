<?php
namespace App\Services\APIFetcher;
use App\Models\Author;
use App\Models\Paper;
use App\Models\Source_data;
use App\Models\User;
use Exception;
use GoogleSearchResults;
use Illuminate\Support\Facades\DB;

require 'app/WebScraper/IDScraper.php';

require /** @lang text */
'vendor/autoload.php';

class GoogleScholarAPIService {
    private string $apiKey;

    public function __construct(string $apiKey) {
        $this->apiKey = $apiKey;
    }

    public function getResearcherPublications(string $idAuthorScholar): array|string {
        try {
            $search = new GoogleSearchResults($this->apiKey);
            $query = [
                "engine" => "google_scholar_author",
                "author_id" => $idAuthorScholar,
                "hl" => "en",
                "num" => "100",
            ];

            $result = $search->get_json($query);
            return $this->extractRelevantData(json_decode(json_encode($result), true));
        } catch (Exception $e) {
            error_log("Error while fetching Google Scholar publication: " . $e->getMessage());
            return [] | $e->getCode();
        }
    }

    private function extractRelevantData(array $data): array {

        $authorName = $data['author']['name'] ?? 'Unknown Author';

        $interests = array_column($data['author']['interests'] ?? [], 'title');
        $articles = $data['articles'] ?? [];
        $filteredArticles = [];

        foreach ($articles as $article) {
            $filteredArticles[] = [
                'title' => $article['title'] ?? null,
                'link' => $article['link'] ?? null,
                'citation_id' => $article['citation_id'] ?? null,
                'authors' => $article['authors'] ?? null,
                'publication' => $article['publication'] ?? null,
                'cited_by' => $article['cited_by']['value'] ?? 0,
                'year' => $article['year'] ?? null,
                'source' => 'Google Scholar',
            ];
        }

        return [
            'author_name' => $authorName,
            'interests' => $interests,
            'articles' => $filteredArticles
        ];
    }

    public function saveGoogleScholarPublications(array $data, string $userId): void
    {
        foreach ($data['articles'] as $article) {
            if(Paper::Where('title', $article['title'])->first() == null) {
                $paper = new Paper();
                $paper->paper_name = $article['title'] ?? null;
                $paper->paper_url = $article['link'] ?? null;
                $paper->paper_citation = $article['cited_by'] ?? null;
                $paper->paper_yearpub = $article['year'] ?? null;
                $paper->paper_sourcetitle = $article['publication'] ?? null;
                $paper->save();

                $source = Source_data::findOrFail(4);
                $paper->source()->sync($source);

                $authorsArray = explode(', ', $article['authors']);
                $authors = array_map(function($author) {
                    $parts = explode(' ', $author, 2);
                    return [
                        'fname' => $parts[0] ?? '',
                        'lname' => $parts[1] ?? ''
                    ];
                }, $authorsArray);

                $authorCount = count($authorsArray);

                foreach ($authors as $index => $authorData) {
                    $user = User::where([
                        ['fname_en', '=', $authorData['fname']],
                        ['lname_en', '=', $authorData['lname']]
                    ])
                        ->orWhere([
                            [DB::raw("concat(left(fname_en,1),'.')"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->orWhere([
                            [DB::raw("left(fname_en,1)"), '=', $authorData['fname']],
                            ['lname_en', '=', $authorData['lname']]
                        ])
                        ->first();

                    /* Author_type (1 = first, 2 = middle, 3 = last) */
                    $authorType = ($index === 0) ? 1 : (($index === $authorCount - 1) ? 3 : 2);

                    if ($user) {
                        $paper->teacher()->attach($user, ['author_type' => $authorType]);
                    } else {
                        $author = $this->findOrCreateAuthor($authorData['fname'], $authorData['lname']);
                        $paper->author()->attach($author, ['author_type' => $authorType]);
                    }
                }

            }
            else{
                $paper = Paper::where('title', $article['title'])->firstOrFail();
                $user = User::findOrFail($userId);
                if (!$user->papers()->where('paper_id', $paper->id)->exists()) {
                    $author = Author::where([
                        ['author_fname', $user->fname_en],
                        ['author_lname', $user->lname_en],
                        ['paper_id', $paper->id]
                    ])->first();
                    if ($author) {
                        $paper->authors()->detach($author->id);
                    }
                    $paper->teachers()->attach($user->id);
                }
            }
        }
    }

    private function findOrCreateAuthor($fname, $lname) {
        return Author::firstOrCreate(
            ['author_fname' => $fname, 'author_lname' => $lname],
            ['author_fname' => $fname, 'author_lname' => $lname]
        );
    }
}
