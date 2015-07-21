<fieldset >		
	<div>
		<table  class='table table-bordered'>
			<thead>				
			</thead>
			<tbody>
				<tr>
					<td><strong>Request Code:</strong></td>
					<td><?= $segment_request_summary->request_code; ?></td>
					<td><strong>Engine:</strong></td>
					<td><?= $segment_request_summary->engine; ?></td>
				</tr>	
				<tr>
					<td><strong>Requestor:</strong></td>
					<?php

					$module_code = substr($segment_request_summary->request_code, 0, 2);

					if ($module_code == 'DL') {
						$requestor_details = $this->spare_parts_model->get_dealer_by_id($segment_request_summary->dealer_id);
					} else {	
						$requestor_details = $this->human_relations_model->get_employment_information_by_id($segment_request_summary->id_number);
					}

					if (count($requestor_details) == 0) {
						echo "<td>N/A</td>";
					} else { 
						echo "<td>{$requestor_details->complete_name}</td>"; 
					}		
					?>					
					<td><strong>Chassis:</strong></td>
					<td><?= $segment_request_summary->chassis; ?></td>
				</tr>
				<tr>
					<td><strong>Status:</strong></td>
					<td><?= $segment_request_summary->status; ?></td>
					<td><strong>Brand/Model:</strong></td>					
					<?php
					if ($module_code == 'DL') { 
						$motor_brand_model_details = array();
					} else {	
						$motor_brand_model_details = $this->warehouse_model->get_motorcycle_brand_model_class_view_by_id($segment_request_summary->motorcycle_brand_model_id);						
					}

					if (count($motor_brand_model_details) == 0) {
						echo "<td>N/A</td>";
					} else { 
						echo "<td>{$motor_brand_model_details->brand_name}" . " - " . "{$motor_brand_model_details->model_name}</td>"; 
					}
				
					?>
				</tr>								
				<tr>
					<td><strong>Warehouse:</strong></td>
					<?php
					$warehouse_details = $this->spare_parts_model->get_warehouse_by_id($segment_request_summary->warehouse_id);

					if (count($warehouse_details) == 0) {
						echo "<td>N/A</td>";
					} else { 
						echo "<td>{$warehouse_details->warehouse_name}</td>"; 
					}
					?>
					<td><strong>Approved By (Warehouse):</strong></td>					
					<?php
					$warehouse_approvedby_details = $this->human_relations_model->get_employment_information_by_id($segment_request_summary->warehouse_approved_by);

					if (count($warehouse_approvedby_details) == 0) {
						echo "<td>N/A</td>";
					} else { 
						echo "<td>{$warehouse_approvedby_details->complete_name}</td>"; 
					}		
					?>					
				</tr>
				<tr>
					<?php
					if ($module_code == 'DL') {
						echo "<td><strong>P.O. Number:</strong></td>
								<td>{$segment_request_summary->purchase_order_number}</td>
								";	
					} else {			
						echo "<td><strong>MTR Number:</strong></td>
								<td>{$segment_request_summary->mtr_number}</td>
								";
					}
					?>

					<td><strong>Remarks:</strong></td>
					<?php
						if (strlen(trim($segment_request_summary->remarks)) > 0)
							echo "<td><a href='' id='view-full-remarks'><u>View Remarks</u></a></td>";
						else
							echo "<td><strong></strong></td>";
					?>
				</tr>					
			<tbody>
		</table>	
	</div>

	<div>
		<table  class='table table-striped table-bordered'>
			<thead>
				<tr>			
					<th style=''>Description</th>
					<th>SRP</th>
					<th style='width:100px;'>Discount</th>
					<th style='width:100px;'>Discount Amount</th>
					<th style='width:100px;'>Good Qty</th>
					<th style='width:100px;'>Bad Qty</th>			
					<th style='width:120px;'>Total Amount</th>
					<th style='width:120px;'>Rack Location</th>
					<th style='width:70px;'>Status</th>			
					<th style=''>Remarks</th>
				</tr>
			</thead>
			<tbody>
				<?php if(empty($segment_request_details)):?>
					<tr><td colspan='9' style='text-align:center;'><strong>No Record Found</strong></td></tr>
				<?php else: ?>
				<?php foreach ($segment_request_details as $srd): 

					$item_view_details = $this->spare_parts_model->get_item_view_by_id($srd->item_id);

					$complete_description = "[" . $item_view_details->model_name . " / " . $item_view_details->brand_name . "] " . $item_view_details->description;

				?>
				<tr>
					<td><?= $complete_description; ?></td>
					<td><?= $srd->srp; ?></td>
					<td><?= $srd->discount; ?></td>
					<td><?= $srd->discount_amount; ?></td>
					<td><?= $srd->good_quantity; ?></td>
					<td><?= $srd->bad_quantity; ?></td>
					<td><?= $srd->total_amount; ?></td>
					<td><?= $item_view_details->rack_location; ?></td>
					<td><?= $srd->status; ?></td>
					<td><?= $srd->remarks; ?></td>
				</tr>	
				<?php endforeach; ?>
				<?php endif; ?>
			<tbody>
		</table>	
	</div>
													
</fieldset>
