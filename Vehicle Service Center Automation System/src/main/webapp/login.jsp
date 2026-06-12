<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>VSMS Login</title>

<!-- Bootstrap CDN -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

/* Body */
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background: #f4f6f9;
}

/* Main Container */
.main-container {
	height: 100vh;
}

/* Left Side */
.left-side {
	background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
		url('https://images.unsplash.com/photo-1503376780353-7e6692767b70');
	background-size: cover;
	background-position: center;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 50px;
	/* border-radius: 20px; */
}

/* Left Content */
.left-content h1 {
	font-size: 60px;
	font-weight: bold;
	margin-bottom: 20px;
}

.left-content p {
	font-size: 20px;
	line-height: 1.8;
}

/* Right Side */
.right-side {
	background: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Login Card */
.login-card {
	width: 100%;
	max-width: 400px;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
}

/* Title */
.login-title {
	text-align: center;
	margin-bottom: 30px;
	font-weight: bold;
	color: #111827;
}

/* Inputs */
.form-control {
	height: 50px;
	border-radius: 10px;
}

/* Button */
.login-btn {
	width: 100%;
	height: 50px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
}

/* Forgot Password */
.forgot-password {
	text-align: right;
	margin-top: 10px;
}

/* Responsive */
@media ( max-width :768px) {
	.left-side {
		display: none;
	}
	.right-side {
		width: 100%;
	}
}
</style>

</head>

<body>

	<div class="container-fluid">

		<div class="row main-container">

			<!-- Left Side -->

			<div class="col-lg-8 left-side">

				<div class="left-content">

					<h1>VSMS</h1>

					<h2>Vehicle Service Management System</h2>

					<p>Manage vehicle servicing, customer bookings, mechanic
						assignments, billing, and service tracking with our smart
						automation platform.</p>

					<p>Secure • Fast • Reliable • Professional</p>

				</div>

			</div>

			<!-- Right Side -->

			<div class="col-lg-4 right-side">

				<div class="login-card">

					<h2 class="login-title">Employees Login</h2>

					<form action="Servlet" method="post">

						<!-- Username -->

						<div class="mb-3">

							<label class="form-label"> Username </label> <input type="text"
								name="username" class="form-control"
								placeholder="Enter Username" required>


						<!-- Password -->

						<div class="mb-3">

							<label class="form-label"> Password </label> <input
								type="password" name="password" class="form-control"
								placeholder="Enter Password" required>

						</div>

						<!-- <!-- Role -->

						<!-- <div class="mb-3">

							<label class="form-label"> Select Role </label> <select
								name="role" class="form-select form-control" required>

								<option value="">Select Role</option>

								<option value="ADMIN">Admin</option>

								<option value="RECEPTIONIST">Receptionist</option>

								<option value="MECHANIC">Mechanic</option>

							</select>

						</div>
 -->

						<div class="forgot-password">

							<a href="#"> Forgot Password? </a>

						</div>

						
						<div class="mt-4">

							<button type="submit" class="btn btn-primary login-btn">

								Login</button>

						</div>

					</form>

					<!-- <!-- Back Home -->

					<!-- <div class="text-center mt-4">

						<a href="../html/index.html"> ← Back to Home </a>

					</div> -->

				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>