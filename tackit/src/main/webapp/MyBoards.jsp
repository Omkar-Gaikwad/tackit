<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">
    <meta name="keywords" content="js, css, metro, framework, windows 8, metro ui">

 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

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
    
    
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

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

<div id="header">
	<div class="navbar navbar-inverse navbar-static-top">
		<div id="headerNav" class="navbar-inner">
			<a class="brand" href="/project-vars/"><span style="color: green; margin: 0px 10px 0px 10px;">Tack<span style="color: yellow;">!</span>T</span></a>
			<% if(session.getAttribute("username") != null) { %>
			<ul class="nav">
				<li><a href="/project-vars/viewProjects.htm" style="color: white;">View Projects</a></li>
			</ul>
			<% } %>
			<% if(session.getAttribute("username") == null) { %>
			<ul id="loginMenu" class="nav" style=" float:right;">
				<li><a href="/project-vars/login.htm" style="color: white;">Login</a></li>
				<li><a href="/project-vars/signup.htm" style="color: white;">Sign Up</a></li>
			</ul>
			<% } else { %>
			<ul id="loggedInMenu" class="nav" style=" float:right; padding-right: 35px;">
				<li class="dropdown" id="loggedInDown">
					<%--
					<c:choose>
					    <c:when test="${user.isTester}">
					    	<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${user.firstName} <span class="caret"></span></a>
					    </c:when>
	 					<c:otherwise>--%>
	 						<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${username} <span class="caret"></span></a>
	 				<%--	</c:otherwise>
 					</c:choose>
					--%>
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
<nav class="navigation-bar white">
    <nav class="navigation-bar-content">
                    <a href="/" class="element"><span class="icon-grid-view"></span> 2 Boards</a>
                    <span class="element-divider"></span>
                    <a class="pull-menu" href="#"></a>
					<a href="/" class="element"><span class="icon-grid-view"></span> 4 Pins</a>
                    <span class="element-divider"></span>
					<a href="/" class="element"><span class="icon-grid-view"></span> 1 Like</a>
							        
			       
			      
			        
					<div class="element place-right">
                    <a href="/" class="element" class="element place-right"><span class="icon-grid-view"></span> 0 Followers</a>
                    </div>
                    
					<div class="element place-right">
                     <a href="/" class="element" class="element place-right"><span class="icon-grid-view"></span> 1 Following</a>
                    </div> 
            <span class="element-divider"></span>
             <div class="element place-right">
                     <button class="element" id="createboard"><span class="icon-grid-view"></span> Create Board</button>
                    
                    </div>
                    <span class="element-divider"></span>
                    <script>
                    $("#createboard").on('click', function(){
                        $.Dialog({
                            overlay: true,
                            shadow: true,
                            flat: true,
                            draggable: true,
                            icon: '<span class="icon-grid-view"></span>',
                            title: 'Flat window',
                            content: '',
                            padding: 10,
                            width: 500,
                            onShow: function(_dialog){
                                var content = 
                                        '<label>Board Name</label>' +
                                        '<div class="input-control text required"><input type="text" name="boardname" id="BoardName"></div>' +
                                        '<label>Description</label>'+    
                                        '<div class="input-control textarea">'+
                                        '<textarea id="BoardDescription">amol</textarea>'+
                                        '</div>'+
                                        '<div>' +
                                        '<button class="button" id="createboardbutton" onclick="func()" >Create</button>&nbsp;'+
                                        '</div>';
                                                                        
                                $.Dialog.title("Create Board");
                                $.Dialog.content(content);
                            }
                        });
                    });
                    
                    
                    function func()
                    {
                    	alert('inside submiturl');

                		var BoardName = $('#BoardName').val();
                		var BoardDescription = $('#BoardDescription').val();
                		alert('BoardName: ' + BoardName);

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
    </nav>
</nav>

    <div class="tile-area tile-area-white">
  
  <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform" data-easing="easeInElastic">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
               <div class="tile-status bg-dark opacity">
                            <span class="label">effect: slideLeft</span>
                        </div>

            </div>

<div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform" data-easing="easeInElastic">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

                <div class="brand bg-black">
        <span class="label fg-white">Board2</span>
    </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform" data-easing="easeInElastic">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg" data-easing="easeInElastic">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

                <div class="brand bg-black">
        <span class="label fg-white">Board3</span>
    </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform" data-easing="easeInElastic">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

               <div class="tile-status bg-dark opacity">
                            <span class="label">Board4</span>
                        </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

               <div class="tile-status bg-dark opacity">
                            <span class="label">Board5</span>
                        </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

                 <div class="tile-status bg-dark opacity">
                            <span class="label">Board6</span>
                        </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

                <div class="brand bg-black">
        <span class="label fg-white">Board7</span>
    </div>
            </div>
            <div class="tile double double-vertical live" data-role="live-tile" data-effect="slideUpDown" data-click="transform">
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.nasa.gov/sites/default/files/timelapse_sun.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://www.wired.com/images_blogs/rawfile/2013/11/offset_WaterHouseMarineImages_62652-2-660x440.jpg">
                </div>
                <div class="tile-content image">
                    <img src="http://blog.gettyimages.com/wp-content/uploads/2013/01/Siberian-Tiger-Running-Through-Snow-Tom-Brakefield-Getty-Images-200353826-001.jpg">
                </div>

                 <div class="brand bg-black">
        <span class="label fg-white">Board8</span>
    </div>
            </div>
			</div>
			
    </body>
</html>

