<?php
$Sh_id = $_POST['Sh_id'];
$Bname = $_POST['Bname'];

if (!empty($Sh_id)|| !empty($Bname)) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     $INSERT = "INSERT Into shopbranch (Sh_id,Bname) values(?, ?)";

      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("ss",  $Sh_id,$Bname);
      $stmt->execute();
      echo "New record inserted sucessfully";
      $stmt->close();
      $conn->close();
      ?>
      <br>
      <a href="productquantity.html"> click here to go to Product Quantity page</a>
      <?php
    }
}
else {
 echo "All field are required";
 die();
}
?>
