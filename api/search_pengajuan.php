<?php
include 'koneksi.php';

$keyword = $_GET['keyword'];

$query = "SELECT pengajuan_surat.*, 
laporan.tanggal AS laporan_tanggal, 
laporan.status,
laporan.alasan
FROM pengajuan_surat
LEFT JOIN laporan ON pengajuan_surat.id = laporan.id WHERE nama LIKE '%$keyword%'";

$result = $koneksi->query($query);

if ($result->num_rows > 0) {
    $products = array();

    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }

    echo json_encode($products);
} else {
    echo json_encode(array());
}

$koneksi->close();
?>