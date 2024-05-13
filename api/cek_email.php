<?php
include 'koneksi.php';

// Ambil data dari body request
$data = json_decode(file_get_contents("php://input"));

// Pastikan ada data yang dikirim
if(isset($data->email)) {
    $email = $data->email;

    // Query untuk mendapatkan detail user berdasarkan email
    $query = "SELECT * FROM akun_user WHERE email = '$email'";
    $result = $koneksi->query($query);

    // Pastikan query berhasil
    if($result) {
        // Periksa apakah email sudah ada atau belum
        if($result->num_rows > 0) {
            // Jika email sudah ada
            echo json_encode(['status' => 'exists']);
        } else {
            // Jika email belum ada
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