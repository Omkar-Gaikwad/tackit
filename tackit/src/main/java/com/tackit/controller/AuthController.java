package com.tackit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;














import com.tackit.domain.DashBoard;
import com.tackit.domain.Tack;
//import com.sun.jersey.core.header.FormDataContentDisposition;
//import com.sun.jersey.multipart.FormDataParam;
import com.tackit.domain.User;
import com.tackit.facade.DashBoardManager;
import com.tackit.facade.TackExtractor;
import com.tackit.facade.TacksManager;
import com.tackit.facade.UserManagement;



/**
 * @author Akshay
 * Purpose: Connect GUI with the Business logic
 * created on:15th April 2014
 */
@Path("/user")
public class AuthController {


/**
 * @author Akshay Khatavkar
 * Purpose: Used to Sign Up
 * created on:16th April 2014
 */
	/**
	 * @param fname
	 * @param lname
	 * @param email
	 * @param password
	 * @return
	 */
	@POST
	@Path("/signup")
	public Response userprofile(@FormParam("fname") String fname,
			@FormParam("lname") String lname,
			@FormParam("email") String email, 
			@FormParam("password") String password ) {
		System.out.println("name is: "+fname);
		User user = new User();
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setEmail(email);
		user.setPassword(password);

		UserManagement um = new UserManagement();

		System.out.println( email + user.getEmail());

		int errorCode = um.createUser(user);

		System.out.println("surname of the user is"+user.getLastName());
		String output = "Thankyou for registring with us you will recieve email shortly "+ user.getFirstName();


		if ( 0 == errorCode )
			System.out.println("User added");
		 

		return Response.status(200).entity(output).build();

	}

	/**
	 * @author Akshay
	 * Purpose: Used to Sign in
	 * created on:16th April 2014
	 */
	
	/**
	 * @param email
	 * @param password
	 * @param req
	 * @return
	 */
	@POST
	@Path("/login")
	public Response loginProfile(@FormParam("email") String email,
			@FormParam("password") String password,
			@Context HttpServletRequest req){


		System.out.println("email id is "+ email);
		System.out.println("password is "+ password);

		UserManagement um = new UserManagement();

		int errorCode = um.validateUser(email, password);


		String output;
		System.out.println("login check "+errorCode);
		if ( 0 == errorCode ){
			output = " Logging in ";

			//Httpsession changes made at 04/05
			HttpSession session= req.getSession(true);
			session.setAttribute("username", email);
			session.setAttribute("sessionId", session.getId());

			User user = um.getUserInfo(email, password);


			UserManagement userManagement = new UserManagement();

			user = userManagement.getUserBoardsAndTacks(user.getId());


			req.getSession().setAttribute("user", user);
			List<Tack> userTacks = new TacksManager().getAllTacks();
			req.getSession().setAttribute("userTacks", userTacks);
			return Response.status(200).entity(output).build(); 



		} else if ( -1 == errorCode){
			output = " Login failed wrong password ";
			return Response.status(400).entity(output).build();	

		}else if ( -99 == errorCode){
			output = " User Not found ";
			return Response.status(400).entity(output).build();	


		}else{
			output = " Error not found";
			return Response.status(400).entity(output).build();	

		}

		// return Response.status(400).entity(output).build();
	}

	/**
	 * @author Akshay
	 * Purpose: Used to Process URL sent from GUI
	 * created on:16th April 2014
	 */
	
	/**
	 * @param url
	 * @param req
	 * @return
	 */
	@POST
	@Path("/url")
	public Response submitUrl(@FormParam("url") String url,
			@Context HttpServletRequest req){
		System.out.println("the ur printed is: "+url);
		User user = new User();
		//user.setURL(url);

		String output = "We are about to process your url and you will see all the photos from: "+ url;

		TackExtractor te = new TackExtractor();

		ArrayList<String> imageUrls = null ;

		try {
			imageUrls = te.getImageLinks(url);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		for ( String s : imageUrls ){
			System.out.println("authcontroller");
			System.out.println(s);
		}

		HttpSession session= req.getSession(true);
		session.setAttribute("imageUrls", imageUrls);

		return Response.status(200).entity(output).build();
	}

	/**
	 * @author Akshay
	 * Purpose: Used to Create a new Board
	 * created on:16th April 2014
	 */
	
	/**
	 * @param BoardName
	 * @param BoardDescription
	 * @param req
	 * @return
	 */
	@POST
	@Path("/pinboard")
	public Response pinboard(@FormParam("BoardName") String BoardName,
			@FormParam("BoardDescription") String BoardDescription,
			@Context HttpServletRequest req){

		System.out.println("inside pinboard");
		HttpSession session= req.getSession(true);
		User user=(User) session.getAttribute("user");
		System.out.println("user id for the board "+user.getId());

		if(null!=user){
			DashBoardManager dashboardmanager = new DashBoardManager();

			DashBoard dashBoardtoAdd = new DashBoard();
			dashBoardtoAdd.setOwner(user.getId());
			dashBoardtoAdd.setTitle(BoardName);
			dashBoardtoAdd.setDescription(BoardDescription);
			dashboardmanager.addNewDashBoard(dashBoardtoAdd );


		}
		String output="board created";

		UserManagement userManagement = new UserManagement();

		user = userManagement.getUserBoardsAndTacks(user.getId());

		List<String> userBoards = user.getDashBoardNames();
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("userBoards", userBoards);


		return Response.status(200).entity(output).build();


	}

	/**
	 * @author Akshay
	 * Purpose: Used to get All the boards of the User
	 * created on:16th April 2014
	 */
	
	/**
	 * @param req
	 * @return
	 */
	@GET
	@Path("/getBoards")
	public Response userBoards(@Context HttpServletRequest req){
		UserManagement userManagement = new UserManagement();
		User user = (User) req.getSession().getAttribute("user");
		user = userManagement.getUserBoardsAndTacks(user.getId());

		List<String> userBoards = user.getDashBoardNames();
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("userBoards", userBoards);
		for (String string : userBoards) {
			System.out.println(string);
		}
		return Response.status(200).build();

	}

	/**
	 * @author Akshay
	 * Purpose: Used to add Tack to the Board
	 * created on:16th April 2014
	 */
	
	/**
	 * @param boardId
	 * @param imageUrl
	 * @param req
	 * @return
	 */
	@POST
	@Path("/addTack")
	public Response addToBoard(@FormParam("boardId") String boardId,
			@FormParam("imageUrl") String imageUrl,
			@Context HttpServletRequest req){
		String output="Image Added";
		TacksManager tacksManager = new TacksManager();
		Tack tack = new Tack();
		tack.setURL(imageUrl);
		System.out.println(imageUrl);
		tacksManager.addTack(boardId, tack);
		return Response.status(200).entity(output).build();
	}
	
	@POST
    @Path("/showBoard")
    public Response showBoard(@FormParam("boardId") String boardId,
            @Context HttpServletRequest req){
        String output="SUCCESS";
         String str = "";
         List<String> imageList = new ArrayList<String>();
        List<DashBoard> boardList = ((User) req.getSession().getAttribute("user")).getMyBoards();
        for (DashBoard dashBoard : boardList) {
            if(dashBoard.getId().equals(boardId)){
                for (Tack url : dashBoard.getTackList()) {
                	imageList.add("<img src=\""+ url.getURL() +"\"  width=\"200\" height=\"283\">");
                    str = str + "<img src=\""+ url.getURL() +"\"  width=\"200\" height=\"283\">";
                }
            }
        }
        System.out.println("Final str is "+str);
        req.setAttribute("myAtt", str);
        req.getSession().setAttribute("images", str);
        req.getSession().setAttribute("imageList", imageList); 
        return Response.status(200).entity(str).build();
    }
	
	@POST
    @Path("/followBoard")
    public Response followBoard(@FormParam("boardId") String boardId,@FormParam("boardTitle") String boardTitle,@FormParam("owner") String owner,
            @Context HttpServletRequest req){
       
         String str = "";

        return Response.status(200).entity(str).build();
    }
	
	
	@DELETE
    @Path("/deleteBoard")
    public Response deleteBoard(@FormParam("boardId") String boardId,
            @Context HttpServletRequest req){     
		
		System.out.println("Board Id is:"+boardId);
		UserManagement um=new UserManagement();
		
        HttpSession session= req.getSession(true);
        User user=(User) session.getAttribute("user");
        user.deleteDashBoard(boardId);
        System.out.println("User Id is:"+user.getId());
        um.deleteDashBoardById(user.getId(), boardId);
        req.getSession().setAttribute("user", user); 
        return Response.status(200).entity("board deleted").build();
    }

	

	
}
