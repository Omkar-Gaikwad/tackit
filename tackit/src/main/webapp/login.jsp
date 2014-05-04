
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap.css" rel="stylesheet" media="screen"
	type="text/css">
<link href="bootstrap/bootstrap-responsive.css" rel="stylesheet"
	media="screen" type="text/css">
<link href="bootstrap/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen" type="text/css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap.min.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-dropdown.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-alert.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-button.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-carousel.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-scrollspy.js" /></script>
<script type="text/javascript" src="jsbootstrap/bootstrap-modal.js" /></script>


<script type="text/javascript">

function userLogin(){
	 alert('inside Login page');
	   var email = $('#email').val();
	   var password = $('#password').val();
	 
	 alert('Username : '+email);
	   
		$.ajax({
			url : "tackit/user/login",
		    type: "POST",
		    data : "email=" + email + "&password=" + password,
		   
		    success:function(data, textStatus, jqXHR){
		    	alert('success');
		    	window.location.href="index.jsp";
		    },
		    error: function(jqXHR, textStatus, errorThrown){
		    	alert('Could not process request.. ' + errorThrown);
		    }
		});
}
function EmailVerify() {
    var email = document.getElementById('email').value;
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var message = document.getElementById('emailMessage');
    var badColor = "red";
    message.style.color = badColor;

    if (!filter.test(email)) {   
       $('#emailMessage').html("Please Enter valid Email");
       return false;
    }else{
       $('#emailMessage').html("");
       $.get('/check_email?email=' + email, function(data){
            if(data == "true")
                $('#emailMessage').html("Email already exists");
       });
    }
    return true;
}




</script>


</head>
<body>
	
<div id="header">
	<div class="navbar navbar-inverse navbar-static-top">
		<div id="headerNav" class="navbar-inner">
			<a class="brand" href="/project-vars/"><span style="color: green; margin: 0px 10px 0px 10px;">Tack<span style="color: yellow;">!</span>T</span></a>
			<% if(session.getAttribute("user") != null) { %>
			<ul class="nav">
				<li><a href="/project-vars/viewProjects.htm" style="color: white;">View Projects</a></li>
			</ul>
			<% } %>
			<% if(session.getAttribute("user") == null) { %>
			<ul id="loginMenu" class="nav" style=" float:right;">
				<li><a href="/project-vars/login.htm" style="color: white;">Login</a></li>
				<li><a href="/project-vars/signup.htm" style="color: white;">Sign Up</a></li>
			</ul>
			<% } else { %>
			<ul id="loggedInMenu" class="nav" style=" float:right; padding-right: 35px;">
				<li class="dropdown" id="loggedInDown">
					<c:choose>
					    <c:when test="${user.isTester}">
					    	<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${user.firstName} <span class="caret"></span></a>
					    </c:when>
	 					<c:otherwise>
	 						<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${user.firstName} <span class="caret"></span></a>
	 					</c:otherwise>
 					</c:choose>
					
					<ul class="dropdown-menu">
				      <li><a href="/project-vars/showProfile.htm">Profile</a></li>
				      <li><a href="/project-vars/logout.htm">Logout</a></li>
				    </ul>
			    </li>
			</ul>
			<% } %>
		</div>
	</div>
</div>
	
	<!-- Sumant Try -->

	<div id="container" style="padding-top: 40px;" align="center">
		<div class="container-fluid">
			<div id="loginOptions" style="margin: 80px 0px 0px 50px;">
				<div></div>
				<div class="span5" style="margin-right: -30px;">
					<div
						style="background-color: ghostwhite; -webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding: 30px;">
						<h3>Sign In</h3>
						<table>
							<tr>
								<td><label for="inputEmail3" class="col-sm-2 control-label">Email</label></td>
								<td><div class="col-sm-10">
										<input type="email" class="form-control" id="email"
											placeholder="Your registered email"  onChange="EmailVerify();">
									</div></td>
							</tr>
							<tr>
								<td><label for="inputPassword3" class="col-sm-2 control-label">Password</label></td>
								<td><div class="col-sm-10"> <input type="password" class="form-control" id="password"
											placeholder="Password"">
									</div></td>
							</tr>
							<tr>
								<td></td>
								<td><div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary" style= "margin-left:45px" id="login"  onclick="userLogin()">Login</button>
									</div></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="divider-vertical"></div>
				<div class="span1" style="margin-top: 80px;">
					<h3>OR</h3>
				</div>
				<div class="divider-vertical"></div>

				<div class="span5" style="height:240px">
					<div
						style="background-color: ghostwhite; height:180px; -webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding: 30px;">
						<h4>Don't have an account!</h4>
						<button class="btn btn-large btn-success" type="button" onclick="window.location.href='signup.jsp'">Sign up</button>
						<h4>for enjoying free and secured 1GB of storage</h4>
						
						
						<!--  <a href="signup.jsp"> Sign Up Here </a> -->
					</div>
				</div>
			</div>
		</div>

	
	</div>

<div id="cnt" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body…</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>



	<div id="footer">
		<div class="navbar navbar-inverse navbar-fixed-bottom">
			<div class="navbar-inner" style="min-height: 70px;">
				<div style="margin: 10px 5px 10px 5px; float: left;">
					<span style="color: white;">Copyright &copy; Tack!T</span>
				</div>
				<div style="margin: 10px 10px 10px 10px; float: right;">
					<a href="about.htm" style="color: white;">About Us</a> <span
						style="color: white;">|</span> <a data-toggle="modal" href="#" style="color: white;">Contact
						Us</a> <span
						style="color: white;">|</span><a data-toggle="modal" href="#" style="color: white;">Careers</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>



