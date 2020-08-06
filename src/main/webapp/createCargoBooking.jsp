<!-- tag::comment[] -->
<!--
  Copyright (c) 2017 IBM Corporation and others.
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the Eclipse Public License v1.0
  which accompanies this distribution, and is available at
  http://www.eclipse.org/legal/epl-v10.html
 
  Contributors:
      IBM Corporation - initial API and implementation
-->
<!-- end::comment[] -->

<html>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#destArrivalDeadline").datepicker({
		dateFormat:'yy-mm-dd'});

	$("#bookingAmount").keydown(function(event) {
        // Allow only backspace and delete
        if ( event.keyCode == 46 || event.keyCode == 8 ) {
            // let it happen, don't do anything
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.keyCode < 48 || event.keyCode > 57 ) {
                event.preventDefault(); 
            }   
        }
    });
});

</script>
<style>
#originLocation,#destLocation {
  text-transform: uppercase;
}

.button {
 background-color: #EEF39E; color: black;
  border: yes;
   padding: 4px 6px;
 }

div {
  background-color: #f2f2f2;
  padding: 5px;
}

.spelling {
  text-decoration-line: underline;
  }
  
  label.required::before {
  content: '*';
  margin-right: 4px;
  color: red;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>


<body>
	
	<div style="border: 1px solid black; width: 50%;">
	
	<h1 style="text-align: center;" class="spelling">CargoTracker booking</h1>
		<form name="form1" action="serviceapi/cargobooking" method="POST">
		<br>
			&nbsp;&nbsp;<label id="bookingIdLbl" style="padding-left: 115px;">Booking Amount</label>
			<label for="bookingAmount" class="required"></label>&nbsp;<input type="text" name="bookingAmount" autocomplete='off' id="bookingAmount" required><br>
			<br> &nbsp;&nbsp;<label id="bookingIdLbl" style="padding-left: 120px;">Origin Location</label>
			<label for="originLocation" class="required"></label> &nbsp;<input type="text" name="originLocation" autocomplete='off' id="originLocation" required><br>
			<br> &nbsp;&nbsp;<label id="bookingIdLbl" style="padding-left: 89px;">Destination Location</label>
			<label for="destLocation" class="required"></label> &nbsp;<input type="text" name="destLocation" autocomplete='off' id="destLocation" required><br>
			<br> &nbsp;&nbsp;<label id="bookingIdLbl">Destination Arrival Deadline(Date)</label>
			<label for="destArrivalDeadline" class="required"></label> &nbsp;<input type="text" id="destArrivalDeadline"
				name="destArrivalDeadline" autocomplete='off' required><br>
			<br><br>
			&nbsp;&nbsp;<input type="submit" value="Submit" class="button" style="
    margin-left: 239px;">&nbsp;&nbsp;<input type="Reset" value="Clear" class="button">
		</form>
	</div>

	<br />

	<!-- <div style="border: 1px solid black; width: 50%;">
		<h2>List all records:</h2>
		<a href="rest/service/list">Get Full List</a>
	</div> -->



</body>
</html>
