package com.vehicle.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/VehicleService", "root", "Bharath@8184");
		} catch (Exception e) {
			System.out.println(e);
		}

		return con;
	}
}
