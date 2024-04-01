<?php

    $connection = new mysqli("localhost","root","","elades");


    //get image name
    $image = $_FILES['image']['name']; 

    //create date now
    // $date = date('Y-m-d');

    //make image path
    $imagePath = 'images/'.$image; 

    $tmp_name = $_FILES['image']['tmp_name']; 

    //move image to images folder
    move_uploaded_file($tmp_name, $imagePath);

    $result = mysqli_query($connection, "UPDATE akun_user set foto_profil='$image' where username = '$id'");
    
    if($result){
        echo json_encode([
            'message' => 'Data input successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to input'
        ]);
    }
?>