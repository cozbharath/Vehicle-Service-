package com.vsc.controller;

import java.io.IOException;
import java.util.List;

import com.vehicle.dao.BillImp;
import com.vehicle.model.Bill;
import com.vehicle.model.ServiceDetail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

@Override
protected void doPost(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {

	try {

		int bookingId =
				Integer.parseInt(
						request.getParameter(
								"bookingId"));

		BillImp dao =
				new BillImp();

		// Generate Main Bill

		Bill bill =
				dao.generateBill(
						bookingId);

		if (bill != null) {

			// Fetch Service Details

			List<ServiceDetail> details =
					dao.getServiceDetails(
							bookingId);

			request.setAttribute(
					"bill",
					bill);

			request.setAttribute(
					"details",
					details);

			request.getRequestDispatcher(
					"invoice.jsp")
					.forward(
							request,
							response);

		} else {

			request.setAttribute(
					"message",
					"No Bill Found For Booking ID : "
							+ bookingId);

			request.getRequestDispatcher(
					"billing.jsp")
					.forward(
							request,
							response);
		}

	} catch (Exception e) {

		e.printStackTrace();

		request.setAttribute(
				"message",
				"Error : "
						+ e.getMessage());

		request.getRequestDispatcher(
				"billing.jsp")
				.forward(
						request,
						response);
	}
}

}
