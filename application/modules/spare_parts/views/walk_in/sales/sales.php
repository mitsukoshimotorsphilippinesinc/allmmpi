
<div class='alert alert-danger'><h2>Walk-In Sales<a id = "btn suspend" class = 'btn' style = "float:right;" href = "add_new_tr">Suspend</a> <a id = "btn suspend" class = 'btn' style = "float:right; margin-right:5px;" href = "add_new_tr">Finalize</a></div>

<span>C.O. No.</span>
<input id = "co_number" name = "co_number" placeholder="C.O. Number"  TYPE = "TEXT">
<button id="add_item" name="add_item" class='btn' style="margin-top:-10px;float:right;"><span>Add Item</span></button>
<table id = "parts_list" class='table table-striped table-bordered'>
	<thead>
		<tr>			
			<th style = "width:150px;">SKU</th>
			<th style = "width:500px;">Description</th>
			<th style = "width:70px;">Unit</th>
			<th style = "width:100px;">SRP</th>
			<th style = "width:100px;">QTY</th>
			<th style = "width:80px;">Discount</th>
			<th style = "width:200px;">Total Amount</th>
			<th style = "width:200px;">Action</th>
		</tr>
	</thead>
<table>

<SCRIPT TYPE = "text/javascript">
	
	$('#add_item').click(function(){

		b.request({
			url: "/spare_parts/walk_in/add_new_item",
			data:{
			
			},
			on_success: function(data){
				if (data.status == "1") {
					hideLoading();
					proceedAddItemModal = b.modal.new({
					title: 'Add Item',
					width:1000,
					disableClose: false,
					html: data.data.html,
					buttons:{
					'Add' : function(){
					}
				}
			})
			proceedAddItemModal.show();
		}
			}
		});
	});

</SCRIPT>