<?php
// Di dalam get_product_details.php

include 'koneksi.php';

// Ambil data dari body request
$data = json_decode(file_get_contents("php://input"));

// Pastikan ada data yang dikirim
if (isset($data->id)) {
    $idProduk = $data->id;

    // Query untuk mendapatkan detail produk berdasarkan ID
    $query = "SELECT ps.*, s.*, ps.tanggal AS tanggal_pengajuan, s.tanggal AS tanggal_surat_ijin
    FROM pengajuan_surat AS ps
    JOIN surat_ijin AS s ON ps.no_pengajuan = s.no_pengajuan
    WHERE ps.no_pengajuan = $idProduk;
    ";
    $result = $koneksi->query($query);

    // Pastikan query berhasil
    if ($result) {
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