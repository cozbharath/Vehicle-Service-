package com.vehicle.model;

public class Vehicle {

	private int vehicleId;
	private int customerId;
	private String vehicleNo;
	private String brand;
	private String model;
	private String fuelType;
	private int manufacturingYear;

	public Vehicle() {
	}

	public Vehicle(int customerId, String vehicleNo, String brand, String model, String fuelType,
			int manufacturingYear) {

		this.customerId = customerId;
		this.vehicleNo = vehicleNo;
		this.brand = brand;
		this.model = model;
		this.fuelType = fuelType;
		this.manufacturingYear = manufacturingYear;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getFuelType() {
		return fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	public int getManufacturingYear() {
		return manufacturingYear;
	}

	public void setManufacturingYear(int manufacturingYear) {
		this.manufacturingYear = manufacturingYear;
	}
}