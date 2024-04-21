<?php

// Include file koneksi.php
include 'koneksi.php';

try {
    // Ambil data dari body request
    $data = json_decode(file_get_contents("php://input"));

    // Periksa apakah data yang dibutuhkan tersedia
    if ($data && property_exists($data, 'username')) {
        $username = $data->username;

        // Query untuk menghapus pengguna dengan username yang sesuai
        $query = "DELETE FROM akun_user WHERE username = ? ";
        $stmt = $koneksi->prepare($query);
        if (!$stmt) {
            throw new Exception("Prepare statement failed: " . $koneksi->error);
        }

        // Eksekusi query dengan memberikan parameter username
        $stmt->execute([$username]);

        // Response sukses jika query berhasil dieksekusi
        $response['status'] = 'success';
        $response['message'] = 'User deleted successfully';
    } else {
        // Response error jika data yang dibutuhkan tidak tersedia
        $response['status'] = 'error';
        $response['message'] = 'Invalid data format';
    }

} catch (PDOException $e) {
    // Response error jika terjadi kesalahan database
    $response['status'] = 'error';
    $response['message'] = 'Database error: ' . $e->getMessage();
} catch (Exception $e) {
    // Response error jika terjadi kesalahan lainnya
    $response['status'] = 'error';
    $response['message'] = 'Error: ' . $e->getMessage();
}

// Mengembalikan response dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);
?>