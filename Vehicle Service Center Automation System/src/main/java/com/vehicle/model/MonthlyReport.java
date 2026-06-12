package com.vehicle.model;

public class MonthlyReport {

	private String month;
	private int customers;
	private int services;
	private double revenue;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getCustomers() {
		return customers;
	}

	public void setCustomers(int customers) {
		this.customers = customers;
	}

	public int getServices() {
		return services;
	}

	public void setServices(int services) {
		this.services = services;
	}

	public double getRevenue() {
		return revenue;
	}

	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}
}