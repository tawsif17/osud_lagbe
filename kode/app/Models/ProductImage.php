<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;
    protected $guarded = [];    
    protected static function booted()
    {
        static::creating(function ($productImage) {
            $productImage->uid = str_unique();
        });
    }
}
