package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.MonthlyReport;
import com.vehicle.model.RecentBooking;
import com.vehicle.utility.DBConnection;

public class DashboardCountsImp implements DashboardCountsDAO {

	public int getTotalCustomers() {
		int count = 0;
		Connection con = null;

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

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

	public int getTotalBookings() {
		int count = 0;
		Connection con = null;

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM booking");

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

	public int getPendingServices() {
		Connection con = null;
		int count = 0;

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM booking WHERE service_status='PENDING'");

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

	public List<RecentBooking> getRecentBookings() {

		List<RecentBooking> list = new ArrayList<>();

		Connection con = null;

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			String sql = "SELECT b.booking_id, c.customer_name, v.vehicle_no, " + "b.service_type, b.service_status "
					+ "FROM booking b " + "INNER JOIN customer c ON b.customer_id = c.customer_id "
					+ "INNER JOIN vehicle v ON b.vehicle_id = v.vehicle_id " + "ORDER BY b.booking_id DESC LIMIT 5";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				RecentBooking rb = new RecentBooking();

				rb.setBookingId(rs.getInt("booking_id"));
				rb.setCustomerName(rs.getString("customer_name"));
				rb.setVehicleNo(rs.getString("vehicle_no"));
				rb.setServiceType(rs.getString("service_type"));
				rb.setStatus(rs.getString("service_status"));

				list.add(rb);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MonthlyReport> getMonthlyReports() {

		List<MonthlyReport> list = new ArrayList<>();

		try {

			Connection con = new DBConnection().getConnection();

			String sql = "SELECT MONTHNAME(b.booking_date) AS month," + "COUNT(DISTINCT b.customer_id) AS customers,"
					+ "COUNT(b.booking_id) AS services," + "IFNULL(SUM(p.amount),0) AS revenue " + "FROM booking b "
					+ "LEFT JOIN payment p ON b.booking_id = p.booking_id "
					+ "GROUP BY MONTH(b.booking_date), MONTHNAME(b.booking_date) " + "ORDER BY MONTH(b.booking_date)";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				MonthlyReport mr = new MonthlyReport();

				mr.setMonth(rs.getString("month"));
				mr.setCustomers(rs.getInt("customers"));
				mr.setServices(rs.getInt("services"));
				mr.setRevenue(rs.getDouble("revenue"));

				list.add(mr);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public double getTotalRevenue() {
		Connection con = null;
		double revenue = 0;

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

			String query = "SELECT SUM(total_amount) FROM billing";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				revenue = rs.getDouble(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return revenue;
	}

}
