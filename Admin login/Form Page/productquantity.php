<?php
$Sh_id = $_POST['Sh_id'];
$Pid = $_POST['Pid'];
$Pnum = $_POST['Pnum'];



if (!empty($Sh_id) || !empty($Pid) || !empty($Pnum) ) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {

     /*$INSERT = "INSERT Into productquantity (Pid,Pnum,Sh_id) values(?,?,?)";
      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("sss",$Pid,$Pnum,$Sh_id);
      $stmt->execute();*/

      $sql = "INSERT INTO productquantity values('$Pid','$Pnum','$Sh_id')";
      
      if ($conn->query($sql) === TRUE) {
          echo "New record created successfully";
      } else {
          echo "Error: " . $sql . "<br>" . $conn->error;
      }

      ?>
      <a href="salesman.html">click here to go to Salesman page</a>
      <?php

    }
}
else {
 echo "All field are required";
 die();
}
?>
