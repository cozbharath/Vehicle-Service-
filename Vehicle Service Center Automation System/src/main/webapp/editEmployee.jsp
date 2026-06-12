<!-- editEmployee.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.vehicle.model.Employee"%>

<%
Employee emp = (Employee) request.getAttribute("employee");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<div class="container mt-5">

		<div class="card shadow">

			<div class="card-header bg-primary text-white">
				<h3>Edit Employee</h3>
			</div>

			<div class="card-body">
				<form action="EmployeeDetails" method="post">

					<div class="mb-3">
						<label>Employee ID</label> <input type="text" class="form-control"
							name="eid" value="<%=emp.getEid()%>" readonly>
					</div>

					<div class="mb-3">
						<label>Employee Name</label> <input type="text"
							class="form-control" name="ename" value="<%=emp.getEname()%>">
					</div>

					<div class="mb-3">
						<label>Phone Number</label> <input type="text"
							class="form-control" name="phoneno" value="<%=emp.getPhoneno()%>">
					</div>

					<div class="mb-3">
						<label>Email</label> <input type="email" class="form-control"
							name="email" value="<%=emp.getEmail()%>">
					</div>

					<div class="mb-3">
						<label>Address</label> <input type="text" class="form-control"
							name="address" value="<%=emp.getAddress()%>">
					</div>

					<div class="mb-3">
						<label>Salary</label> <input type="text" class="form-control"
							name="salary" value="<%=emp.getSalary()%>">
					</div>

					<div class="mb-3">
						<label>Role</label> <input type="text" class="form-control"
							name="role" value="<%=emp.getErole()%>">
					</div>

					<button type="submit" class="btn btn-success">Update
						Employee</button>

				</form>

			</div>

		</div>

	</div>

</body>
</html>
