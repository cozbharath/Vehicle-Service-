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

/* Sidebar */
.sidebar {
	width: 280px;
	height: 100vh;
	background: #041233;
	position: fixed;
	left: 0;
	top: 0;
	color: white;
}

/* Logo */
.logo {
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	padding: 30px 0;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

/* Menu */
.sidebar a {
	display: block;
	color: white;
	text-decoration: none;
	padding: 20px 25px;
	font-size: 18px;
	transition: 0.3s;
}

.sidebar a:hover {
	background: #2f63e0;
	color: white;
}

.sidebar a i {
	margin-right: 12px;
}

/* Main Content */
.main-content {
	margin-left: 280px;
	padding: 20px;
}

/* Top Bar */
.topbar {
	background: white;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.topbar h3 {
	margin: 0;
	font-weight: bold;
	color: #041233;
}
</style>

<!-- Sidebar -->

<div class="sidebar">

	<div class="logo">VSMS</div>

	<a href="./dashboard.jsp"> <i class="bi bi-speedometer2"></i>
		Dashboard
	</a> <a href="./addEmployee.jsp"> <i class="bi bi-person-plus-fill"></i>
		Add Employee
	</a> <a href="EmployeeDetails"> <i class="bi bi-people-fill"></i>
		Employee Details
	</a> </a> <a href="ReportServlet"> <i class="bi bi-bar-chart-fill"></i>
		Reports
	</a> <a href="./profile.jsp"> <i class="bi bi-person-circle"></i>
		Profile
	</a> <a href="login.jsp"> <i class="bi bi-box-arrow-right"></i> Logout
	</a>

</div>

<!-- Main Content -->

<div class="main-content">

	<div class="topbar">

		<h3>Admin Panel</h3>

		<div>
			<i class="bi bi-person-circle"></i> Welcome
			<%=session.getAttribute("username")%>
		</div>

	</div>