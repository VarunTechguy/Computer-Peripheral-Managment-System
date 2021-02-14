<?php
$Ord_id = $_POST['Ord_id'];
$Pid = $_POST['Pid'];
$Qop = $_POST['Qop'];


if (!empty($Ord_id)|| !empty($Pid) || !empty($Qop))  {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     $INSERT = "INSERT Into ordercontains (Ord_id,Pid,Qop) values(?, ?, ?)";

     $stmt = $conn->prepare($INSERT);
     $stmt->bind_param("sss",  $Ord_id,$Pid,$Qop);
     $stmt->execute();
     echo "New record inserted sucessfully";
     $stmt->close();
     $conn->close();
    }
}
else {
 echo "All field are required";
 die();
}
?>
