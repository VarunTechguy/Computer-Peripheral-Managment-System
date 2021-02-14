<?php
$error=''; //Variable to Store error message;
if(isset($_POST['submit'])){
 if(empty($_POST['Sid']) || empty($_POST['Password'])){
 $error = "Username or Password should not be empty";
 }
 else
 {
 //Define $user and $pass
 $Sid=$_POST['Sid'];
 $pass=$_POST['Password'];
 //Establishing Connection with server by passing server_name, user_id and pass as a patameter
 $conn = mysqli_connect("localhost", "root", "");
 //Selecting Database
 $db = mysqli_select_db($conn, "from");
 //sql query to fetch information of registerd user and finds user match.
 $query = mysqli_query($conn, "SELECT * FROM salesman WHERE Password='$pass' AND Sid='$Sid'");

 $rows = mysqli_num_rows($query);
 if($rows == 1){
 header("Location: Orddisplay.php"); // Redirecting to other page
 }
 else
 {
 $error = "Username of Password is Invalid";
 }
 mysqli_close($conn); // Closing connection
 }
}

?>
