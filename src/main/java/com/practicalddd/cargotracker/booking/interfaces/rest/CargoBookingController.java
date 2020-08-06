package com.practicalddd.cargotracker.booking.interfaces.rest;

import com.practicalddd.cargotracker.booking.application.internal.commandservices.CargoBookingCommandService;
import com.practicalddd.cargotracker.booking.domain.model.aggregates.BookingId;
import com.practicalddd.cargotracker.booking.interfaces.rest.dto.BookCargoResource;
import com.practicalddd.cargotracker.booking.interfaces.rest.transform.BookCargoCommandDTOAssembler;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;


@Path("/cargobooking")
@ApplicationScoped
public class CargoBookingController {


    @Inject
    private CargoBookingCommandService cargoBookingCommandService; // Application Service Dependency

    /**
     * POST method to book a cargo
     * @param bookCargoResource
     */
	
	@POST
	public Response bookCargo(@FormParam("bookingAmount") String bookingAmount,

			@FormParam("originLocation") String originLocation, @FormParam("destLocation") String destLocation,

			@FormParam("destArrivalDeadline") String destArrivalDeadline) {
		
		System.out.println("****Book Cargo" + cargoBookingCommandService);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		BookCargoResource bookCargoResource = new BookCargoResource(Integer.parseInt(bookingAmount), originLocation,
				destLocation, LocalDate.parse(destArrivalDeadline, formatter));
		 
		BookingId bookingId = cargoBookingCommandService
				.bookCargo(BookCargoCommandDTOAssembler.toCommandFromDTO(bookCargoResource));

		  String output = "<font face='verdana' size='4'>" +
	                "Successfully created new booking id - <u>"+bookingId.getBookingId()+"</u></font>";
		//final Response returnValue = Response.ok("Successfully created new booking id: " + bookingId.getBookingId()).build();
		  final Response returnValue = Response.status(200).entity(output).build();
		  
		  return returnValue;
	}
	 
    
	/*
	 * @POST
	 * 
	 * @Produces(MediaType.APPLICATION_JSON) public Response
	 * bookCargo(BookCargoResource bookCargoResource){
	 * System.out.println("****Book Cargo"+cargoBookingCommandService); BookingId
	 * bookingId = cargoBookingCommandService.bookCargo(
	 * BookCargoCommandDTOAssembler.toCommandFromDTO(bookCargoResource));
	 * 
	 * final Response returnValue = Response.ok() .entity(bookingId) .build();
	 * return returnValue; }
	 */

}
