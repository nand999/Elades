<?php
// upload.php

$uploadDir = '../foto_kelengkapan/'; // Sesuaikan dengan direktori penyimpanan gambar di server
$filePath = $uploadDir . basename($_FILES['file']['name']); // Nama file

if (!file_exists($uploadDir)) {
    mkdir($uploadDir, 0777, true); // Buat direktori jika belum ada
}

if (isset($_FILES['file']) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
    if (move_uploaded_file($_FILES['file']['tmp_name'], $filePath)) {
        echo json_encode([
            'status' => 'success',
            'message' => 'File uploaded successfully',
            'filename' => basename($_FILES['file']['name']),
            'filepath' => $filePath  // Tambahkan informasi path lengkap ke file
        ]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to move uploaded file']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'File upload failed']);
}
?>
