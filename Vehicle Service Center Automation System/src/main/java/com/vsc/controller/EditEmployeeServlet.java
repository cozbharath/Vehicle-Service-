package com.vsc.controller;

import java.io.IOException;

import com.vehicle.dao.EmployeeImp;
import com.vehicle.model.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEmployeeServlet
 */
@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eid = request.getParameter("id");

		EmployeeImp dao = new EmployeeImp();

		Employee emp = dao.getEmployeeById(eid);

		request.setAttribute("employee", emp);

		RequestDispatcher rd = request.getRequestDispatcher("editEmployee.jsp");

		rd.forward(request, response);
	}

}
