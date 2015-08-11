<?php
	$upload_url = $this->config->item("media_url") . "/agents";
	$breadcrumb_container = assemble_breadcrumb();
?>

<?= $breadcrumb_container; ?>
<h2>Agents <a href='/spare_parts/maintenance/agents_add' class='btn btn-small'  style='float:right;'><i class="icon-plus"></i><span> Add New</span></a></h2>
<hr/>
<table class='table table-striped table-bordered'>
	<thead>
		<tr>
			<th style="width: 5em;">Image</th>
			<th>Complete Name</th>
			<th style="width: 25em;">Address</th>
			<th style="width: 15em;">Contact Number</th>
			<th style='width: 10em;'>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	<?php if(empty($agents)): ?>
		<tr><td colspan='5' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($agents as $r): ?>
		<tr>
			<?php			
				if (empty($r->image_filename)) {
					$image_display = "ni_". $r->gender .".png";
				} else {
					$image_display = $r->image_filename;
				}
			?>
			<td><img id="" style="width:70px; height:70px;" alt="" src="<?= $upload_url; ?>/<?= $image_display ?>"></td>
			<td><?= $r->complete_name; ?></td>
			<td><?= $r->complete_address ?></td>
			<td><?= $r->contact_number ?></td>
			<td>
				<a href='/spare_parts/maintenance/view_agent/<?= $r->agent_id ?>' class='btn btn-small btn-info' title="View"><i class="icon-search icon-white"></i></a>				
				<a href='/spare_parts/maintenance/edit_agent/<?= $r->agent_id ?>' class='btn btn-small btn-primary' title="Edit"><i class="icon-pencil icon-white"></i></a>
				<a href='/spare_parts/maintenance/delete_agent/<?= $r->agent_id ?>' class='btn btn-small btn-danger' title="Delete"><i class="icon-remove icon-white"></i></a>
			</td>
		</tr>
	<?php endforeach; ?>
	<?php endif; ?>
	</tbody>
</table>
<div>
<?= $this->pager->create_links();  ?>
</div>