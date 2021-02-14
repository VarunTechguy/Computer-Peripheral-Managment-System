<?php
$Pid = $_POST['Pid'];
$ord_id = $_POST['Ord_id'];
$Pquantity = $_POST['Pquantity'];


if (!empty($ord_id)|| !empty($Pid)|| !empty($Pquantity)) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     $INSERT = "INSERT Into sord (ord_id,Pid,Pquantity) values(?,?,?)";
      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("sss",$ord_id,$Pid,$Pquantity);
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
