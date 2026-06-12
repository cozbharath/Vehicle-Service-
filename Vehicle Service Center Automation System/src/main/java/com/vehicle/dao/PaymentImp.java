package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.vehicle.model.Payment;
import com.vehicle.utility.DBConnection;

public class PaymentImp implements PaymentDAO {

	Connection con = null;
	String status = "fail";

	@Override
	public String addPayment(Payment p) {

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"INSERT INTO payment " + "(booking_id,amount," + "payment_mode," + "payment_status,"
							+ "payment_date)" + " VALUES(?,?,?,?,?)");

			ps.setInt(1, p.getBookingId());

			ps.setDouble(2, p.getAmount());

			ps.setString(3, p.getPaymentMode());

			ps.setString(4, p.getPaymentStatus());

			ps.setDate(5, p.getPaymentDate());

			int n = ps.executeUpdate();

			if (n > 0) {

				status = "success";
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

	@Override
	public double getTotalRevenue() {
		double revenue = 0;

	    try {

	        Connection con = new DBConnection().getConnection();

	        PreparedStatement ps = con.prepareStatement(
	                "SELECT IFNULL(SUM(amount),0) FROM payment");

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            revenue = rs.getDouble(1);
	        }

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return revenue;
	}

}
