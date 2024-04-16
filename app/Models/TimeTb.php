<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeTb extends Model
{
    use HasFactory;
    protected $table = 'time_tb';

//    public function time(): Attribute
//    {
//        return Attribute::make(
//            get: fn($value) => substr($value, 0, 5)
//        );
//    }

}
