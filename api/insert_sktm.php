<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$username = $data->username;
$namaBapak = $data->nama_bapak;
$ttlBapak = $data->tempat_tanggal_lahir_bapak;
$kerjaBapak = $data->pekerjaan_bapak;
$alamatBapak = $data->alamat_bapak;

$namaIbu = $data->nama_ibu;
$ttlIbu = $data->tempat_tanggal_lahir_ibu;
$kerjaIbu = $data->pekerjaan_ibu;
$alamatIbu = $data->alamat_ibu;

$namaAnak = $data->nama_anak;
$ttlAnak = $data->tempat_tanggal_lahir_anak;
$kelaminAnak = $data->jenis_kelamin_anak;
$alamatAnak = $data->alamat_anak;



// Masukkan nilai ke dalam database
$query = "INSERT INTO sktm (username, nama_bapak, tempat_tanggal_lahir_bapak, pekerjaan_bapak, alamat_bapak, nama_ibu, tempat_tanggal_lahir_ibu, pekerjaan_ibu, alamat_ibu, nama_anak, tempat_tanggal_lahir_anak, jenis_kelamin_anak, alamat_anak) 
VALUES ('$username', '$namaBapak','$ttlBapak','$kerjaBapak','$alamatBapak','$namaIbu','$ttlIbu','$kerjaIbu','$alamatIbu','$namaAnak','$ttlAnak','$kelaminAnak','$alamatAnak')";
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