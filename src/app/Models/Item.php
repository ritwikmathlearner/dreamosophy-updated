<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    protected $fillable = ['sku', 'cost', 'name', 'discounted_cost'];

    public function users()
    {
        return $this->belongsToMany(User::class, 'inventories')->withPivot('available_units');
    }
}
