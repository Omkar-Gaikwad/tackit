package com.tackit.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;







//import com.sun.jersey.core.header.FormDataContentDisposition;
//import com.sun.jersey.multipart.FormDataParam;
import com.tackit.domain.User;
import com.tackit.facade.TackExtractor;
import com.tackit.facade.UserManagement;

@Path("/user")
public class AuthController {
	
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
			else
				System.out.println(" hagala hagala ");	
			
			
		return Response.status(200).entity(output).build();

	}
	
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
				output = "Login Successful for "+ email;
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

}
