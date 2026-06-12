package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.vehicle.model.User;
import com.vehicle.utility.DBConnection;

public class UserDao implements UserInterface {

	Connection con = null;

	String status = "fail";

	// INSERT USER

	@Override
	public int insertUser(User u) {

		int userId = 0;

		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"INSERT INTO users(username,password,role) VALUES(?,?,?)",

					PreparedStatement.RETURN_GENERATED_KEYS

			);

			ps.setString(1, u.getUsername());

			ps.setString(2, u.getPassword());

			ps.setString(3, u.getRole());

			int n = ps.executeUpdate();

			if (n > 0) {

				ResultSet rs = ps.getGeneratedKeys();

				if (rs.next()) {

					userId = rs.getInt(1);
				}
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return userId;
	}

	public String checkLogin(String username, String password) {

		String role = null;

		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"SELECT role FROM users WHERE username=? AND password=?"

			);

			ps.setString(1, username);

			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				role = rs.getString("role");
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return role;
	}
}