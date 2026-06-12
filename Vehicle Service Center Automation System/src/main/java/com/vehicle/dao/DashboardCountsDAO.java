package com.vehicle.dao;

import java.util.List;

import com.vehicle.model.MonthlyReport;
import com.vehicle.model.RecentBooking;

public interface DashboardCountsDAO {

	public int getTotalCustomers();

	public int getTotalBookings();

	public int getPendingServices();

	public double getTotalRevenue();

	public List<RecentBooking> getRecentBookings();

	public List<MonthlyReport> getMonthlyReports();

}