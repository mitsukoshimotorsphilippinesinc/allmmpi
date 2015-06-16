<html>

<head>

<title>Engine and Chassis Matching</title>

<?PHP
// var_dump($transfers);
?>

</head>


<body Class = "body">

<div>


<p style = "font-weight:normal;font-family:Trebuchet MS;">Enter Shipment No.
<INPUT Class = "input"
	   TYPE = "TEXT" ID = "txtshipment" VALUE ="Shipment" name ="txtshipment" onClick="SelectAll('txtshipment');">
<br/>
<p style = "font-weight:normal;font-family:Trebuchet MS;">Engine No.
<INPUT Class = "input"
	   style = "margin-left:50px;"
	   TYPE = "TEXT" ID = "txtchassis" VALUE ="Engine" name ="txtengine" onClick="SelectAll('txtengine');">
Chassis No.
<INPUT Class = "input"
	   style = "margin-left:5px;"
	   TYPE = "TEXT" ID = "txtchassis" VALUE ="Chassis" name ="txtchassis" onClick="SelectAll('txtchassis');">
<br/>

<Button Class = "btn">SAVE
</Button>

<br/>
<br/>

<table  class = "table table-bordered table-condensed"
	style="width:100%">
  <tr>
  	<th>Tag No</th>
    <th>Shipment</th>
    <th>Engine No</th>		
    <th>Chassis No</th>
    <th>SKU</th>
    <th>Model</th>
    <th>Color</th>
    <th>Action/Event</th>
  </tr>
</table>

</div>

</body>
</html>