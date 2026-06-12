	package com.vsc.controller;

import java.io.IOException;
import com.vehicle.dao.BookingImp;
import com.vehicle.dao.CustomerImp;
import com.vehicle.dao.DashboardCountsImp;
import com.vehicle.dao.EmployeeImp;
import com.vehicle.dao.PaymentImp;
import com.vehicle.dao.UserDao;
import com.vehicle.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// GET FORM DATA

		String username = request.getParameter("username");

		String password = request.getParameter("password");

		String role = request.getParameter("role");

		// CREATE OBJECT

		User u = new User();

		u.setUsername(username);

		u.setPassword(password);

		u.setRole(role);

		// DAO OBJECT

		UserDao ud = new UserDao();

		// CHECK LOGIN

		String role1 = ud.checkLogin(username, password);

		if (role1 != null) {

			// ADMIN
			if (role1.equals("ADMIN")) {

				HttpSession session = request.getSession();

				session.setAttribute("username", username);

				CustomerImp customerDao = new CustomerImp();
				EmployeeImp employeeDao = new EmployeeImp();
				BookingImp bookingDao = new BookingImp();
				PaymentImp paymentDao = new PaymentImp();

				session.setAttribute("totalCustomers", customerDao.getTotalCustomers());

				session.setAttribute("totalMechanics", employeeDao.getTotalMechanics());

				session.setAttribute("bookingsToday", bookingDao.getBookingsToday());

				session.setAttribute("totalRevenue", paymentDao.getTotalRevenue());

				session.setAttribute("recentBookings", bookingDao.getAdminRecentBookings());

				RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");

				rd.forward(request, response);
			}

			// MECHANIC

			else if (role1.equals("MECHANIC")) {

				HttpSession session = request.getSession();

				session.setAttribute("username", username);

				BookingImp dao = new BookingImp();

				session.setAttribute("totalAssignedServices", dao.getTotalAssignedServices());

				session.setAttribute("completedServices", dao.getCompletedServices());

				session.setAttribute("pendingServices", dao.getPendingServices());

				session.setAttribute("assignedServices", dao.getAssignedServices());

				RequestDispatcher rd = request.getRequestDispatcher("mechanicDashboard.jsp");

				rd.forward(request, response);
			}

			// RECEPTIONIST

			else if (role1.equals("RECEPTIONIST")) {

				HttpSession session = request.getSession();
				session.setAttribute("username", username);

				DashboardCountsImp dao = new DashboardCountsImp();

				session.setAttribute("totalCustomers", dao.getTotalCustomers());

				session.setAttribute("totalBookings", dao.getTotalBookings());

				session.setAttribute("pendingServices", dao.getPendingServices());

				session.setAttribute("recentBookings", dao.getRecentBookings());

				RequestDispatcher rd = request.getRequestDispatcher("receptionistDashboard.jsp");

				rd.forward(request, response);
			}

		} else {

			response.sendRedirect("login.jsp");
		}
	}

}