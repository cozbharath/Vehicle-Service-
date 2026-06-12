package com.vehicle.model;

public class Employee {
	private String eid;
	private int userid;
	private String ename;
	private long phoneno;
	private String email;
	private String address;
	private String joiningDate;
	private double salary;
	private String erole;
	private String username;
	private String password;

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}
	

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public long getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(long phoneno) {
		this.phoneno = phoneno;
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

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getErole() {
		return erole;
	}

	public void setErole(String erole) {
		this.erole = erole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJoiningDate() {
		return joiningDate;
	}

	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}

	public Employee(String eid, int userid,String ename, long phoneno, String email, String address, String joiningDate,
			double salary, String erole, String username, String password) {
		super();
		this.eid = eid;
		this.userid = userid;
		this.ename = ename;
		this.phoneno = phoneno;
		this.email = email;
		this.address = address;
		this.joiningDate = joiningDate;
		this.salary = salary;
		this.erole = erole;
		this.username = username;
		this.password = password;
	}

	public Employee() {
	}


}
