<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Employe extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable = ['first_name', 'last_name', 'phone', 'address'];

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    }
}
