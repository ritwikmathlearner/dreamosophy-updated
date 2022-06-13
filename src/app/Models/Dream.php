<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dream extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'watched_on', 'location', 'user_id', 'private', 'draft', 'garden_level', 'bed_no'];

    protected $casts = [
        'private' => 'boolean',
        'draft' => 'boolean'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function plant()
    {
        return $this->hasOne(Plant::class);
    }
}
