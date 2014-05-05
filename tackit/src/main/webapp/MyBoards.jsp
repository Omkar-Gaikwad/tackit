<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">
    <meta name="keywords" content="js, css, metro, framework, windows 8, metro ui">

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





    
    
</head>
<body class="metro">

<!-- Header file -->
	<%@include file="layout/header.jsp"%>

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
                    <script type="text/javascript">
                    $("#createboard").on('click', function(){
                    	$("#myModal").modal('show'); 
                    /*	
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
                                var content = '<form class="user-input" id="register-form">' +
                                        '<label>Board Name</label>' +
                                        '<div class="input-control text required"><input type="text" name="boardname" id="boardname"></div>' +
                                        '<label>Description</label>'+    
                                        '<div class="input-control textarea">'+
                                        '<textarea>...</textarea>'+
                                        '</div>'+
                                        '<div class="form-actions">' +
                                        '<button class="button primary type="submit">Create</button>&nbsp;'+
                                        '</div>'+
                                        '</form>';

                                $.Dialog.title("Create Board");
                                $.Dialog.content(content);
                            }
                        });
                   */
                    
                    
                    });
                    
                    
                    
                   
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

