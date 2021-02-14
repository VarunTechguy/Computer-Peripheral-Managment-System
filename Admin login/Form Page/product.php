<?php
$Pid = $_POST['Pid'];
$Pname = $_POST['Pname'];
$Myear = $_POST['Myear'];
$date=date("Y-m-d");

if (!empty($Pid)|| !empty($Pname)|| !empty($Myear)) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    if($Myear<=$date){
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     $INSERT = "INSERT Into product (Pid,Pname,Myear) values(?,?,?)";

      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("sss",$Pid,$Pname,$Myear);
      $stmt->execute();
      echo "New record inserted sucessfully";
      $stmt->close();
      $conn->close();
      ?>
      <a href="../welcome.html">click here to go back to welcome page</a>
      <?php
    }
}
else{
  echo "incorrect";
}
}
else {
 echo "All field are required";
 die();
}
?>
