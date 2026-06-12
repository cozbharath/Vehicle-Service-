<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Employee Added</title>

<!-- Bootstrap -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

/* Body */
body {
	margin: 0;
	padding: 0;
	background: #f4f6f9;
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* Success Card */
.success-card {
	width: 500px;
	background: white;
	padding: 40px;
	border-radius: 20px;
	text-align: center;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

/* Success Icon */
.success-icon {
	font-size: 80px;
	color: #16a34a;
	margin-bottom: 20px;
}

/* Title */
.success-title {
	font-size: 32px;
	font-weight: bold;
	color: #111827;
	margin-bottom: 15px;
}

/* Message */
.success-message {
	font-size: 18px;
	color: #6b7280;
	margin-bottom: 30px;
}

/* Buttons */
.btn-custom {
	height: 50px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
}
</style>

</head>

<body>

	<div class="success-card">

		<!-- Icon -->

		<div class="success-icon">

			<i class="bi bi-check-circle-fill"></i>

		</div>

		<!-- Title -->

		<div class="success-title">Employee Added Successfully</div>

		<!-- Message -->

		<div class="success-message">Employee details have been added
			successfully into the system.</div>

		<!-- Buttons -->

		<div class="d-grid gap-3">

			<a href="${pageContext.request.contextPath}//addEmployee.jsp"
				class="btn btn-primary btn-custom"> Add Another Employee </a> <a
				href="${pageContext.request.contextPath}/dashboard.jsp"
				class="btn btn-success btn-custom"> Go To Dashboard </a>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>