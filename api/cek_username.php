<?php
// Di dalam cek_user.php

include 'koneksi.php';

// Ambil data dari body request
$data = json_decode(file_get_contents("php://input"));

// Pastikan ada data yang dikirim
if(isset($data->username)) {
    $username = $data->username;

    // Query untuk mendapatkan detail user berdasarkan username
    $query = "SELECT * FROM akun_user WHERE username = '$username'";
    $result = $koneksi->query($query);

    // Pastikan query berhasil
    if($result) {
        // Periksa apakah username sudah ada atau belum
        if($result->num_rows > 0) {
            // Jika username sudah ada
            echo json_encode(['status' => 'exists']);
        } else {
            // Jika username belum ada
            echo json_encode(['status' => 'available']);
        }
    } else {
        // Jika query gagal
        echo json_encode(['error' => 'Failed to execute query.']);
    }
} else {
    // Jika data tidak lengkap
    echo json_encode(['error' => 'Incomplete data.']);
}
?>
