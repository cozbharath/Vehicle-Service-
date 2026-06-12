package com.vehicle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vehicle.model.Employee;
import com.vehicle.utility.DBConnection;

public class EmployeeImp implements EmployeeDAO {

	Connection con = null;
	String status = "fail";

	@Override
	public String addEmployee(Employee e) {
		try {

			DBConnection db = new DBConnection();

			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement(

					"INSERT INTO employee(employee_id,user_id,employee_name,mobile,email,address,joining_date,salary,role) VALUES(?,?,?,?,?,?,?,?,?)"

			);

			ps.setString(1, e.getEid());

			ps.setInt(2, e.getUserid());

			ps.setString(3, e.getEname());

			ps.setLong(4, e.getPhoneno());

			ps.setString(5, e.getEmail());

			ps.setString(6, e.getAddress());

			ps.setString(7, e.getJoiningDate());

			ps.setDouble(8, e.getSalary());

			ps.setString(9, e.getErole());

			int n = ps.executeUpdate();

			if (n > 0) {

				status = "success";
			}

			con.close();

		} catch (Exception ex) {

			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public String updateEmployee(Employee e) {

		String status = "fail";

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			String query = "UPDATE employee SET employee_name=?, mobile=?, email=?, address=?, joining_date=?, salary=?, role=? WHERE employee_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getEname());
			ps.setLong(2, e.getPhoneno());
			ps.setString(3, e.getEmail());
			ps.setString(4, e.getAddress());
			ps.setString(5, e.getJoiningDate());
			ps.setDouble(6, e.getSalary());
			ps.setString(7, e.getErole());
			ps.setString(8, e.getEid());

			int row = ps.executeUpdate();

			if (row > 0) {
				status = "success";
			}

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public String deleteEmployee(String eid) {

		String status = "fail";

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			String query = "DELETE FROM employee WHERE employee_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, eid);

			int row = ps.executeUpdate();

			if (row > 0) {
				status = "success";
			}

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	@Override
	public List<Employee> getAllEmployees() {

		List<Employee> list = new ArrayList<>();

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM employee");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Employee e = new Employee();

				e.setEid(rs.getString("employee_id"));
				e.setUserid(rs.getInt("user_id"));
				e.setEname(rs.getString("employee_name"));
				e.setPhoneno(rs.getLong("mobile"));
				e.setEmail(rs.getString("email"));
				e.setAddress(rs.getString("address"));
				e.setJoiningDate(rs.getString("joining_date"));
				e.setSalary(rs.getDouble("salary"));
				e.setErole(rs.getString("role"));

				list.add(e);
			}

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public int getTotalMechanics() {

		int count = 0;

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM employee WHERE role='MECHANIC'");

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
	public Employee getEmployeeById(String eid) {

		Employee e = null;

		try {

			DBConnection db = new DBConnection();
			con = db.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE employee_id=?");

			ps.setString(1, eid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e = new Employee();

				e.setEid(rs.getString("employee_id"));
				e.setUserid(rs.getInt("user_id"));
				e.setEname(rs.getString("employee_name"));
				e.setPhoneno(rs.getLong("mobile"));
				e.setEmail(rs.getString("email"));
				e.setAddress(rs.getString("address"));
				e.setJoiningDate(rs.getString("joining_date"));
				e.setSalary(rs.getDouble("salary"));
				e.setErole(rs.getString("role"));
			}

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

}
