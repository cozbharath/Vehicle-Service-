<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Success</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script>
	setTimeout(function() {

		window.location.href = "CustomerServlet";

	}, 30000); // 30 seconds
</script>

</head>
<body>

	<div class="container mt-5">

		<div class="alert alert-success text-center">

			<h3>Customer Deleted Successfully</h3>

			<p>Redirecting to Customer Records Page in 20 seconds...</p>

		</div>

	</div>

</body>
</html>