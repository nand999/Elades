<?php
// Di dalam get_product_details.php

include 'koneksi.php';

// Ambil data dari body request
$data = json_decode(file_get_contents("php://input"));

// Pastikan ada data yang dikirim
if(isset($data->id_berita)) {
    $idProduk = $data->id_berita;

    // Query untuk mendapatkan detail produk berdasarkan ID
    $query = "SELECT * FROM berita WHERE id_berita = $idProduk";
    $result = $koneksi->query($query);

    // Pastikan query berhasil
    if($result) {
        // Ambil data produk
        $row = $result->fetch_assoc();

        // Kirim data sebagai response
        echo json_encode($row);
    } else {
        // Jika query gagal
        echo json_encode(['error' => 'Failed to get product details.']);
    }
} else {
    // Jika data tidak lengkap
    echo json_encode(['error' => 'Incomplete data.']);
}
?>