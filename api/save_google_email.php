<?php
include 'koneksi.php';

// Menerima data POST dari Flutter
// Menerima data POST dari Flutter
$data = json_decode(file_get_contents('php://input'), true);

// Mendapatkan nilai email dari data yang diterima
$email = isset($data['email']) ? $data['email'] : null;

// Validasi email tidak kosong
if ($email !== null && $email !== '') {
    // Menyimpan email ke database
    $sql = "INSERT INTO akun_user (username,email) VALUES ('$email','$email')";

    if ($koneksi->query($sql) === TRUE) {
        // Jika penyimpanan sukses
        $response = array("success" => true, "message" => "Email berhasil disimpan ke database");
        echo json_encode($response);
    } else {
        // Jika terjadi kesalahan
        $response = array("success" => false, "message" => "Gagal menyimpan email ke database: " . $koneksi->error);
        echo json_encode($response);
    }
} else {
    // Jika email kosong, berikan response sesuai kebutuhan
    $response = array("success" => false, "message" => "Email tidak valid");
    echo json_encode($response);
}

// Menutup koneksi database
$koneksi->close();
?>