import React, { useEffect, useState } from 'react';

function App() {
  const [khachHang, setKhachHang] = useState([]);

  useEffect(() => {
    fetch('http://127.0.0.1:8000/api/khachhang')
      .then(res => res.json())
      .then(data => {
        if (data.status) {
          setKhachHang(data.data);
        }
      });
  }, []);

  return (
    <div>
      <h1>Danh sách khách hàng</h1>
      <ul>
        {khachHang.map(kh => (
          <li key={kh.id}>
            {kh.ho_ten} - {kh.email} - {kh.so_dien_thoai} - {kh.dia_chi}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
