<style>
	th.earner-rank {
		width: 50px;
	}
	th.earner-name {
		width: 400px;
	}
	th.earner-group {
		width: 273px;
	}
</style>

<div class="page-header">
  <center><h2 style="color:gray;">Latest Announcements <small></small></h2></center>
</div>
	<div>		
		<div class="tab-pane active" id="announcements">
			<?php					
				// get all announcements
				$where = "`is_published` = 1";
				$order_by = "insert_timestamp DESC";					
				$limit_details = $this->setting_model->get_setting_by_slug('announcements_on_dashboard');
				$limit = $limit_details->value;
				
				$sql = "SELECT * FROM `am_announcement` WHERE " . $where . " ORDER BY " . $order_by . " LIMIT " . $limit;
				
				$query = $this->db->query($sql);
				$announcements = $query->result();
				
				$total = count((array)$announcements);
				
				if(empty($announcements)) {
					echo "<h2>No Announcement</h2>";
				}
			
				$ctr = 0;
				foreach($announcements as $a) {
				
					$proper_date = date("jS F Y", strtotime($a->insert_timestamp));
					
					echo "<h2 style='float:left;'>{$a->title}</h2><div style='clear:both;'></div><span style='float:left;margin-top:-15px;'><i>{$proper_date}</i></span><div style='clear:both;'></div><br/>";
					echo $a->body;
					if ($ctr < $total - 1) { 
						echo "<hr/>";
					}
					$ctr++;
				}
			
			?>
			
		</div>
	</div>
<script type="text/javascript">
	
	$(document).ready(function(){

        $('img').live('contextmenu', function(e) {
	        return false;
	    }); 
	    $('img').live('dragstart', function(e) {
	        return false;
	    }); 
	});

	
</script>
