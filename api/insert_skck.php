<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$username = $data->username;
$nama = $data->nama;
$nik = $data->nik;
$ttl = $data->ttl;
$kebangsaan = $data->kebangsaan;
$agama = $data->agama;
$jk = $data->jk;
$statusKawin = $data->statusKawin;
$tempatTinggal = $data->tempatTinggal;
$pekerjaan = $data->pekerjaan;



// Masukkan nilai ke dalam database
$query = "INSERT INTO skck (username, nama, nik, tempat_tgl_lahir, kebangsaan, agama, jenis_kelamin, status_perkawinan, pekerjaan, tempat_tinggal) 
VALUES ('$username', '$nama','$nik','$ttl','$kebangsaan','$agama','$jk','$statusKawin','$pekerjaan','$tempatTinggal')";
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