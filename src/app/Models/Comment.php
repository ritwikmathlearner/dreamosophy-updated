<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = ['dream_id', 'user_id', 'comment', 'bad_comment_intensity'];

    public function dream()
    {
        return $this->belongsTo(Dream::class);
    }

    public function belongsToCurrentUser()
    {
        return Arr::get($this->dream->original, 'user_id') === auth()->id();
    }
}
