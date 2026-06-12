package com.vsc.controller;

import java.io.IOException;

import com.vehicle.dao.BookingImp;
import com.vehicle.model.Booking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookingImp dao = new BookingImp();

		request.setAttribute("totalCompletedServices", dao.getTotalCompletedServices());

		request.setAttribute("totalRevenue", dao.getTotalRevenue());

		request.setAttribute("completedServicesList", dao.getCompletedServicesList());

		RequestDispatcher rd = request.getRequestDispatcher("completedServices.jsp");

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int bookingId = Integer.parseInt(request.getParameter("bookingId"));

			String vehicleNumber = request.getParameter("vehicleNumber");

			String customerName = request.getParameter("customerName");

			String serviceType = request.getParameter("serviceType");

			String serviceStatus = request.getParameter("serviceStatus");

			String completionDate = request.getParameter("completionDate");

			String partName = request.getParameter("partName");

			int quantity = 0;

			if (request.getParameter("quantity") != null && !request.getParameter("quantity").isEmpty()) {

				quantity = Integer.parseInt(request.getParameter("quantity"));
			}

			double unitPrice = 0;

			if (request.getParameter("unitPrice") != null && !request.getParameter("unitPrice").isEmpty()) {

				unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
			}

			String workDone = request.getParameter("workDone");

			String remarks = request.getParameter("remarks");

			// Invoice Calculation

			double partsTotal = quantity * unitPrice;

			double labourCharge = 600.0;

			double subTotal = partsTotal + labourCharge;

			double gst = subTotal * 0.05;

			double grandTotal = subTotal + gst;

			Booking booking = new Booking();

			booking.setBookingId(bookingId);
			booking.setVehicleNumber(vehicleNumber);
			booking.setCustomerName(customerName);
			booking.setServiceType(serviceType);
			booking.setServiceStatus(serviceStatus);
			booking.setCompletionDate(completionDate);

			booking.setPartName(partName);
			booking.setQuantity(quantity);
			booking.setUnitPrice(unitPrice);

			booking.setWorkDone(workDone);
			booking.setRemarks(remarks);

			booking.setPartsTotal(partsTotal);
			booking.setLabourCharge(labourCharge);
			booking.setGst(gst);
			booking.setGrandTotal(grandTotal);

			BookingImp dao = new BookingImp();

			int status = dao.updateServiceStatus(booking);

			if (status > 0) {

				request.setAttribute("message", "Service Status Updated Successfully");

				request.setAttribute("partsTotal", partsTotal);

				request.setAttribute("labourCharge", labourCharge);

				request.setAttribute("gst", gst);

				request.setAttribute("grandTotal", grandTotal);

				request.setAttribute("message", "Service Details Saved Successfully");

				request.getRequestDispatcher("serviceSuccess.jsp").forward(request, response);

			} else {

				request.setAttribute("message", "Failed To Update Service Status");

				request.getRequestDispatcher("updateStatus.jsp").forward(request, response);
			}

		} catch (Exception e) {

			e.printStackTrace();

			request.setAttribute("message", "Error : " + e.getMessage());

			request.getRequestDispatcher("updateStatus.jsp").forward(request, response);
		}
	}
}