<?php
// update_foto_profil.php

include 'koneksi.php';

// Ambil data dari Flutter
$data = json_decode(file_get_contents('php://input'), true);

header('Content-Type: application/json'); // Tambahkan header JSON

if (isset($data['sandi']) && isset($data['email'])) {
    $email = $data['email'];
    $sandi = md5($data['sandi']);

    // Update kolom foto_profil di database
    $query = "UPDATE akun_user
    SET password = '$sandi' 
    WHERE email = '$email';
    ";

    if ($koneksi->query($query) === TRUE) {
        echo json_encode(['status' => 'success', 'message' => 'Foto profil updated successfully']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update foto profil: ' . $koneksi->error]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data format']);
}

$koneksi->close();
?>