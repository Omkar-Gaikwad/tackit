<!DOCTYPE html><html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="product" content="Metro UI CSS Framework">
<meta name="description" content="Simple responsive css framework">
<meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">
<meta name="keywords"
	content="js, css, metro, framework, windows 8, metro ui">

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<link href="css/metro-bootstrap.css" rel="stylesheet">
<link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
<link href="css/iconFont.css" rel="stylesheet">
<link href="css/docs.css" rel="stylesheet">
<link href="js/prettify/prettify.css" rel="stylesheet">

<!-- Load JavaScript Libraries -->
<script src="js/jquery/jquery.min.js"></script>
<script src="js/jquery/jquery.widget.min.js"></script>
<script src="js/jquery/jquery.mousewheel.js"></script>
<script src="js/prettify/prettify.js"></script>


<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Metro UI CSS JavaScript plugins -->
<script src="js/load-metro.js"></script>

<!-- Local JavaScript -->
<script src="js/docs.js"></script>
<script src="js/github.info.js"></script>



<!-- jQuery Form Validation code -->


<title>Metro UI CSS : Metro Bootstrap CSS Library</title>

<style>
</style>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap-responsive.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="bootstrap/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen" type="text/css">



</head>
<body class="metro">
<%@include file="layout/header.jsp"%>

 
 <div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">

				<!-- image for user -->

				<div class="well sidebar-nav">
					<img src="am.png" class="img-rounded">
					<ul class="nav nav-list">

						<li class="nav-header">  <%=session.getAttribute("username") %></li>

						<li class="active"><a href="#">Home Board</a></li>
						<li><a href="#">Profile</a></li>
						<li><a href="#">Settings</a></li>
						<li><a href="MyBoards.jsp">MyBoards</a></li>

					</ul>
				</div>
				</div>
				
				
				
				
				<div  >
				
					<c:forEach var="image" items="${imageList}">
					<div class="col-sm-6 col-md-4" >
						<div class="thumbnail" >
							 ${image} 
						</div>
					</div>	
						</c:forEach>
					
				
				</div>
				
				
				

</div>
 </div>
 
 </body>
</html>