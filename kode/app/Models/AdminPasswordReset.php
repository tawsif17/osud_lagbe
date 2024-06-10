<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminPasswordReset extends Model
{
    use HasFactory;

    protected $fillable = [
    	'email', 'token','uid'
    ];    
    
    protected static function booted()
    {
        static::creating(function ($adminPasswordReset) {
            $adminPasswordReset->uid = str_unique();
        });
    }
}
