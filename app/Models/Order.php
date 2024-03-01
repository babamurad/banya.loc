<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $guarages = ['id'];

    public function scopeSearch($query, $search)
    {
        return $query->where('name','LIKE','%'. $search .'%')
        ->orWhere('num','LIKE','%'. $search .'%');
    }
}
