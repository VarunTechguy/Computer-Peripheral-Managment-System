<?php
$conn =mysqli_connect("localhost","root","");
mysqli_select_db($conn,"from");

$Ordrecords=mysqli_query($conn,"CALL `order`();");

?>
<html>
<head>
<title>Order database </title>
</head>
<body>
<center><center><h1>Order Database</h1></center>
<table width="600" border="1" cellpadding="1" cellspacing="1">
<tr>
  <th>Ord_id</th>
  <th>Salesman name</th>
  <th>Customer name</th>
  <th>date_of_purchase</th>
</tr>
  <?php
  while($customer=mysqli_fetch_assoc($Ordrecords)){
   echo "<tr>";
   echo "<td>".$customer['Ord_id']."</td>";
   echo "<td>".$customer['Sname']."</td>";
   echo "<td>".$customer['Cname']."</td>";
   echo "<td>".$customer['date_of_purchase']."</td>";
echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
