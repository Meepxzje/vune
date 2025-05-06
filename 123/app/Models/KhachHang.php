<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KhachHang extends Model
{

    protected $fillable = [
        'ho_ten',
        'email',
        'password',
        'so_dien_thoai',
        'dia_chi',
    ];
    protected $table = 'khachhang';
    public $timestamps = false;
    protected $primaryKey = 'id';
}
