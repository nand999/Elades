<?php

// Koneksi ke database SQL
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "fix_elades";

$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Endpoint untuk mengambil data laporan berdasarkan username
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['username'])) {
        $username = $_GET['username'];

        $sql = "SELECT *
                FROM pengajuan_surat AS ps
                JOIN laporan AS l ON ps.id = l.id
                WHERE ps.username = '$username'
                AND (l.status = 'Tolak' OR l.status = 'Selesai')
                ORDER BY l.tanggal DESC limit 20"; // Urutkan berdasarkan tanggal terbaru
        $result = $conn->query($sql);

        $laporan = array();
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                array_push($laporan, $row);
            }
            echo json_encode($laporan);
        } else {
            echo "0 results";
        }
    } else {
        echo "Username not provided";
    }
}

$conn->close();

?>
