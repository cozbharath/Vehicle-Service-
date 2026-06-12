package com.vehicle.model;

public class Bill {

	private int bookingId;
	private String customerName;
	private String vehicleNumber;
	private String serviceType;

	private double partsTotal;
	private double labourCharge;
	private double gst;
	private double grandTotal;

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getVehicleNumber() {
		return vehicleNumber;
	}

	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public double getPartsTotal() {
		return partsTotal;
	}

	public void setPartsTotal(double partsTotal) {
		this.partsTotal = partsTotal;
	}

	public double getLabourCharge() {
		return labourCharge;
	}

	public void setLabourCharge(double labourCharge) {
		this.labourCharge = labourCharge;
	}

	public double getGst() {
		return gst;
	}

	public void setGst(double gst) {
		this.gst = gst;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

}
