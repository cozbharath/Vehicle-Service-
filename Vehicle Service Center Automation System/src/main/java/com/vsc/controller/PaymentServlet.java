package com.vsc.controller;

import java.io.IOException;
import java.sql.Date;

import com.vehicle.dao.BillImp;
import com.vehicle.dao.PaymentImp;
import com.vehicle.model.Bill;
import com.vehicle.model.Payment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

protected void doPost(
		HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException, IOException {

	try {

		Payment p = new Payment();

		p.setBookingId(
				Integer.parseInt(
						request.getParameter(
								"bookingId")));

		p.setAmount(
				Double.parseDouble(
						request.getParameter(
								"amount")));

		p.setPaymentMode(
				request.getParameter(
						"paymentMode"));

		p.setPaymentStatus(
				"PAID");

		p.setPaymentDate(
				Date.valueOf(
						request.getParameter(
								"paymentDate")));

		PaymentImp paymentDao =
				new PaymentImp();

		String result =
				paymentDao.addPayment(p);

		if(result.equals("success")) {

			BillImp billDao =
					new BillImp();

			Bill bill =
					billDao.generateBill(
							p.getBookingId());

			request.setAttribute(
					"bill",
					bill);

			request.getRequestDispatcher(
					"invoice.jsp")
					.forward(request,
							response);

		}
		else {

			request.setAttribute(
					"message",
					"Payment Failed");

			request.getRequestDispatcher(
					"billing.jsp")
					.forward(request,
							response);
		}

	}
	catch(Exception e) {

		e.printStackTrace();

		request.setAttribute(
				"message",
				"Error : "
						+ e.getMessage());

		request.getRequestDispatcher(
				"billing.jsp")
				.forward(request,
						response);
	}
}

}
