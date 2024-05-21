<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$username = $data->username;
$Nama = $data->nama;
$Jenis_kelamin = $data->jenis_kelamin;
$Alamat = $data->alamat;
$tgl = $data->tanggal_kematian;

// Masukkan nilai ke dalam database
$query = "INSERT INTO surat_kematian (username, nama, jenis_Kelamin, alamat, tanggal_kematian) 
VALUES ('$username','$Nama','$Jenis_kelamin','$Alamat','$tgl')";
$result = mysqli_query($koneksi, $query);

if ($result) {
    $response['status'] = 'success';
    $response['message'] = 'Berhasil menambahkan surat kematian';
} else {
    $response['status'] = 'error';
    $response['message'] = 'gagal menambah surat kematian';
}

// Mengembalikan response ke Flutter
echo json_encode($response);
?>