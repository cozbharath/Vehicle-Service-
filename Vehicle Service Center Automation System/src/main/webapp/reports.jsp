<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.MonthlyReport"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Reports</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.report-card {
	background: white;
	padding: 30px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
}

.report-card i {
	font-size: 45px;
	color: #2563eb;
}

.report-table {
	background: white;
	padding: 25px;
	border-radius: 15px;
	margin-top: 25px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
}
</style>

</head>

<body>

	<%@ include file="adminNavbar.jsp"%>

	<div class="row g-4">

		<div class="col-md-4">

			<div class="report-card">

				<i class="bi bi-people-fill"></i>

				<h2><%=request.getAttribute("totalCustomers")%></h2>

				<p>Total Customers</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="report-card">

				<i class="bi bi-tools"></i>

				<h2><%=request.getAttribute("totalServices")%></h2>


				<p>Total Services</p>

			</div>

		</div>

		<div class="col-md-4">

			<div class="report-card">

				<i class="bi bi-currency-rupee"></i>

				<h2>
					₹<%=request.getAttribute("totalRevenue")%></h2>

				<p>Total Revenue</p>

			</div>

		</div>

	</div>

	<div class="report-table">

		<h3>Monthly Service Report</h3>

		<table class="table table-bordered table-hover mt-3">

			<thead class="table-dark">

				<tr>

					<th>Month</th>

					<th>Customers</th>

					<th>Services</th>

					<th>Revenue</th>

				</tr>

			</thead>

			<tbody>

				<%
				List<MonthlyReport> reports = (List<MonthlyReport>) request.getAttribute("reports");

				if (reports != null) {
					for (MonthlyReport report : reports) {
				%>

				<tr>
					<td><%=report.getMonth()%></td>
					<td><%=report.getCustomers()%></td>
					<td><%=report.getServices()%></td>
					<td>₹<%=report.getRevenue()%></td>
				</tr>

				<%
				}
				}
				%>

			</tbody>

		</table>

	</div>

</body>
</html>