<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'num',
        'order_id',
        'jobtitle_id',
        'employes_id',
        'start',
        'end',
        'qty',
        'price',
        'sum',
    ];
}
