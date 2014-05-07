<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" import="com.tackit.domain.User"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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


<nav class="navigation-bar dark">
		<nav class="navigation-bar-content">
			 <span class="element-divider"></span><span style="color: green; margin: 0px 10px 0px 10px;">Tack<span style="color: yellow;">!</span>T</span></span>



			<div class="element place-right">
				<a href="#" onclick="logout()">Logout
			</div>

			
		</nav>
	</nav>

	<nav class="navigation-bar white">
		<nav class="navigation-bar-content">
			<a href="/" class="element"><span class="icon-grid-view"></span>
				<%    
				System.out.print((User)session.getAttribute("user"));
				String boardCount = 0 + "";
				User user= null;
				if(null != session.getAttribute("user")) {
				 user=(User)session.getAttribute("user"); 
				boardCount = user.getBoardCount() ; 				
				}
				%> <%=boardCount %> Boards</a> <span class="element-divider"></span> <a class="pull-menu"
				href="#"></a> <a href="/" class="element"><span
				class="icon-grid-view"></span> 4 Pins</a> <span class="element-divider"></span>
			<a href="/" class="element"><span class="icon-grid-view"></span>
				1 Like</a>


			<div class="element place-right">
				<a href="/" class="element" class="element place-right"><span
					class="icon-grid-view"></span> 0 Followers</a>
			</div>

			<div class="element place-right">
				<a href="/" class="element" class="element place-right"><span
					class="icon-grid-view"></span> 1 Following</a>
			</div>
			<span class="element-divider"></span>
			<div class="element place-right">
				<button class="element" id="createboard">
					<span class="icon-grid-view"></span> Create Board
				</button>

			</div>
			<span class="element-divider"></span>
			
		</nav>
	</nav>

	<div class="tile-area tile-area-white">

		<c:forEach var="board" items="${user.myBoards}" varStatus="status">
			<a href='#' onclick="showBoard(this.id);" id="${board.title }">
				<div class="tile double double-vertical live" data-role="live-tile"
					data-effect="slideUpDown" data-easing="easeInElastic">
					<%-- <div class="tile-content image" id= "${board.title }" onclick="showBoard(this.title)"> --%>

					<c:forEach var="url1" items="${board.tackList}">
						<div class="tile-content image">
							<img src="${url1.URL}">
						</div>
					</c:forEach>
					</a>
					<div class="tile-status bg-light opacity">
						<!-- <a href='#'  onclick="showBoard('hi');" > -->
						<span class="label "><font color="000000"><p align="center">${board.title}</p><font></span>
						
						<span align="right" class="label">
						 <button class="opacity" align="middle" id="${board.id}" onclick="editBoard(this.id,'${board.title}','${board.description}');"><span class="icon-pencil on-right"></button> 
						 <button class="opacity" align="middle"  id="${board.id}" onclick="deleteBoard(this.id);")><span class="icon-remove on-right"></button>    
						</span>
						
						<!-- </a> -->
					</div>
					

				</div>
			
		</c:forEach>
	</div>

	
	<script>
	

	
	function  deleteBoard(id)
	{
		alert("In deleteBoard");
		$.ajax({
			url : "tackit/user/deleteBoard",
			type : "DELETE",
			data : "boardId=" + id,

			success : function(data, textStatus, jqXHR) {
				window.location.href = "MyBoards.jsp";
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('Could not process request.. '
						+ errorThrown);
			}
		});
	}
	</script>
	<script>
				$("#createboard")
						.on(
								'click',
								function() {
									$
											.Dialog({
												overlay : true,
												shadow : true,
												flat : true,
												draggable : true,
												icon : '<span class="icon-grid-view"></span>',
												title : 'Flat window',
												content : '',
												padding : 10,
												width : 500,
												onShow : function(_dialog) {
													var content = '<label>Board Name</label>'
															+ '<div class="input-control text required"><input type="text" name="boardname" id="BoardName"></div>'
															+ '<label>Description</label>'
															+ '<div class="input-control textarea">'
															+ '<textarea id="BoardDescription">amol</textarea>'
															+ '</div>'
															+ '<div>'
															+ '<button class="button" id="createboardbutton" onclick="func()" >Create</button>&nbsp;'
															+ '</div>';

													$.Dialog
															.title("Create Board");
													$.Dialog.content(content);
												}
											});
								});

				function func() {
					$.Dialog.close();

					var BoardName = $('#BoardName').val();
					var BoardDescription = $('#BoardDescription').val();

					$
							.ajax({
								url : "tackit/user/pinboard",
								type : "POST",
								data : "BoardName=" + BoardName
										+ "&BoardDescription="
										+ BoardDescription,

								success : function(data, textStatus, jqXHR) {
									alert('success');
	
									//window.location.href = "MyBoar.jsp";
								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert('Could not process request.. '
											+ errorThrown);
								}
							});

					$
							.ajax({
								url : "tackit/user/getBoards",
								type : "GET",
								datatype : 'text',

								success : function(data, textStatus, jqXHR) {
									alert('Board Added');

									window.location.href = "MyBoards.jsp";
								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert('Could not process request.. '
											+ errorThrown);
								}
							});

				}

				var foo = "";
				function showBoard(id) {
					alert(id);
					$.ajax({
								url : "tackit/user/showBoard",
								type : "POST",
								data : "boardId=" + id,

								success : function(data, textStatus, jqXHR) {
									foo = '${images}';
									alert(foo.value);
								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert('Could not process request.. '
											+ errorThrown);
								}
							});

					/* var foo = '${images}';
					alert(foo.value); */
			<%Object obj = session.getAttribute("images");
			String str = (String) obj;
			System.out.println("in scr:" + str);%>
				/* alert(str); */

					$.Dialog({
						overlay : true,
						shadow : true,
						flat : true,
						draggable : true,
						icon : '<span class="icon-grid-view"></span>',
						title : 'Flat window',
						content : '',
						padding : 10,
						width : 500,
						onShow : function(_dialog) {
							var content = '${images}';
							$.Dialog.title("Tacks in the Board");
							$.Dialog.content(content);
						}
					});
				}
				
				
				function logout()
				{
					alert("In Logout");
					window.location.href = "login.jsp";
					
				}
				
				function editBoard(id,title,desc)
				{
					alert(id + " " + title + " "  +desc);
					
					$.Dialog({
						overlay : true,
						shadow : true,
						flat : true,
						draggable : true,
						icon : '<span class="icon-grid-view"></span>',
						title : 'Flat window',
						content : '',
						padding : 10,
						width : 500,
						onShow : function(_dialog) {
							var content = '<label>Board Name</label>'
									+ '<div class="input-control text required"><input type="text" name="boardname" id="BoardName1" value='+title+'></div>'
									+ '<label>Description</label>'
									+ '<div class="input-control textarea">'
									+ '<textarea id="BoardDescription1">'+desc+'</textarea>'
									+ '</div>'
									+ '<div>'
									+ '<button class="button" id="'+id+'" onclick="editMyBoards(id);" >Update</button>&nbsp;'
									+ '</div>';

							$.Dialog
									.title("Edit Board");
							$.Dialog.content(content);
						}
					});

					/* <button class="button" id="editboardbutton" 
					onclick="editMyBoard('+id+','+document.getElementById("BoardName")+','+document.getElementById("BoardDescription")+');" >
					Update</button>&nbsp;' */
				}
				
				function editMyBoards(id)
				{
					
					alert('hi');
					var BoardName = $('#BoardName1').val();
					var BoardDescription = $('#BoardDescription1').val();
					alert(BoardName);
					alert(BoardDescription);
					$.ajax({
						url : "tackit/user/editBoard",
						type : "PUT",
						data : "id=" + id+ "&title=" + BoardName + "&description="+BoardDescription,

						success : function(data, textStatus, jqXHR) {
							window.location.href = "MyBoards.jsp";
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert('Could not process request.. '
									+ errorThrown);
						}
					});
				}
			</script>
</body>
</html>

