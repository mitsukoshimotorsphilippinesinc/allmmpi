<div class="alert alert-info">
	<h2>FAQs <a href='/cms/faqs/add' class='btn btn-small' style="float:right;margin-top:5px;margin-right:-30px;"><i class="icon-plus"></i><span> Add New</span></a></h2>
</div>
<hr/>
<table class='table table-striped table-bordered'>
	<thead>
		<tr>
			<th>Question</th>
			<th style="width: 63px;">Published?</th>
			<th style="width:72px;">Ordering</th>
			<th style='width:109px;'>&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	<?php if(empty($faqs)): ?>
		<tr><td colspan='4' style='text-align:center;'><strong>No Records Found</strong></td></tr>
	<?php else: ?>
	<?php foreach ($faqs as $f): ?>
		<tr>
			<td><?= $f->question; ?></td>
			<td><?= ($f->is_published) ? 'Yes' : 'No'; ?></td>
			<td>
				<?php if($f->ordering > 1): ?>
				<a href='/cms/faqs/order/up/<?= $f->faqs_id ?>' class='btn btn-small btn-primary' title="Up" ><i class="icon-arrow-up icon-white"></i></a>
				<?php endif; ?>
				<?php if($f->ordering < $max_order): ?>
				<a href='/cms/faqs/order/down/<?= $f->faqs_id ?>' class='btn btn-small btn-primary' title="Down" ><i class="icon-arrow-down icon-white"></i></a>
				<?php endif; ?>
			</td>
			<td>
				<a href='/cms/faqs/view/<?= $f->faqs_id ?>' class='btn btn-small btn-info' title="View"><i class="icon-search icon-white"></i></a>
				<a href='/cms/faqs/edit/<?= $f->faqs_id ?>' class='btn btn-small btn-primary' title="Edit"><i class="icon-pencil icon-white"></i></a>
				<a href='/cms/faqs/delete/<?= $f->faqs_id ?>' class='btn btn-small btn-danger' title="Delete"><i class="icon-remove icon-white"></i></a>
			</td>
		</tr>
	<?php endforeach; ?>
	<?php endif; ?>
	</tbody>
</table>
<div>
<?= $this->pager->create_links();  ?>
</div>
<script type="text/javascript">
</script>