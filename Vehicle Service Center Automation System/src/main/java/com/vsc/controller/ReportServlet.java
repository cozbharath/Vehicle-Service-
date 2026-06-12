package com.vsc.controller;

import java.io.IOException;
import java.util.List;

import com.vehicle.dao.DashboardCountsImp;
import com.vehicle.model.MonthlyReport;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DashboardCountsImp dao = new DashboardCountsImp();

		int totalCustomers = dao.getTotalCustomers();
		int totalServices = dao.getTotalBookings();
		double totalRevenue = dao.getTotalRevenue();

		List<MonthlyReport> reports = dao.getMonthlyReports();

		request.setAttribute("totalCustomers", totalCustomers);
		request.setAttribute("totalServices", totalServices);
		request.setAttribute("totalRevenue", totalRevenue);
		request.setAttribute("reports", reports);

		RequestDispatcher rd = request.getRequestDispatcher("reports.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
