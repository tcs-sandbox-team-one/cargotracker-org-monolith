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
	$("#completionTime").datepicker({
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
#unLocode,#handlingType,#voyageNumber {
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

label.required::before {
  content: '*';
  margin-right: 4px;
  color: red;
}
.spelling {
  text-decoration-line: underline;
  }
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>


<body>
	<div style="border: 1px solid black; width: 50%;">
	<h1 style="text-align: center;" class="spelling">CargoTracker Handling</h1>
		<form name="form1" action="serviceapi/cargohandling" method="POST">
		<br>
			<label id="bookingIdLbl" style="padding-left: 84px;">Booking Id</label>
			<label for="bookingId" class="required"></label> &nbsp;<input type="text" name="bookingId" autocomplete='off' id="bookingId" required><br>
			<br><label id="bookingIdLbl" style="padding-left: 67px;">Location Code</label><label for="unLocode" class="required"></label> &nbsp;<input type="text" name="unLocode" autocomplete='off' id="unLocode" required><br>
			<br><label id="bookingIdLbl" style="padding-left: 67px;">Handling Type</label><label for="handlingType" class="required"></label> &nbsp;<input type="text" name="handlingType" autocomplete='off' id="handlingType" required><br>
			<br><label id="bookingIdLbl" style="padding-left: 10px;">Completion Time(Date)</label><label for="completionTime" class="required"></label> &nbsp;<input type="text" id="completionTime"
				name="completionTime" autocomplete='off' required><br>
			<br><label id="bookingIdLbl" style="padding-left: 69px;padding-right: 10px;">Voyage Number</label><input type="text" name="voyageNumber" autocomplete='off' id="voyageNumber"><br>
			<br><br>
			&nbsp;&nbsp;<input type="submit" value="Submit" id="submit" class="button" style="
    margin-left: 239px;">&nbsp;&nbsp;
			<input type="Reset" value="Clear" class="button">
		</form>
	</div>

	<br />

</body>
</html>
