package com.vsc.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.vehicle.dao.EmployeeImp;
import com.vehicle.dao.UserDao;
import com.vehicle.model.Employee;
import com.vehicle.model.User;

@WebServlet("/addEmployee")
public class Employee1 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String eid = request.getParameter("employee_id");

		String ename = request.getParameter("employee_name");

		long phoneno = Long.parseLong(request.getParameter("mobile"));

		String email = request.getParameter("email");

		String address = request.getParameter("address");

		String joiningDate = request.getParameter("joining_date");

		double salary = Double.parseDouble(request.getParameter("salary"));

		String role = request.getParameter("role");

		String username = request.getParameter("username");

		String password = request.getParameter("password");

		// CREATE USER

		User u = new User();

		u.setUsername(username);

		u.setPassword(password);

		u.setRole(role);

		UserDao ud = new UserDao();

		int userId = ud.insertUser(u);

		// CREATE EMPLOYEE

		Employee e = new Employee();

		e.setEid(eid);

		e.setUserid(userId);

		e.setEname(ename);

		e.setPhoneno(phoneno);

		e.setEmail(email);

		e.setAddress(address);

		e.setJoiningDate(joiningDate);

		e.setSalary(salary);

		e.setErole(role);

		EmployeeImp dao = new EmployeeImp();

		String status = dao.addEmployee(e);

		if (status.equals("success")) {

			response.sendRedirect("employeeSuccess.jsp");

		} else {

			response.sendRedirect("addEmployee.jsp");
		}
	}

}