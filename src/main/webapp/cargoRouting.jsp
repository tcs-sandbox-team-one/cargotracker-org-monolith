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

<style>
#bookingId {
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
	
	<h1 style="text-align: center;" class="spelling">CargoTracker Routing</h1>
		<form name="form1" action="serviceapi/cargorouting" method="POST">
		<br>
		<label id="bookingIdLbl" style="padding-left: 84px;">Booking Id</label>
			<label for="bookingId" class="required"></label>&nbsp;
			<input type="text" name="bookingId" autocomplete='off' id="bookingId" required><br>
			
			<br><br>
			&nbsp;&nbsp;<input type="submit" value="Submit" id="submit" class="button" style="
    margin-left: 239px;">&nbsp;&nbsp;<input type="Reset" value="Clear" class="button">
		</form>
	</div>

	<br />


</body>
</html>
