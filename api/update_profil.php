<?php
// Include koneksi ke database
include 'koneksi.php';

// Menerima data dari Flutter
$data = json_decode(file_get_contents("php://input"));

// Mendapatkan nilai dari data
$usernameLama = $data->usernameLama;
$usernameBaru = $data->usernameBaru;
$Nama = $data->nama;
$noHp = $data->no_hp;
$email = $data->email;

// Masukkan nilai ke dalam database
$query = "UPDATE akun_user
SET nama = '$Nama', no_hp = '$noHp', email = '$email', username = '$usernameBaru'
WHERE username = '$usernameLama';";
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