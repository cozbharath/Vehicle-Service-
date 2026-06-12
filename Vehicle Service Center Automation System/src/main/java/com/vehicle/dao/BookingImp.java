package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.Booking;
import com.vehicle.model.CompletedService;
import com.vehicle.model.RecentBooking;
import com.vehicle.model.ServiceDetail;
import com.vehicle.utility.DBConnection;

public class BookingImp implements BookingDAO {

	Connection con = null;
	String status = "fail";

	@Override
	public String addBooking(Booking b) {

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO booking(customer_id,vehicle_id,employee_id,booking_date,service_type,problem_description,service_status) VALUES(?,?,?,?,?,?,?)");

			ps.setInt(1, b.getCustomerId());
			ps.setInt(2, b.getVehicleId());
			ps.setString(3, b.getEmployeeId());
			ps.setDate(4, b.getBookingDate());
			ps.setString(5, b.getServiceType());
			ps.setString(6, b.getProblemDescription());
			ps.setString(7, b.getServiceStatus());

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
	public int updateServiceStatus(Booking b) {

		int row = 0;

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			con.setAutoCommit(false);

			// Update Booking Status

			PreparedStatement ps1 = con.prepareStatement("UPDATE booking SET service_status=? WHERE booking_id=?");

			ps1.setString(1, b.getServiceStatus());
			ps1.setInt(2, b.getBookingId());

			ps1.executeUpdate();

			// Save Service Details

			PreparedStatement ps2 = con.prepareStatement(
					"INSERT INTO service_details(booking_id,part_name,quantity,unit_price,work_done,remarks) VALUES(?,?,?,?,?,?)");

			ps2.setInt(1, b.getBookingId());
			ps2.setString(2, b.getPartName());
			ps2.setInt(3, b.getQuantity());
			ps2.setDouble(4, b.getUnitPrice());
			ps2.setString(5, b.getWorkDone());
			ps2.setString(6, b.getRemarks());

			row = ps2.executeUpdate();

			con.commit();

		} catch (Exception e) {

			try {
				con.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			e.printStackTrace();
		}

		return row;
	}

	public int getTotalAssignedServices() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

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

	public int getCompletedServices() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con
					.prepareStatement("SELECT COUNT(*) FROM booking WHERE service_status='COMPLETED'");

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

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

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

	public List<RecentBooking> getAssignedServices() {

		List<RecentBooking> list = new ArrayList<>();

		try {

			Connection con = new DBConnection().getConnection();

			String sql = "SELECT b.booking_id, c.customer_name, " + "v.vehicle_no, b.service_type, b.service_status "
					+ "FROM booking b " + "JOIN customer c ON b.customer_id = c.customer_id "
					+ "JOIN vehicle v ON b.vehicle_id = v.vehicle_id";

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
	public int getTotalCompletedServices() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con
					.prepareStatement("SELECT COUNT(*) FROM booking WHERE service_status='COMPLETED'");

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
	public double getTotalRevenue() {

		double amount = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT IFNULL(SUM(amount),0) FROM payment");

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				amount = rs.getDouble(1);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return amount;
	}

	@Override
	public List<CompletedService> getCompletedServicesList() {

		List<CompletedService> list = new ArrayList<>();

		try {

			Connection con = new DBConnection().getConnection();

			String sql = "SELECT b.booking_id, " + "c.customer_name, " + "v.vehicle_no, " + "b.service_type, "
					+ "p.payment_date, " + "p.amount, " + "b.service_status " + "FROM booking b "
					+ "INNER JOIN customer c ON b.customer_id = c.customer_id "
					+ "INNER JOIN vehicle v ON b.vehicle_id = v.vehicle_id "
					+ "LEFT JOIN payment p ON b.booking_id = p.booking_id " + "WHERE b.service_status='COMPLETED'";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				CompletedService cs = new CompletedService();

				cs.setBookingId(rs.getInt("booking_id"));

				cs.setCustomerName(rs.getString("customer_name"));

				cs.setVehicleNo(rs.getString("vehicle_no"));

				cs.setServiceType(rs.getString("service_type"));

				cs.setCompletedDate(rs.getDate("payment_date"));

				cs.setAmount(rs.getDouble("amount"));

				cs.setStatus(rs.getString("service_status"));

				list.add(cs);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getBookingsToday() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM booking WHERE booking_date = CURDATE()");

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
	public List<RecentBooking> getAdminRecentBookings() {
		List<RecentBooking> list = new ArrayList<>();

		try {

			Connection con = new DBConnection().getConnection();

			String sql = "SELECT b.booking_id,c.customer_name,v.vehicle_no," + "e.employee_name,b.service_status "
					+ "FROM booking b " + "JOIN customer c ON b.customer_id=c.customer_id "
					+ "JOIN vehicle v ON b.vehicle_id=v.vehicle_id " + "JOIN employee e ON b.employee_id=e.employee_id "
					+ "ORDER BY b.booking_id DESC LIMIT 5";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				RecentBooking rb = new RecentBooking();

				rb.setBookingId(rs.getInt("booking_id"));
				rb.setCustomerName(rs.getString("customer_name"));
				rb.setVehicleNo(rs.getString("vehicle_no"));

				rb.setMechanicName(rs.getString("employee_name"));

				rb.setStatus(rs.getString("service_status"));

				list.add(rb);
			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	public List<ServiceDetail> getAllServiceDetails() {

		List<ServiceDetail> list = new ArrayList<>();

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM service_details");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ServiceDetail s = new ServiceDetail();

				s.setDetailId(rs.getInt("detail_id"));
				s.setBookingId(rs.getInt("booking_id"));
				s.setPartName(rs.getString("part_name"));
				s.setQuantity(rs.getInt("quantity"));
				s.setUnitPrice(rs.getDouble("unit_price"));
				s.setWorkDone(rs.getString("work_done"));
				s.setRemarks(rs.getString("remarks"));

				list.add(s);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}