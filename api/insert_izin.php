<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$username = $data->username;
$NIK = $data->NIK;
$Nama = $data->Nama;
$Jenis_kelamin = $data->Jenis_kelamin;
$Tempat_tanggal_lahir = $data->Tempat_tanggal_lahir;
$Kewarganegaraan = $data->Kewarganegaraan;
$Agama = $data->Agama;
$Pekerjaan = $data->Pekerjaan;
$Alamat = $data->Alamat;
$Tempat_kerja = $data->Tempat_kerja;
$Bagian = $data->Bagian;
$Alasan = $data->Alasan;
$tgl = $data->Tanggal;

// Masukkan nilai ke dalam database
$query = "INSERT INTO surat_ijin (username, NIK, Nama, Jenis_Kelamin, Tempat_tanggal_lahir, Kewarganegaraan, Agama, Pekerjaan, Alamat, Tempat_kerja, Bagian, Alasan, Tanggal) 
VALUES ('$username', '$NIK','$Nama','$Jenis_kelamin','$Tempat_tanggal_lahir','$Kewarganegaraan','$Agama','$Pekerjaan','$Alamat','$Tempat_kerja','$Bagian','$Alasan','$tgl')";
$result = mysqli_query($koneksi, $query);

if ($result) {
    $response['status'] = 'success';
    $response['message'] = 'Berhasil menambahkan surat izin';
} else {
    $response['status'] = 'error';
    $response['message'] = 'gagal menambah surat izin';
}

// Mengembalikan response ke Flutter
echo json_encode($response);
?>