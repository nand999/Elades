<?php
require_once 'koneksi.php';

// Buat koneksi ke database
$conn = new mysqli($host, $username, $password, $database);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query untuk mengambil data produk
$sql = "SELECT * FROM berita
ORDER BY id_berita DESC
LIMIT 20";

$result = $conn->query($sql);

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

// Tutup koneksi ke database
$conn->close();
?>