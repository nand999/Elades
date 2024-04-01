<?php
// Di dalam get_status.php
include 'koneksi.php';
// Ambil data dari body request
$data = json_decode(file_get_contents("php://input"));
// Pastikan ada data yang dikirim
if (isset($data->username)) {
    $username = $data->username;
    // Query untuk mendapatkan jumlah surat berdasarkan status
    $query = "SELECT CONCAT(laporan.status, ' : ', COUNT(*)) AS status_jumlah
              FROM pengajuan_surat
              JOIN laporan ON pengajuan_surat.id = laporan.id
              WHERE pengajuan_surat.username = '$username'
              GROUP BY laporan.status;
    ";
    $result = $koneksi->query($query);
    // Pastikan query berhasil
    if ($result) {
        // Ambil data status dan jumlah
        $rows = array();
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row['status_jumlah'];
        }
        // Kirim data sebagai response
        echo json_encode($rows);
    } else {
        // Jika query gagal
        echo json_encode(['error' => 'Failed to get product details.']);
    }
} else {
    // Jika data tidak lengkap
    echo json_encode(['error' => 'Incomplete data.']);
}
?>