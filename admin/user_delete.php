<?php
session_start();
if(isset($_GET['id'])){
    require "conn.php";
    // $id = $conn->escape_string($_GET['id']);
    $id = filter_var($_GET['id'],FILTER_VALIDATE_INT);
    if($id){
        $delete_query = "delete from users where id=$id limit 1";
        $conn->query($delete_query);
        if($conn->affected_rows == 1){
            $_SESSION['message'] = "User({$id}) deleted successfully";
            header("location: user_select.php");
        }
        else{

            echo "something went wrong!! contact the administrator";
            exit;
        }
    }
    $conn->close();
}