<?php
$Sh_id = $_POST['Sh_id'];
$Sh_name = $_POST['Sh_name'];
$Sh_city = $_POST['Sh_city'];
$Sh_number = $_POST['Sh_number'];



if (!empty($Sh_id)|| !empty($Sh_name) || !empty($Sh_city) ||!empty($Sh_number)) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     $INSERT = "INSERT Into shop (Sh_id,Sh_name,Sh_city,Sh_number) values(?, ?, ?, ?)";

      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("ssss",  $Sh_id,$Sh_name, $Sh_city,$Sh_number);
      $stmt->execute();
      echo "New record inserted sucessfully";
      $stmt->close();
      $conn->close();
      ?>
      <br>
      <a href="Shopbranch.html"> click here to go to Shopbranch page</a>
      <?php
    }
}
else {
 echo "All field are required";
 die();
}
?>
