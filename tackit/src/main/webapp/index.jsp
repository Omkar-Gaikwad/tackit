<html lang="en">
<head>
<meta charset="utf-8">
<title>Url</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
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

<!--  -->
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function modal() {

		$("#myModal").modal('show');

	}
	function modal2() {
		$("#myModal").hide();
		$("#myModal2").modal('show');
	}

</script>
<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>

<!--  -->

<script type="text/javascript">
	function submiturl1(form) {
		alert("test");
		alert(document.getElementById("url").value);
	}
	function submiturl() {

		alert('inside submiturl');

		var url = $('#url').val();

		alert('url: ' + url);

		$.ajax({
			url : "tackit/user/url",
			type : "POST",
			data : "url=" + url,

			success : function(data, textStatus, jqXHR) {
				alert('success');
				modal2()
				
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


	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">

				<!-- image for user -->

				<div class="well sidebar-nav">
					<img src="am.png" class="img-rounded">
					<ul class="nav nav-list">

						<li class="nav-header">Ameya Patil</li>

						<li class="active"><a href="#">Home Board</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="MyBoards.jsp">MyBoards</a></li>

					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9">
				<div class="hero-unit">


					<h1>My Dashboard</h1>
					<p></p>
					<p></p>
					<p></p>
					<!--  
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            -->
					<!--  
            <p><a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
          -->

					<!--  
					<p>Add your pins here...!!</p> 
					<p></p><p></p><p></p>
					<input type="text" id="url"
						placeholder="http://">
					<button type="submit" id="submiturl" class="btn btn-primary"
						onclick="submiturl()">Submit</button>
-->
					<!--  -->
					<div class="bs-example">
						<!-- Button HTML (to Trigger Modal) -->
						<a class="btn btn-lg btn-primary" onclick="modal()">Launch
							Demo Modal</a>

						<!-- Modal HTML -->
						
						<div id="myModal" class="modal fade" style="width: 650px; height: 250px">
							  <div  class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title">Enter URL</h4>
									</div>
									<div class="modal-body">

										<input type="text" id="url" placeholder="http://">


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

					<!-- show selected pictureses  -->
					<div id="myModal2" class="modal fade"
						style="width: 1000px; height: 1000px" align="center">

						<div class="modal-dialog modal-lg" align="center">
							<div class="modal-content" align="center">
								<div class="modal-header" align="center">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">Add your pins here</h4>
								</div>

								<div class="modal-body">





									<div class="row">
										<c:forEach var="item" items="${imageUrls}">
											<div class="col-md-4">
												<div class="thumbnail">



													<img src="${item}" width="200" height="283">



													<div class="caption">
														<h3>Thumbnail label</h3>
														<p>...</p>
														<p>
															<a href="#" class="btn btn-primary" role="button">Button</a>
															<a href="#" class="btn btn-default" role="button">Button</a>
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>













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
					<!-- Modal 2 ends -->

				</div>
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img
								src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg"
								alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce
							dapibus, tellus ac cursus commodo, tortor mauris condimentum
							nibh, ut fermentum massa justo sit amet risus. Etiam porta sem
							malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce
							dapibus, tellus ac cursus commodo, tortor mauris condimentum
							nibh, ut fermentum massa justo sit amet risus. Etiam porta sem
							malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce
							dapibus, tellus ac cursus commodo, tortor mauris condimentum
							nibh, ut fermentum massa justo sit amet risus. Etiam porta sem
							malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>



	</div>

	<!--/.fluid-container-->


	<!-- 
			<label>Add your pins here...!!</label> <input type="text" id="url"
				placeholder="http://">
			<button type="submit" id="submiturl" class="btn btn-primary"
				onclick="submiturl()">Submit</button>
	
	 -->


	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	
	<p></p>
	<p></p>
	<p></p>
	



	<!-- Footer file -->
	<%@include file="layout/footer.jsp"%>
</body>
</html>
