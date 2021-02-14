<?php
$conn =mysqli_connect("localhost","root","");
mysqli_select_db($conn,"from");

$Srecords=mysqli_query($conn,"CALL `shop`();");

?>
<html>
<head>
<title>Shop database </title>
</head>
<body>
<center><center><h1>Shop Database</h1></center>
<table width="600" border="1" cellpadding="1" cellspacing="1">
<tr>
  <th>Sh_id</th>
  <th>Sh_name</th>
  <th>Sh_city</th>
  <th>Sh_number</th>

</tr>
  <?php
  while($customer=mysqli_fetch_assoc($Srecords)){
   echo "<tr>";
   echo "<td>".$customer['Sh_id']."</td>";
   echo "<td>".$customer['Sh_name']."</td>";
   echo "<td>".$customer['Sh_city']."</td>";
   echo "<td>".$customer['Sh_number']."</td>";

echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
