<div class='alert alert-danger'><h2>Reports</h2></div>

<div class="row-fluid">
	<div class="span6">
		<div class="filter-container" style="margin-left: -50px;">
			<div class="row-fluid form-horizontal">
				<div class="control-group">
					<label class="control-label">Report Type:</label>
					<div class="controls">
						<select class="input report-type" style="width:400px;">
							<option value="IGPSM">SAMPLE A</option>
							<option value="UNILEVEL">THIS IS A SAMPLE REPORT TITLE</option>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Start Date</label>
					<div class="controls">
						<div class="input-append">
							<input type="text" class="input input-large report-start-date" />
							<span id='start-date-icon' class="add-on" style='cursor:pointer;'><i class="icon-calendar"></i></span>
						</div>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">End Date</label>
					<div class="controls">
						<div class="input-append">
							<input type="text" class="input input-large report-end-date" />
							<span id='end-date-icon' class="add-on" style='cursor:pointer;'><i class="icon-calendar"></i></span>
						</div>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">&nbsp;</label>
					<div class="controls">
						<button class="btn btn-success btn-template-download"><i class="icon-download icon-white"></i>Generate Report</button>
					</div>
				</div>			
			</div>
		</div>
	</div>
</div>

<script type="text/template">

	$(document).ready(function(){

		var currDate = new Date();
		var currYear = new Date().getFullYear();
		var yrRange = "2005:" + currYear;

		$(".template-start-date").datepicker({
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		$(".template-start-date").datepicker('setDate', currDate);
		
		$("#start-date-icon").click(function(e) {
			$(".template-start-date").datepicker("show");
		});

		$(".template-end-date").datepicker({
			'dateFormat' : "yy-mm-dd",
			'changeYear' : true,
			'yearRange' : yrRange,
			'changeMonth' : true
		});

		var _end_date = new Date();
		_end_date.setDate(_end_date.getDate()+6);
		$(".template-end-date").datepicker('setDate', _end_date);
		
		$("#end-date-icon").click(function(e) {
			$(".template-end-date").datepicker("show");
		});

	});
</script>	