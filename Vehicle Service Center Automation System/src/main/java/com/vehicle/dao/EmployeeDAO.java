package com.vehicle.dao;

import java.util.List;

import com.vehicle.model.Employee;

public interface EmployeeDAO {

	public String addEmployee(Employee e);

	public String updateEmployee(Employee e);

	public String deleteEmployee(String eid);

	public Employee getEmployeeById(String eid);

	public List<Employee> getAllEmployees();

	public int getTotalMechanics();
}
