<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $casts = [
        'published_year' => 'integer',
    ];

    public function library()
    {
        return $this->belongsTo(Library::class);
    }

    public function bookViews()
    {
        return $this->hasMany(BookView::class);
    }
}
