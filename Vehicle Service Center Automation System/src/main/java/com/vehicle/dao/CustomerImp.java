package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.Customer;
import com.vehicle.utility.DBConnection;

public class CustomerImp implements CustomerDAO {

	@Override
	public String addCustomer(Customer c) {

		Connection con = null;

		String status = "fail";

		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con
					.prepareStatement("INSERT INTO customer(customer_name,mobile,email,address) VALUES(?,?,?,?)");

			ps.setString(1, c.getCname());
			ps.setLong(2, c.getCmobile());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getAddress());

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

	public List<Customer> getAllCustomers() {

		List<Customer> customerList = new ArrayList<>();

		Connection con = null;

		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM customer");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Customer c = new Customer();

				c.setCustomerId(rs.getInt("customer_id"));

				c.setCname(rs.getString("customer_name"));

				c.setCmobile(rs.getLong("mobile"));

				c.setEmail(rs.getString("email"));

				c.setAddress(rs.getString("address"));

				customerList.add(c);
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return customerList;
	}

	public int getTotalCustomers() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM customer");

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				count = rs.getInt(1);
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return count;
	}

	public int getNewCustomers() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con
					.prepareStatement("SELECT COUNT(*) FROM customer WHERE registration_date = CURDATE()");

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				count = rs.getInt(1);
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return count;
	}

	@Override
	public Customer getCustomerById(int customerId) {

		Customer c = null;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE customer_id=?");

			ps.setInt(1, customerId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				c = new Customer();

				c.setCustomerId(rs.getInt("customer_id"));
				c.setCname(rs.getString("customer_name"));
				c.setCmobile(rs.getLong("mobile"));
				c.setEmail(rs.getString("email"));
				c.setAddress(rs.getString("address"));
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}

	@Override
	public String updateCustomer(Customer c) {

		Connection con = null;
		String status = "fail";

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(
					"UPDATE customer SET customer_name=?, mobile=?, email=?, address=? WHERE customer_id=?");

			ps.setString(1, c.getCname());
			ps.setLong(2, c.getCmobile());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getAddress());
			ps.setInt(5, c.getCustomerId());

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public String deleteCustomer(int customerId) {

		String status = "fail";

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("DELETE FROM customer WHERE customer_id=?");

			ps.setInt(1, customerId);

			int n = ps.executeUpdate();

			if (n > 0) {
				status = "success";
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

}