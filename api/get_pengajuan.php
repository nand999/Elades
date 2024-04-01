<?php
require_once 'koneksi.php';

// Buat koneksi ke database
$conn = new mysqli($host, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = json_decode(file_get_contents("php://input"));

if ($data && property_exists($data, 'username')) {
    $username1 = $data->username;

    // Gunakan prepared statement untuk mencegah SQL injection
    $stmt = $conn->prepare("SELECT pengajuan_surat.*, 
    laporan.tanggal AS laporan_tanggal, 
    laporan.status,
    laporan.alasan
FROM pengajuan_surat
LEFT JOIN laporan ON pengajuan_surat.id = laporan.id
WHERE pengajuan_surat.username = ?
ORDER BY pengajuan_surat.id DESC;

    ");
    $stmt->bind_param("s", $username1);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $products = array();

        while ($row = $result->fetch_assoc()) {
            // Menambahkan setiap baris data produk ke array
            $products[] = $row;
        }

        // Mengkonversi array ke format JSON
        $json_data = json_encode($products);

        // Mengirimkan response JSON ke aplikasi Flutter
        header('Content-Type: application/json');
        echo $json_data;
    } else {
        // Mengirimkan response kosong jika tidak ada data produk
        echo "[]";
    }

    $stmt->close();
} else {
    echo "Invalid data format";
}

// Tutup koneksi ke database
$conn->close();
?>