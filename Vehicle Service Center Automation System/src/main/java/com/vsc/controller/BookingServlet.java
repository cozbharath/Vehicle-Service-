package com.vsc.controller;

import java.io.IOException;
import java.sql.Date;

import com.vehicle.dao.BookingImp;
import com.vehicle.model.Booking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("customerId"));

		int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));

		String employeeId = request.getParameter("employeeId");

		Date bookingDate = Date.valueOf(request.getParameter("bookingDate"));

		String serviceType = request.getParameter("serviceType");

		String problemDescription = request.getParameter("problemDescription");

		String serviceStatus = request.getParameter("serviceStatus");

		Booking b = new Booking();

		b.setCustomerId(customerId);
		b.setVehicleId(vehicleId);
		b.setEmployeeId(employeeId);
		b.setBookingDate(bookingDate);
		b.setServiceType(serviceType);
		b.setProblemDescription(problemDescription);
		b.setServiceStatus(serviceStatus);

		BookingImp bi = new BookingImp();

		String status = bi.addBooking(b);

		if (status.equals("success")) {

			RequestDispatcher rd = request.getRequestDispatcher("bookingSuccess.jsp");

			rd.forward(request, response);

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("serviceBooking.jsp");

			rd.forward(request, response);

		}
	}

}
