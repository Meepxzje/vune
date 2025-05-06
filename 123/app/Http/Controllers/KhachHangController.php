<?php

namespace App\Http\Controllers;

use App\Models\KhachHang;
use Illuminate\Http\Request;

class KhachHangController extends Controller
{
    public function index()
    {
        $khachhang = KhachHang::all();
        return response()->json([
            'status' => true,
            'message' => 'Lấy danh sách khách hàng thành công',
            'data' => $khachhang
        ]);
    }
}
