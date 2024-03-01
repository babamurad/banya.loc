<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;
    protected  $guarded = ['id'];


    public function scopeSearch($query, $search)
    {
        return $query->where('address','LIKE','%'. $search .'%')
        ->orWhere('email','LIKE','%'. $search .'%')
        ->orWhere('first_name','LIKE','%'. $search .'%')
        ->orWhere('last_name','LIKE','%'. $search .'%');
    }
}
