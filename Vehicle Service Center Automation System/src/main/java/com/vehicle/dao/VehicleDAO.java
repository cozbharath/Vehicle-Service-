package com.vehicle.dao;

import java.util.List;

import com.vehicle.model.Vehicle;

public interface VehicleDAO {

	public String addVehicle(Vehicle v);

	public List<Vehicle> getAllVehicles();

	int getVehiclesInService();

	int getServiceDue();

}