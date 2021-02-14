<?php
$conn =mysqli_connect("localhost","root","");
mysqli_select_db($conn,"from");

$Precords=mysqli_query($conn,"CALL `products`();");

?>
<html>
<head>
<title>Sh database </title>
</head>
<body>
<center><center><h1>Product Database</h1></center>
<table width="600" border="1" cellpadding="1" cellspacing="1">
<tr>
  <th>Pid</th>
  <th>Pnum</th>
  <th>Sh_id</th>


</tr>
  <?php
  while($customer=mysqli_fetch_assoc($Precords)){
   echo "<tr>";
   echo "<td>".$customer['Pid']."</td>";
   echo "<td>".$customer['Pnum']."</td>";
   echo "<td>".$customer['Sh_id']."</td>";


echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
