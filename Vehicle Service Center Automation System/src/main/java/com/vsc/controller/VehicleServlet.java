package com.vsc.controller;

import java.io.IOException;
import java.util.List;

import com.vehicle.dao.VehicleImp;
import com.vehicle.model.Vehicle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		VehicleImp dao = new VehicleImp();

		List<Vehicle> vehicleList = dao.getAllVehicles();

		int totalVehicles = dao.getTotalVehicles();

		int vehiclesInService = dao.getVehiclesInService();

		int serviceDue = dao.getServiceDue();

		request.setAttribute("vehicleList", vehicleList);
		request.setAttribute("totalVehicles", totalVehicles);
		request.setAttribute("vehiclesInService", vehiclesInService);
		request.setAttribute("serviceDue", serviceDue);

		RequestDispatcher rd = request.getRequestDispatcher("vehicles.jsp");
		rd.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Your existing add vehicle code

		int customerId = Integer.parseInt(request.getParameter("customerId"));

		String vehicleNo = request.getParameter("vehicleNo");

		String brand = request.getParameter("brand");

		String model = request.getParameter("model");

		String fuelType = request.getParameter("fuelType");

		int year = Integer.parseInt(request.getParameter("year"));

		Vehicle v = new Vehicle();

		v.setCustomerId(customerId);
		v.setVehicleNo(vehicleNo);
		v.setBrand(brand);
		v.setModel(model);
		v.setFuelType(fuelType);
		v.setManufacturingYear(year);

		VehicleImp vi = new VehicleImp();

		String status = vi.addVehicle(v);

		if (status.equals("success")) {

			response.sendRedirect("VehicleServlet");

		} else {

			response.sendRedirect("vehicles.jsp?msg=fail");
		}
	}
}