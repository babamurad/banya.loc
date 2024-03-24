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

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }

    public function employe()
    {
        return $this->belongsTo(Employe::class, 'employes_id', 'id');
    }
}
