<?php
$Sid = $_POST['Sid'];
$Sname = $_POST['Sname'];
$City = $_POST['City'];
$Sh_id = $_POST['Sh_id'];
$Password = $_POST['Password'];

if (!empty($Sid)|| !empty($Sname)|| !empty($City)|| !empty($Sh_id)|| !empty($Password)) {
    $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "from";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) 
    {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    }
     else 
     {

     $sql = "INSERT INTO salesman VALUES('$Sid','$Sname','$City','$Sh_id','$Password')";
     if ($conn->query($sql) === TRUE) 
     {
        echo "New record created successfully";
      }
      else 
      {
      echo "Error: " . $sql . "<br>" . $conn->error;
      }
  


      ?>
      <br>
      <a href="../welcome.html"> click here to go back to Admin page</a>
      <br>
      <a href="../../index.html"> click here to go back to Starting page</a>
      <?php
    }
}
else {
 echo "All field are required";
 die();
}
?>
