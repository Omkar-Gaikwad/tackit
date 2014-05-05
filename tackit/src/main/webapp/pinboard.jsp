<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>PinBoard</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap-responsive.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="bootstrap/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen" type="text/css">
<script type="text/javascript" src="jsbootstrap/bootstrap.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.min.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-dropdown.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-alert.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-button.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-carousel.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-scrollspy.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-modal.js" /></script>

<script type="text/javascript">
	function modal() {

		$("#myModal").modal('show');

	}
	
	function submiturl() {

		alert('inside submiturl');

		var BoardName = $('#BoardName').val();
		var BoardDescription = $('#BoardDescription').val();
		//alert('url: ' + url);

		$.ajax({
			url : "tackit/user/pinboard",
			type : "POST",
			data : "BoardName=" + BoardName + "&BoardDescription="+BoardDescription,

			success : function(data, textStatus, jqXHR) {
				alert('success');
								
				//window.location.href = "homepage.jsp";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('Could not process request.. ' + errorThrown);
			}
		});
	}

</script>


</head>
<body>
<!-- Header file -->
	<%@include file="layout/header.jsp"%>


<div class="bs-example">

<a class="btn btn-lg btn-primary" onclick="modal()">Create Board</a>







	<div id="myModal" class="modal fade" >
							  <div  class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Create Board</h4>
									</div>
									<div class="modal-body">
										<p>Board Name</p>
										<input type="text" id="BoardName" placeholder="e.g Cricket">
										<p>Board Description</p>
										<textarea  id="BoardDescription" rows="3" placeholder="e.g Sachin is GOD of Cricket"></textarea>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" id="submiturl" class="btn btn-primary"
											onclick="submiturl()">Submit</button>

									</div>
								</div> 
								
			
							</div> 
							
						</div> 



</div>






	<!-- Footer file -->
	<%@include file="layout/footer.jsp"%>

</body>
</html>