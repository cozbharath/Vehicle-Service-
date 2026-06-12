package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.Bill;
import com.vehicle.model.ServiceDetail;
import com.vehicle.utility.DBConnection;

public class BillImp implements BillDAO {

	Connection con = null;

	@Override
	public Bill generateBill(int bookingId) {

		Bill bill = null;

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			String query = "SELECT b.booking_id, " + "c.customer_name, " + "v.vehicle_no, " + "b.service_type, "
					+ "SUM(sd.quantity * sd.unit_price) AS parts_total " + "FROM booking b " + "INNER JOIN customer c "
					+ "ON b.customer_id = c.customer_id " + "INNER JOIN vehicle v " + "ON b.vehicle_id = v.vehicle_id "
					+ "INNER JOIN service_details sd " + "ON b.booking_id = sd.booking_id " + "WHERE b.booking_id = ? "
					+ "GROUP BY b.booking_id, " + "c.customer_name, " + "v.vehicle_no, " + "b.service_type";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, bookingId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				bill = new Bill();

				double partsTotal = rs.getDouble("parts_total");

				double labourCharge = 600.0;

				double gst = (partsTotal + labourCharge) * 0.05;

				double grandTotal = partsTotal + labourCharge + gst;

				bill.setBookingId(rs.getInt("booking_id"));

				bill.setCustomerName(rs.getString("customer_name"));

				bill.setVehicleNumber(rs.getString("vehicle_no"));

				bill.setServiceType(rs.getString("service_type"));

				bill.setPartsTotal(partsTotal);

				bill.setLabourCharge(labourCharge);

				bill.setGst(gst);

				bill.setGrandTotal(grandTotal);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return bill;
	}

// Fetch Service Details For Invoice

	public List<ServiceDetail> getServiceDetails(int bookingId) {

		List<ServiceDetail> list = new ArrayList<>();

		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"SELECT * FROM service_details " + "WHERE booking_id=?");

			ps.setInt(1, bookingId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ServiceDetail sd = new ServiceDetail();

				sd.setDetailId(rs.getInt("detail_id"));

				sd.setBookingId(rs.getInt("booking_id"));

				sd.setPartName(rs.getString("part_name"));

				sd.setQuantity(rs.getInt("quantity"));

				sd.setUnitPrice(rs.getDouble("unit_price"));

				sd.setWorkDone(rs.getString("work_done"));

				sd.setRemarks(rs.getString("remarks"));

				list.add(sd);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

}
