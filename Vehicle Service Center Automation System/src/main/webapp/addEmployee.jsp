<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Employee</title>

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
}

/* Main Content */
.main-content {
	margin-left: 250px;
	padding: 20px;
}

/* Topbar */
.topbar {
	background: white;
	padding: 15px 25px;
	border-radius: 10px;
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* Form Card */
.form-card {
	background: white;
	margin-top: 30px;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
}

/* Form Inputs */
.form-control, .form-select {
	height: 50px;
	border-radius: 10px;
}

/* Textarea */
textarea {
	border-radius: 10px !important;
}

/* Button */
.btn-save {
	height: 50px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
}

/* Responsive */
@media ( max-width :768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.main-content {
		margin-left: 0;
	}
}
</style>

</head>

<body>

	<%@ include file="adminNavbar.jsp"%>

	<!-- Form Section -->

	<div class="form-card">

		<form action="addEmployee" method="post">

			<div class="row">

				<!-- Employee ID -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Employee ID </label> <input type="text"
						name="employee_id" class="form-control"
						placeholder="Enter Employee ID" required>

				</div>

				<!-- Employee Name -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Employee Name </label> <input
						type="text" name="employee_name" class="form-control"
						placeholder="Enter Employee Name" required>

				</div>

				<!-- Mobile -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Mobile Number </label> <input
						type="text" name="mobile" class="form-control"
						placeholder="Enter Mobile Number">

				</div>

				<!-- Email -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Email Address </label> <input
						type="email" name="email" class="form-control"
						placeholder="Enter Email Address">

				</div>

				<!-- Address -->

				<div class="col-md-12 mb-3">

					<label class="form-label"> Address </label>

					<textarea name="address" rows="3" class="form-control"
						placeholder="Enter Address"></textarea>

				</div>

				<!-- Joining Date -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Joining Date </label> <input type="date"
						name="joining_date" class="form-control">

				</div>

				<!-- Salary -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Salary </label> <input type="number"
						name="salary" class="form-control" placeholder="Enter Salary">

				</div>

				<!-- Role -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Employee Role </label> <select
						name="role" class="form-select" required>

						<option value="">Select Role</option>

						<option value="ADMIN">Admin</option>

						<option value="RECEPTIONIST">Receptionist</option>

						<option value="MECHANIC">Mechanic</option>

					</select>

				</div>

				<!-- Username -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Username </label> <input type="text"
						name="username" class="form-control" placeholder="Create Username"
						required>

				</div>

				<!-- Password -->

				<div class="col-md-6 mb-3">

					<label class="form-label"> Password </label> <input type="password"
						name="password" class="form-control" placeholder="Create Password"
						required>

				</div>

			</div>

			<!-- Submit Button -->

			<div class="mt-4">

				<button type="submit" class="btn btn-primary btn-save w-100">

					<i class="bi bi-person-plus-fill"></i> Add Employee

				</button>

			</div>

		</form>

	</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>