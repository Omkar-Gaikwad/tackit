
<html lang="en">
<head>
<meta charset="utf-8">
<title>Signup</title>

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



<script type="text/javascript">

function checkPasswordMatch(){
	//var checkPasswordMatch = function() {
	    var password = $("#password").val();
	    var rePassword = $("#reEnterPasswordInput").val();
		
	    if (password != rePassword)
	        $("#divCheckPasswordMatch").html("Passwords do not match!");
	    else{
	        $("#divCheckPasswordMatch").html("");  
	    }
	}





		
		
	   
function uploadFormData(){
	$("#reEnterPasswordInput").keyup(checkPasswordMatch());

	
	 
	   var fname = $('#login-firstname').val();
	   var lname = $('#login-lastname').val();
	   var email = $('#login-email').val();
	   var password = $('#password').val();

	   
		$.ajax({
			url : "tackit/user/signup",
		    type: "POST",
		    data : "fname=" + fname + "&lname=" + lname + "&email=" + email + "&password=" + password,
		   
		    success:function(data, textStatus, jqXHR){
		   
		    	window.location.href="login.jsp";
		    },
		    error: function(jqXHR, textStatus, errorThrown){
		    	alert('Could not process request.. ' + errorThrown);
		    }
		});
}


</script>
</head>
<body>
<%@include file="layout/header.jsp" %>

<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="NewUserSignUp">
							<table cellpadding="5px">
								<!--Body content-->
								<tr>
  									<h2>Create an account here</h2>
								</tr>
								<tr>
									<td><h5>First Name</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="login-firstname" class="required" placeholder="First Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Last Name</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="login-lastname" class="required" placeholder="Last Name">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Email</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="email" id="login-email" class="required email" placeholder="Email ID">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Password</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="password" name="passwordInput" class="required" placeholder="Password">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Re-enter Password</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="password" id="reEnterPasswordInput" name="reEnterPasswordInput" class="required" placeholder="Re-enter Password" onChange="checkPasswordMatch();">
										</div></td>
									<td><div class="registrationFormAlert" id="divCheckPasswordMatch"></div></td>
								</tr>
								<tr></tr>
								<!--  
								<tr>
									<td><h5>You are a</h5></td>
									<td></td>
									<td><div class="col-lg-6">
   											 <div class="input-group">
      											<span class="input-group-addon">
        											<input name="userTypeInput" id="userTypeInputDeveloper" type="radio" class="required" value="0">
      											</span>
      											<h2 class="label label-primary">Project Owner</h2>
      											<span>
      												<input name="userTypeInput" id="userTypeInputTester" type="radio" class="required" value="1">
      											</span>
      											<h2 class="label label-primary">Tester</h2>
    										</div>
  										</div></td>
								</tr>
								-->
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<button id="signup" class="btn btn-primary" type="button" onclick="uploadFormData()">Register</button>
							<!--  		
									<input type="submit" class="btn btn-default" id="signup" value="Sign Up"/>
							-->
								</div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	



































	 <script>
        function PassVerify(){
            var pass1 = $('#password').val();
            var pass2 = $('#confirmpassword').val();
            var message = document.getElementById('confirmMessage');
            var badColor = "red";
            if(password == confirmpassword){
                message.innerHTML = "";
            }else{
                message.style.color = badColor;
                message.innerHTML = "Passwords Do Not Match..";
            }
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
        function validateAndSubmit(){
            
        }
        </script>

	
	<%@include file="layout/footer.jsp" %>
</body>
</html>



