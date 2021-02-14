<?php
$conn =mysqli_connect("localhost","root","");
mysqli_select_db($conn,"from");

$records=mysqli_query($conn,"CALL `customer`();");

?>
<html>
<head>
<title>Customer databas </title>
</head>
<body>
<center><center><h1>Customer Database</h1></center>
<table width="600" border="1" cellpadding="1" cellspacing="1">
<tr>
  <th>Customer name</th>
  <th>Customer id</th>
  <th>Salesman id</th>
  <th>City</th>
  <th>Phone</th>
</tr>
  <?php
  while($customer=mysqli_fetch_assoc($records)){
   echo "<tr>";
   echo "<td>".$customer['Cname']."</td>";
   echo "<td>".$customer['Cid']."</td>";
   echo "<td>".$customer['Sid']."</td>";
   echo "<td>".$customer['City']."</td>";
   echo "<td>".$customer['Phone']."</td>";
echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
