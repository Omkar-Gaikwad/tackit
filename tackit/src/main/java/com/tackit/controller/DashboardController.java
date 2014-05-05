package com.tackit.controller;

import java.util.ArrayList;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import com.tackit.domain.Tack;
//import com.sun.jersey.core.header.FormDataContentDisposition;
//import com.sun.jersey.multipart.FormDataParam;
import com.tackit.domain.User;
import com.tackit.facade.TackExtractor;
import com.tackit.facade.UserManagement;

/**
 * @author Omkar
 * Purpose: Dashboard Controller logic
 * created on:18th April 2014
 */
@Path ("/dashboard")

public class DashboardController {

	/**
	 * @author Omkar
	 * Purpose: Process url and tags
	 * created on:18th April 2014
	 */
	/**
	 * @param url
	 * @param tags
	 * @return
	 */
	@POST
	@Path("/image")
	public Response profile(@FormParam("url") String url,
			@FormParam("tags") String tags  
			) {
		String output;

		Tack tacks = new Tack();

		tacks.setURL(url);
		//tacks.addTags(tags);
		output = "Got msg";

		//TacksManager tm = new TacksManager();

		return Response.status(200).entity(output).build();


	}





}



