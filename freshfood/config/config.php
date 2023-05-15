<?php

    // if(!isset($_SERVER['HTTP_REFERER'])){
    //     header('location: http://localhost/FreshFood/index.php');
    //     exit;
    // }


 try{
        //HOST
       if (!defined('HOST')) define("HOST", "localhost");


        //DBNAME
        if (!defined('DBNAME')) define("DBNAME", "freshfood");


        //USER
        if (!defined('USER')) define("USER", "root");


        //PASS
        if (!defined('PASS')) define("PASS", "");



        $conn = new PDO("mysql:host=".HOST.";dbname=".DBNAME.";", USER, PASS);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // if($conn == true){
        //     echo "connected successfully";
        // }
        // else {
        //     echo "error";
        // }

    }

    catch(PDOEXCEPTION $e) {
        echo $e->getMessage();
    }