<?php

// Koneksi ke database
$koneksi = mysqli_connect("localhost", "root", "", "fix_elades");

// Periksa koneksi
if (mysqli_connect_errno()) {
    echo "Koneksi ke database gagal: " . mysqli_connect_error();
    exit();
}

// Ambil data username dari permintaan
$username = $_GET['username'];

// Buat query untuk menghitung jumlah status
$query = "SELECT
            COUNT(CASE WHEN laporan.status = 'masuk' THEN 1 END) AS masuk_count,
            COUNT(CASE WHEN laporan.status = 'tolak' THEN 1 END) AS tolak_count,
            COUNT(CASE WHEN laporan.status = 'selesai' THEN 1 END) AS selesai_count
          FROM
            pengajuan_surat
          LEFT JOIN
            laporan ON pengajuan_surat.id = laporan.id
          WHERE
            pengajuan_surat.username = '$username'";

// Eksekusi query
$result = mysqli_query($koneksi, $query);

// Periksa hasil query
if ($result) {
    // Ambil hasil query
    $data = mysqli_fetch_assoc($result);
    
    // Konversi hasil menjadi format JSON
    $json_data = json_encode($data);
    
    // Tampilkan JSON
    echo $json_data;
} else {
    // Jika query gagal, tampilkan pesan error
    echo "Gagal menjalankan query: " . mysqli_error($koneksi);
}

// Tutup koneksi ke database
mysqli_close($koneksi);

?>