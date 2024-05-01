<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$username = $data->username;
$Nama = $data->nama_lengkap;
$Nik = $data->nik;
$Jenis_kelamin = $data->jenis_kelamin;
$tempat_lahir = $data->tempat_lahir;
$tanggal_lahir = $data->tanggal_lahir;
$pekerjaan = $data->pekerjaan;
$Alamat = $data->alamat;
$jumlah_penghasilan = $data->jumlah_penghasilan;
$kegunaan_surat = $data->kegunaan_surat;

// Masukkan nilai ke dalam database
$query = "INSERT INTO surat_penghasilan (username, nama_lengkap, nik, jenis_kelamin, tempat_lahir, tanggal_lahir, pekerjaan, alamat, jumlah_penghasilan, kegunaan_surat) 
VALUES ('$username','$Nama','$Nik','$Jenis_kelamin','$tempat_lahir','$tanggal_lahir','$pekerjaan','$Alamat','$jumlah_penghasilan','$kegunaan_surat')";
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