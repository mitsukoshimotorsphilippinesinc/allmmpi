<?php	
	$breadcrumb_container = assemble_breadcrumb();

?>

<?= $breadcrumb_container; ?>

<div class='alert alert-danger'>
	<h2>Announcements <a href='/operations/announcement/add' class='btn btn-small' style="float:right; margin-top: 5px; margin-right: -30px;"><i class="icon-plus"></i><span> Add New</span></a></h2>
</div>
<hr/>
<table class='table table-striped table-bordered'>
	<thead>
		<tr>
			<th>Title</th>
			<th style='width:64px;'>Published?</th>
			<th style='width:120px;'>&nbsp;</th>	
		</tr>
	</thead>
	<tbody>
	<?php if(empty($announcements)): ?>
		<tr><td colspan='5' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($announcements as $a): ?>
		<tr>
			<td><?= $a->title; ?></td>
			<td><?= ($a->is_published) ? 'Yes' : 'No'; ?></td>
			<td>
				<a href='/operations/announcement/view/<?= $a->announcement_id ?>' class='btn btn-small btn-info' title="View"><i class="icon-search icon-white"></i></a>
				<a href='/operations/announcement/edit/<?= $a->announcement_id ?>' class='btn btn-small btn-primary' title="Edit"><i class="icon-pencil icon-white"></i></a>
				<a href='/operations/announcement/delete/<?= $a->announcement_id ?>' class='btn btn-small btn-danger' title="Delete"><i class="icon-remove icon-white"></i></a>
			</td>
		</tr>
	<?php endforeach; ?>
	<?php endif; ?>
	</tbody>
</table>
<div>
<?= $this->pager->create_links();  ?>
</div>
	