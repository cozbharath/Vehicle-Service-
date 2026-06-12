package com.vsc.controller;

import java.io.IOException;
import java.util.List;

import com.vehicle.dao.CustomerImp;
import com.vehicle.dao.VehicleImp;
import com.vehicle.model.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		CustomerImp dao = new CustomerImp();

		// EDIT CUSTOMER

		if ("edit".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			Customer customer = dao.getCustomerById(id);

			request.setAttribute("customer", customer);

			RequestDispatcher rd = request.getRequestDispatcher("editCustomer.jsp");

			rd.forward(request, response);

			return;
		}

		// DELETE CUSTOMER

		if ("delete".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			String status = dao.deleteCustomer(id);

			if ("success".equals(status)) {

				response.sendRedirect("deleteSuccess.jsp");

			} else {

				response.sendRedirect("CustomerServlet?msg=deletefailed");
			}

			return;
		}

		// DISPLAY CUSTOMERS

		List<Customer> customerList = dao.getAllCustomers();

		int totalCustomers = dao.getTotalCustomers();

		int newCustomers = dao.getNewCustomers();

		VehicleImp vehicleDao = new VehicleImp();

		int totalVehicles = vehicleDao.getTotalVehicles();

		request.setAttribute("customerList", customerList);

		request.setAttribute("totalCustomers", totalCustomers);

		request.setAttribute("newCustomers", newCustomers);

		request.setAttribute("totalVehicles", totalVehicles);

		RequestDispatcher rd = request.getRequestDispatcher("customers.jsp");

		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		CustomerImp dao = new CustomerImp();

		// UPDATE CUSTOMER

		if ("update".equals(action)) {

			Customer c = new Customer();

			c.setCustomerId(Integer.parseInt(request.getParameter("customerId")));

			c.setCname(request.getParameter("customerName"));

			c.setCmobile(Long.parseLong(request.getParameter("mobile")));

			c.setEmail(request.getParameter("email"));

			c.setAddress(request.getParameter("address"));

			String status = dao.updateCustomer(c);

			if ("success".equals(status)) {

				response.sendRedirect("CustomerServlet?msg=updated");

			} else {

				response.sendRedirect("CustomerServlet?msg=failed");
			}

			return;
		}

		// ADD CUSTOMER

		String cname = request.getParameter("cname");

		long cmobile = Long.parseLong(request.getParameter("mobile"));

		String email = request.getParameter("email");

		String address = request.getParameter("address");

		Customer c = new Customer();

		c.setCname(cname);
		c.setCmobile(cmobile);
		c.setEmail(email);
		c.setAddress(address);

		String status = dao.addCustomer(c);

		if ("success".equals(status)) {

			response.sendRedirect("CustomerServlet?msg=added");

		} else {

			response.sendRedirect("CustomerServlet?msg=failed");
		}
	}

}
