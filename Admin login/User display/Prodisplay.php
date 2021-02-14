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
  <th>Product Quantity</th>
  <th>Shop id</th>
</tr>
<tr>
  <td>

  </td>
  <td></td><td></td>
</tr>
  <?php
  while($customer=mysqli_fetch_assoc($Precords)){
   echo "<tr>";
   echo "<td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$customer['Pid']."</td>";
   echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ".$customer['Pnum']."</td>";
   echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$customer['Sh_id']."</td>";


echo "</tr>";

  }
  ?></center>
</body>
</table>
</html>
