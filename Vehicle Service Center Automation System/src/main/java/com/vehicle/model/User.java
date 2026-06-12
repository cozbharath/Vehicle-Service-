package com.vehicle.model;

public class User {

	private String username;

	private String password;
	
	private String role;

	// GET USERNAME

	public String getUsername() {

		return username;
	}

	// SET USERNAME

	public void setUsername(String username) {

		this.username = username;
	}
	
	
	// GET PASSWORD

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {

		return password;
	}

	// SET PASSWORD

	public void setPassword(String password) {

		this.password = password;
	}

	// CONSTRUCTOR

	public User(String username, String password, String role) {

		this.username = username;

		this.password = password;
		this.role = role;
	}

	// DEFAULT CONSTRUCTOR

	public User() {

	}
}