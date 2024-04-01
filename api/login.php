<?php

// Include file koneksi.php
include 'koneksi.php';

try {
    // Ambil data dari body request
    $data = json_decode(file_get_contents("php://input"));

    // Periksa apakah data yang dibutuhkan tersedia
    if ($data && property_exists($data, 'username') && property_exists($data, 'password')) {
        $username = $data->username;
        $password = md5($data->password);

        // Query untuk mencari pengguna dengan username dan password yang sesuai
        $query = "SELECT * FROM akun_user WHERE username = ? AND password = ?";
        $stmt = $koneksi->prepare($query);
        if (!$stmt) {
            throw new Exception("Prepare statement failed: " . $koneksi->error);
        }

        $stmt->execute([$username, $password]);

        // Ambil hasil query
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();

        // Cek apakah pengguna ditemukan
        if ($user) {
            $response['status'] = 'success';
            $response['message'] = 'Login successful';
            $response['username'] = $user['username'];
            $response['email'] = $user['email'];
            $response['nama'] = $user['nama'];
            $response['foto_profil'] = $user['foto_profil'];
            $response['kode_otp'] = $user['kode_otp'];
            $response['created'] = $user['created'];
            // Tambahkan data pengguna lainnya ke $response jika diperlukan
        } else {
            $response['status'] = 'errorValid';
            $response['message'] = 'Invalid username or password';
        }
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Invalid data format';
    }

} catch (PDOException $e) {
    $response['status'] = 'error';
    $response['message'] = 'Database error: ' . $e->getMessage();
} catch (Exception $e) {
    $response['status'] = 'error';
    $response['message'] = 'Error: ' . $e->getMessage();
}

// Mengembalikan response dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
