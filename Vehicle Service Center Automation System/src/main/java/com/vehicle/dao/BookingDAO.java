package com.vehicle.dao;

import java.util.List;

import com.vehicle.model.Booking;
import com.vehicle.model.CompletedService;
import com.vehicle.model.RecentBooking;
import com.vehicle.model.ServiceDetail;

public interface BookingDAO {

	public String addBooking(Booking b);

	public int updateServiceStatus(Booking b);

	public int getTotalAssignedServices();

	public int getCompletedServices();

	public int getPendingServices();

	public List<RecentBooking> getAssignedServices();

	public int getTotalCompletedServices();

	public double getTotalRevenue();

	public List<CompletedService> getCompletedServicesList();

	public int getBookingsToday();

	public List<RecentBooking> getAdminRecentBookings();
	
	public List<ServiceDetail> getAllServiceDetails();

}