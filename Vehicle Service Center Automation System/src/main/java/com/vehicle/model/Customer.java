package com.vehicle.model;

public class Customer {

	private int customerId;
	private String cname;
	private long cmobile;
	private String email;
	private String address;

	public Customer() {
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public long getCmobile() {
		return cmobile;
	}

	public void setCmobile(long cmobile) {
		this.cmobile = cmobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}