package com.vehicle.dao;

import java.util.List;

import com.vehicle.model.Customer;

public interface CustomerDAO {

	public String addCustomer(Customer c);

	public List<Customer> getAllCustomers();

	public Customer getCustomerById(int customerId);

	public String updateCustomer(Customer c);

	public int getTotalCustomers();

	public int getNewCustomers();

	public String deleteCustomer(int customerId);
}
