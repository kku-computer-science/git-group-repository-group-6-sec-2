<?php

use App\Http\Controllers\ApiDatabaseController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\ProfileuserController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\FundController;
use App\Http\Controllers\ExpertiseController;
use App\Http\Controllers\ResearchProjectController;
use App\Http\Controllers\BibtexController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\PaperController;
use App\Http\Controllers\ResearchGroupController;
use App\Http\Controllers\ResearcherController;
use App\Http\Controllers\ResearchGroupDetailController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\EducationController;
use App\Http\Controllers\ExportPaperController;
use App\Http\Controllers\ImportExportController;
use App\Http\Controllers\LocalizationController;
use App\Http\Controllers\PatentController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\SourceController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProgramController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['middleware' => 'PreventBackHistory'])->group(function () {
    Auth::routes();
});

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('researchers/{id}', [ResearcherController::class, 'request'])->name('researchers');
Route::get('researchers/{id}/search', [ResearcherController::class, 'search'])->name('searchresearchers');
Route::get('/researchproject', [App\Http\Controllers\ResearchProjController::class, 'index'])->name('researchproject');
Route::get('/researchgroup', [App\Http\Controllers\ResearchgroupsController::class, 'index'])->name('researchgroup');
Route::get('researchgroupdetail/{id}', [ResearchGroupDetailController::class, 'request'])->name('researchgroupdetail');
Route::get('/reports', [App\Http\Controllers\ReportController::class, 'index'])->name('reports');
Route::get('loadindex', [PDFController::class, 'index']);
Route::get('pdf', [PDFController::class, 'generateInvoicePDF'])->name('pdf');
Route::get('docx', [PDFController::class, 'generateInvoiceDOCX'])->name('docx');
Route::get('excel', [PDFController::class, 'generateInvoiceExcel'])->name('excel');

Route::get('/history-chart/{userId}', [ProfileController::class, 'showHistoryChart'])->name('history.chart');
Route::get('/citation-h-index/{userId}', [ProfileController::class, 'citationchart'])->name('citation-h-index');

Route::get('researchers/all', [ResearcherController::class, 'showAllResearchers']);


Route::get('detail/{id}', [ProfileController::class, 'request'])->name('detail');
Route::get('index', [LocalizationController::class, 'index']);
Route::get('lang/{lang}', ['as' => 'langswitch', 'uses' => 'App\Http\Controllers\LocalizationController@switchLang']);
Route::get('/export', [ExportPaperController::class, 'exportUsers'])->name('export-papers');
Route::get('bib/{id}', [BibtexController::class, 'getbib'])->name('bibtex');

//Route::get('/callscopus/{id}', [App\Http\Controllers\ScopuscallController::class, 'create'])->name('callscopus');

Route::get('/callscopus/{id}', [App\Http\Controllers\CallPublicationController::class, 'callPublications'])->name('callscopus');

Route::group(['middleware' => ['isAdmin', 'auth', 'PreventBackHistory']], function () {
    //Route::post('change-profile-picture',[ProfileuserController::class,'updatePicture'])->name('adminPictureUpdate');

    Route::resource('users', UserController::class);
    Route::resource('roles', RoleController::class);
    Route::resource('permissions', PermissionController::class);
    Route::get('importfiles', [ImportExportController::class, 'index'])->name('importfiles');
    Route::post('import', [ImportExportController::class, 'import']);
});

Route::group(['middleware' => ['auth', 'PreventBackHistory']], function () {
    Route::post('update-profile-info', [ProfileuserController::class, 'updateInfo'])->name('adminUpdateInfo');
    Route::post('update-edu-info', [EducationController::class, 'updateEdInfo'])->name('updateEdInfo');
    Route::post('change-profile-picture', [UserController::class, 'updatePicture'])->name('adminPictureUpdate');
    Route::post('change-password', [ProfileuserController::class, 'changePassword'])->name('adminChangePassword');
    Route::get('dashboard', [ProfileuserController::class, 'index'])->name('dashboard');
    Route::get('profile', [ProfileuserController::class, 'profile'])->name('profile');
    Route::get('settings', [ProfileuserController::class, 'settings'])->name('settings');
    Route::resource('funds', FundController::class);
    Route::resource('experts', ExpertiseController::class);
    Route::get('experts/{id}/edit/', [ExpertiseController::class, 'edit']);
    Route::resource('sources', SourceController::class);
    Route::get('sources/{id}/edit/', [SourceController::class, 'edit']);
    Route::resource('researchProjects', ResearchProjectController::class);
    Route::resource('researchGroups', ResearchGroupController::class);
    Route::resource('papers', PaperController::class);
    Route::resource('books', BookController::class);
    Route::resource('patents', PatentController::class);
    Route::get('exportfile', [App\Http\Controllers\ExportController::class, 'index'])->name('exportfile');
    Route::resource('departments', DepartmentController::class);
    Route::resource('programs', ProgramController::class);
    Route::get('programs/{id}/edit/', [ProgramController::class, 'edit']);
    Route::resource('courses', CourseController::class);
    Route::get('courses/{id}/edit/', [CourseController::class, 'edit']);
    Route::get('/ajax-get-subcat', [UserController::class, 'getCategory']);
    Route::get('tests', [TestController::class, 'index']); //call department
    Route::get('tests/{id}', [TestController::class, 'getCategory'])->name('tests'); //call program

});

// clear cache
Route::get('/clear-all', function() {
    Artisan::call('cache:clear');     // Clear Cache facade
    Artisan::call('route:clear');     // Clear Route cache
    Artisan::call('view:clear');      // Clear View cache
    Artisan::call('config:clear');    // Clear Config cache

    Artisan::call('optimize');        // Reoptimize class loader
    Artisan::call('route:cache');     // Cache Routes
    Artisan::call('config:cache');    // Cache Config

    return response()->json([
        'cache' => 'Cache facade cleared',
        'route' => 'Routes cached',
        'view' => 'View cache cleared',
        'config' => 'Config cached',
        'optimize' => 'Class loader optimized'
    ], 200);
});

Route::middleware(['auth'])->get('/compare', [ApiDatabaseController::class, 'compareData']);
