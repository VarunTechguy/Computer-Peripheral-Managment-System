<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "from";
$date=date("Y-m-d");

$Ord_id = $_POST['Ord_id'];
$Sname = $_POST['Sname'];
$Cname = $_POST['Cname'];
$date1 = $_POST['date_of_purchase'];

if($date1<=$date){
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO ord (Ord_id, Sname,Cname,date_of_purchase)
VALUES ('$Ord_id', '$Sname','$Cname','$date1')";

if ($conn->query($sql) === TRUE) {
  header("Location: Orderquantity.html");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
    $conn->close();
}
}
else{
  echo"incorrect";
}


?>
