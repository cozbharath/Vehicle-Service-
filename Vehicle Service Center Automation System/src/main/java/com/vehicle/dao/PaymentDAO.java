package com.vehicle.dao;

import com.vehicle.model.Payment;

public interface PaymentDAO {

	String addPayment(Payment p);

	public double getTotalRevenue();

}
