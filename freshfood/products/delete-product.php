<?php

    if(!isset($_SERVER['HTTP_REFERER'])){
        header('location: http://localhost/FreshFood/index.php');
        exit;
    }

?>

<?php require "../includes/header.php"; ?>
<?php require "../config/config.php"; ?>


<?php

    if (!isset($_SESSION['username'])) {

        echo " <script>window.location.href='".APPURL."';</script>";

    }


    if(isset($_POST['delete'])) {
        $id = $_POST['id'];
        
        $delete = $conn->prepare("DELETE FROM cart WHERE id='$id'");
        $delete->execute();
    }


?>



<?php require "../includes/footer.php"; ?>