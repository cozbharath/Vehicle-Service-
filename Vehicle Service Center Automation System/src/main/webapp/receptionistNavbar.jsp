<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

.sidebar {
	width: 280px;
	height: 100vh;
	background: #041233;
	position: fixed;
	left: 0;
	top: 0;
	color: white;
	overflow-y: auto;
}

.logo {
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	padding: 30px 0;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.sidebar a {
	display: flex;
	align-items: center;
	gap: 15px;
	color: white;
	text-decoration: none;
	padding: 18px 25px;
	font-size: 18px;
	transition: 0.3s;
}

.sidebar a:hover {
	background: #2563eb;
	padding-left: 30px;
}

.sidebar a i {
	font-size: 22px;
	width: 25px;
}

.main-content {
	margin-left: 280px;
	padding: 20px;
}

.topbar {
	background: white;
	padding: 20px 30px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
}

.topbar h2 {
	margin: 0;
	color: #041233;
	font-size: 32px;
	font-weight: bold;
}

.user-info {
	font-size: 18px;
	font-weight: 500;
}

.user-info i {
	margin-right: 8px;
}
</style>

<div class="sidebar">

	<div class="logo">VSMS</div>

	<a href="receptionistDashboard.jsp"> <i class="bi bi-speedometer2"></i>
		Dashboard
	</a> <a href="CustomerServlet"> <i class="bi bi-people-fill"></i>
		Customers
	</a> <a href="VehicleServlet"> <i class="bi bi-car-front-fill"></i>
		Vehicles
	</a> <a href="serviceBooking.jsp"> <i class="bi bi-calendar-check"></i>
		Service Booking
	</a> <a href="serviceHistory.jsp"> <i class="bi bi-clock-history"></i>
		Service History
	</a> <a href="billing.jsp"> <i class="bi bi-receipt"></i> Billing
	</a> <a href="profile.jsp"> <i class="bi bi-person-circle"></i> Profile
	</a> <a href="login.jsp"> <i class="bi bi-box-arrow-right"></i> Logout
	</a>

</div>

<div class="main-content">

	<div class="topbar">

		<h2>Receptionist Panel</h2>

		<div class="user-info">
			<i class="bi bi-person-circle"></i> Welcome
			<%=session.getAttribute("username") != null ? session.getAttribute("username") : "Receptionist"%>
		</div>

	</div>