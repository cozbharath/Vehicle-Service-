package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.Vehicle;
import com.vehicle.utility.DBConnection;

public class VehicleImp implements VehicleDAO {

	@Override
	public String addVehicle(Vehicle v) {
		Connection con = null;
		String status = "fail";

		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"INSERT INTO vehicle(customer_id,vehicle_no,brand,model,fuel_type,manufacturing_year) VALUES(?,?,?,?,?,?)");

			ps.setInt(1, v.getCustomerId());
			ps.setString(2, v.getVehicleNo());
			ps.setString(3, v.getBrand());
			ps.setString(4, v.getModel());
			ps.setString(5, v.getFuelType());
			ps.setInt(6, v.getManufacturingYear());

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

	public List<Vehicle> getAllVehicles() {

		Connection con = null;

		List<Vehicle> list = new ArrayList<>();

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM vehicle");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Vehicle v = new Vehicle();

				v.setVehicleId(rs.getInt("vehicle_id"));

				v.setCustomerId(rs.getInt("customer_id"));

				v.setVehicleNo(rs.getString("vehicle_no"));

				v.setBrand(rs.getString("brand"));

				v.setModel(rs.getString("model"));

				v.setFuelType(rs.getString("fuel_type"));

				v.setManufacturingYear(rs.getInt("manufacturing_year"));

				list.add(v);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getTotalVehicles() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM vehicle");

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

	public int getVehiclesInService() {

		int count = 0;

		try {

			Connection con = new DBConnection().getConnection();

			PreparedStatement ps = con
					.prepareStatement("SELECT COUNT(*) FROM booking WHERE service_status='IN_PROGRESS'");

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

	public int getServiceDue() {

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
}