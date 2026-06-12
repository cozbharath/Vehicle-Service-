package com.vsc.controller;

import java.io.IOException;
import java.util.List;

import com.vehicle.dao.EmployeeImp;
import com.vehicle.model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeDetails")
public class EmployeeDetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeImp dao = new EmployeeImp();

		List<Employee> employees = dao.getAllEmployees();

		request.setAttribute("employees", employees);

		RequestDispatcher rd = request.getRequestDispatcher("employeeDetails.jsp");

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Employee e = new Employee();

		EmployeeImp dao = new EmployeeImp();
		e.setEid(request.getParameter("eid"));
		e.setEname(request.getParameter("ename"));
		e.setPhoneno(Long.parseLong(request.getParameter("phoneno")));
		e.setEmail(request.getParameter("email"));
		e.setAddress(request.getParameter("address"));
		e.setSalary(Double.parseDouble(request.getParameter("salary")));
		e.setErole(request.getParameter("role"));
		String status = dao.updateEmployee(e);
		if ("success".equals(status)) {
			response.sendRedirect("EmployeeDetails");
		} else {
			response.sendRedirect("editEmployee.jsp");
		}
	}
}