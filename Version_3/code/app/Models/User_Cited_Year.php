<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class User_Cited_Year extends Model
{
    use HasFactory;

    protected $table = 'user_cited_year';
    public $timestamps = false;

    protected $fillable = [
        'cited_year',
        'cited_count',
        'user_id',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

}
