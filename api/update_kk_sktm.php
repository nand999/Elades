<?php
// update_foto_profil.php

include 'koneksi.php';

// Ambil data dari Flutter
$data = json_decode(file_get_contents('php://input'), true);

header('Content-Type: application/json'); // Tambahkan header JSON

if (isset($data['username']) && isset($data['foto_kk'])) {
    $idUser = $data['username'];
    $fileName = $data['foto_kk'];

    // Update kolom foto_profil di database
    $query = "UPDATE sktm
    SET foto_kk = '$fileName' 
    WHERE username = '$idUser' 
    AND no_pengajuan = (SELECT MAX(no_pengajuan) FROM sktm WHERE username = '$idUser');
    ";

    if ($koneksi->query($query) === TRUE) {
        echo json_encode(['status' => 'success', 'message' => 'Foto profil updated successfully']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update foto kk: ' . $koneksi->error]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid data format']);
}

$koneksi->close();
?>