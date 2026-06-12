<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Customer Added</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: Arial, sans-serif;
}

.success-card {
	width: 600px;
	background: white;
	padding: 40px;
	border-radius: 20px;
	text-align: center;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

.success-icon {
	font-size: 80px;
	color: #28a745;
	margin-bottom: 20px;
}

.success-title {
	font-size: 32px;
	font-weight: bold;
	color: #28a745;
	margin-bottom: 15px;
}

.success-text {
	font-size: 18px;
	color: #555;
	margin-bottom: 30px;
}

.btn-custom {
	width: 200px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>

<body>

	<div class="success-card">

		<div class="success-icon">

			<i class="bi bi-check-circle-fill"></i>

		</div>

		<h1 class="success-title">Customer Added Successfully</h1>

		<p class="success-text">The customer details have been saved into
			the system.</p>

		<div class="d-flex justify-content-center gap-3">

			<a href="customers.jsp" class="btn btn-primary btn-custom"> Add
				Another </a> <a href="receptionistDashboard.jsp"
				class="btn btn-success btn-custom"> Dashboard </a>

		</div>

	</div>

</body>
</html>