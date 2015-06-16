
<div class = "span12">
<?PHP
 //var_dump($transfers);
?>

<div Class = "body">

<div>

<div class = "span6">
<p style = "font-weight:bold;font-family:Trebuchet MS;">Shipment No.
<INPUT Class = "input"
	   style = "width: 140px;"
	   TYPE = "TEXT" ID = "txtshipment" name ="txtshipment" onClick="SelectAll('txtshipment');">
Tag No	   
<INPUT Class = "input"
	   style = "margin-left:30px;width: 140px;"
	   TYPE = "TEXT" ID = "txttagno" name ="txttagno" onClick="SelectAll('txttagno');">
<br/>

<p style = "font-weight:bold;font-family:Trebuchet MS;">Engine No.
<INPUT Class = "input"
	   style = "margin-left:15px;width: 140px;"
	   TYPE = "TEXT" ID = "txtengine" name ="txtengine" onClick="SelectAll('txtengine');">
Chassis No.
<INPUT Class = "input"
	   style = "margin-left:5px;width: 140px;"
	   TYPE = "TEXT" ID = "txtchassis" name ="txtchassis" onClick="SelectAll('txtchassis');">
<br/>

<p style = "font-weight:bold;font-family:Trebuchet MS;">Old SKU
<INPUT Class = "input"
	   style = "margin-left:30px;width: 140px;"
	   TYPE = "TEXT" ID = "txtoldsku" name ="txtoldsku" onClick="SelectAll('txtoldsku');">
New SKU
<INPUT Class = "input"
	   style = "margin-left:18px;width: 140px;"
	   TYPE = "TEXT" ID = "txtnewsku" name ="txtnewsku" onClick="SelectAll('txtnewsku');">
<br/>

<Button Class = "btn">SAVE
</Button>

<br/>
<br/>
</div>

<div class = "span5">
	<table class = "table table-bordered table-condensed">
		<tbody>
			<tr style = "width:100px;">
				<td>Model:</td>
			</tr>
			<tr style = "width:100px;">
				<td>Brand:</td>
			</tr>
			<tr style = "width:100px;">
				<td>Color:</td>
			</tr>
			<tr style = "width:100px;">
				<td>Class:</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="clearfix"></div>

<div class = "span12">
<table  class = "table table-bordered table-condensed"
	style="width:100%">
	<thead>
  		<tr>
  			<th style = "text-align:center;">Tag No</th>
    		<th style = "text-align:center;">Shipment</th>
    		<th style = "text-align:center;">Engine No</th>		
    		<th style = "text-align:center;">Chassis No</th>
    		<th style = "text-align:center;">SKU</th>
    		<th style = "text-align:center;">Model</th>
    		<th style = "text-align:center;">Color</th>
    		<th style = "text-align:center;">Action/Event</th>
  		</tr>
  	</thead>
  	<tbody>
  		 <?php if(empty($transfers)):?>
			<tr><td colspan='9' style='text-align:center;'><strong>No Records Found</strong></td></tr>
			<?php else: ?>
			<?php foreach ($transfers as $t): ?>
			<tr>
				<td style = "text-align:right;"><?= $t->TagNo; ?></td>
				<td><?= $t->ShipmentNo; ?></td>
				<td><?= $t->Engine; ?></td>
				<td><?= $t->Chassis; ?></td>
				<td style = "text-align:right;"><?= $t->OldSKU; ?></td>
				<td style = "text-align:center;"><?= $t->Model; ?></td>
				<td style = "text-align:center;"><?= $t->Color; ?></td>
				<td>
					<button class = "btn1"><span>Disassemble</span></button>
				</td>
			</tr>
			<?php endforeach; ?>
		<?php endif; ?>
  	</tbody>	
</table>
</div>
<div class="clearfix"></div>
<div>
	<?= $this->pager->create_links($search_url);  ?>
</div>
</div>

</div>
</div>
<br/>
<div class="clearfix"></div>
