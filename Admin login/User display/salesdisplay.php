<?php
$conn =mysqli_connect("localhost","root","");
mysqli_select_db($conn,"from");

$records=mysqli_query($conn,"CALL `s1`();");

?>
<html>
<head>
<title>Salesman database </title>
</head>
<body>
<center><center><h1>Salesman Database</h1></center>
<table width="600" border="1" cellpadding="1" cellspacing="1">
<tr>
  <th>Salesman id</th>
  <th>Salesman name</th>
  <th>City</th>
  <th>Shop id</th>
  <th>Password</th>
</tr>
  <?php
  while($customer=mysqli_fetch_assoc($records)){
   echo "<tr>";
   echo "<td>".$customer['Sid']."</td>";
   echo "<td>".$customer['Sname']."</td>";
   echo "<td>".$customer['City']."</td>";
   echo "<td>".$customer['Sname']."</td>";
   echo "<td>".$customer['Password']."</td>";
echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
