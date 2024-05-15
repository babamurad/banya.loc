<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    //protected $guarages = ['id'];

    protected $fillable = [
        'num',
        'data',
        'employes_id',
        'clients_id',
        'department_id',
        'user_id',
        'end',
        'start',
        'sum',
        'desc',
        'gender',
        'adults',
        'children'
    ];

    public function scopeSearch($query, $search)
    {
        return $query->where('name','LIKE','%'. $search .'%')
        ->orWhere('num','LIKE','%'. $search .'%');
    }

    public function order_details()
    {
        return $this->hasMany(OrderDetail::class, 'num', 'id');
    }

    public function active_user()
    {
        return $this->hasOne(Employe::class, 'id', 'employes_id');
    }
     public function department()
    {
        return $this->hasOne(Department::class, 'id','department_id' );
    }

    public function client()
    {
        return $this->hasOne(Client::class, 'id', 'clients_id');
    }

}
