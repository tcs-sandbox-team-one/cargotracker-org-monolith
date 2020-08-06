package com.practicalddd.cargotracker.handling.interfaces.rest;


import com.practicalddd.cargotracker.handling.application.internal.commandservices.HandlingActivityRegistrationCommandService;
import com.practicalddd.cargotracker.handling.interfaces.rest.dto.HandlingActivityRegistrationResource;
import com.practicalddd.cargotracker.handling.interfaces.rest.transform.HandlingActivityRegistrationCommandDTOAssembler;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * Controller for the REST API
 */
@Path("/cargohandling")
@ApplicationScoped
public  class CargoHandlingController {

    @Inject
    private HandlingActivityRegistrationCommandService handlingActivityRegistrationCommandService; // Application Service Dependency


    /**
     * POST method to register Handling Activities
     * @param handlingActivityRegistrationResource
     */
    @POST
    public Response registerHandlingActivity(@FormParam("bookingId") String bookingId,

			@FormParam("unLocode") String unLocode, @FormParam("handlingType") String handlingType,

			@FormParam("completionTime") String completionTime,@FormParam("voyageNumber") String voyageNumber){
       
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        HandlingActivityRegistrationResource handlingActivityRegistrationResource = new 
        		HandlingActivityRegistrationResource(bookingId, voyageNumber, unLocode, 
        				handlingType, LocalDate.parse(completionTime, formatter));
        
        System.out.println("***"+handlingActivityRegistrationResource.getBookingId());
        System.out.println("***"+handlingActivityRegistrationResource.getHandlingType());

        handlingActivityRegistrationCommandService.registerHandlingActivityService(
                HandlingActivityRegistrationCommandDTOAssembler.toCommandFromDTO(handlingActivityRegistrationResource));
		
       
        
        String output = null;
        if(!voyageNumber.equals("")) { 
        	output = "<font face='verdana' size='4'>" +
                "Handling activity successfully registered for booking id - <u>"+
        		handlingActivityRegistrationResource.getBookingId()+ "</u> and voyage number -<u>" + voyageNumber +
        		"</u> and <br /> cargo <u>" +cargoStatus(handlingType)
                +"</u></font>";
        }else {
        	output = "<font face='verdana' size='4'>" +
                    "Handling activity successfully registered for booking id - <u>"+
            		handlingActivityRegistrationResource.getBookingId()
                    +"</u> and <br /> cargo <u>" +cargoStatus(handlingType)+"</u></font>";
        }
        
        final Response returnValue = Response.status(200).entity(output).build();
        return returnValue;
    }
    
	public String cargoStatus(String cargoHandlingType) {
		String status = null;
		switch (cargoHandlingType) {
		case "RECEIVE":
			status = "Recieved at port";
			break;
		case "LOAD":
			status = "Loaded onto next carrier";
			break;
		case "UNLOAD":
			status = "Unloaded";
			break;
		case "CUSTOMS":
			status = "Went through Customs";
			break;
		case "CLAIM":
			status = "Claimed";
			break;
		default:
			System.out.println("status not matched");
		}
		return status;
	}
    
	/*
	 * @POST
	 * 
	 * @Produces(MediaType.APPLICATION_JSON) public Response
	 * registerHandlingActivity(HandlingActivityRegistrationResource
	 * handlingActivityRegistrationResource){
	 * System.out.println("***"+handlingActivityRegistrationResource.getBookingId())
	 * ;
	 * System.out.println("***"+handlingActivityRegistrationResource.getHandlingType
	 * ());
	 * 
	 * handlingActivityRegistrationCommandService.registerHandlingActivityService(
	 * HandlingActivityRegistrationCommandDTOAssembler.toCommandFromDTO(
	 * handlingActivityRegistrationResource)); final Response returnValue =
	 * Response.ok() .entity("Handling Activity Registered") .build(); return
	 * returnValue; }
	 */
}
