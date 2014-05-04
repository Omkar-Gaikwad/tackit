package com.tackit.controller;

import java.util.ArrayList;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;


import com.tackit.domain.Tacks;
//import com.sun.jersey.core.header.FormDataContentDisposition;
//import com.sun.jersey.multipart.FormDataParam;
import com.tackit.domain.User;
import com.tackit.facade.TackExtractor;
import com.tackit.facade.UserManagement;

@Path ("/dashboard")

public class DashboardController {

	@POST
	@Path("/image")
	public Response profile(@FormParam("url") String url,
							@FormParam("tags") String tags  
							) {
		String output;
		
		Tacks tacks = new Tacks();
		
		tacks.setURL(url);
		tacks.addTags(tags);
		output = "Got msg";
		
		//TacksManager tm = new TacksManager();
		
		return Response.status(200).entity(output).build();
		
	
	}
		
		
		
		
	}
	
	

