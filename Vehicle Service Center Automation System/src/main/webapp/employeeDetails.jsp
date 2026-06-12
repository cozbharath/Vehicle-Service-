<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.vehicle.model.Employee"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Employee Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.employee-box {
	background: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.08);
}

.table th {
	vertical-align: middle;
}

.table td {
	vertical-align: middle;
}

.action-btns a {
	margin-right: 5px;
}
</style>

</head>

<body>

	<%@ include file="adminNavbar.jsp"%>

	<div class="employee-box">

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2>
				<i class="bi bi-people-fill"></i> Employee Details
			</h2>

			<a href="addEmployee.jsp" class="btn btn-primary"> <i
				class="bi bi-plus-circle"></i> Add Employee
			</a>

		</div>

		<table class="table table-bordered table-hover">

			<thead class="table-dark">

				<tr>

					<th>Employee ID</th>

					<th>Employee Name</th>

					<th>Designation</th>

					<th>Phone Number</th>

					<th>Email</th>

					<th>Actions</th>

				</tr>

			</thead>

			<tbody>

				<%
				List<Employee> employees = (List<Employee>) request.getAttribute("employees");

				if (employees != null && !employees.isEmpty()) {

					for (Employee emp : employees) {
				%>

				<tr>
					<td><%=emp.getEid()%></td>
					<td><%=emp.getEname()%></td>
					<td><%=emp.getErole()%></td>
					<td><%=emp.getPhoneno()%></td>
					<td><%=emp.getEmail()%></td>

					<td class="action-btns"><a
						href="EditEmployeeServlet?id=<%=emp.getEid()%>"
						class="btn btn-warning btn-sm"> <i class="bi bi-pencil-square"></i>
							Edit

					</a> <a href="DeleteEmployeeServlet?id=<%=emp.getEid()%>"
						class="btn btn-danger btn-sm"
						onclick="return confirm('Are you sure you want to delete this employee?')">

							<i class="bi bi-trash"></i> Delete

					</a></td>

				</tr>

				<%
				}
				} else {
				%>

				<tr>

					<td colspan="6" class="text-center text-muted">No Employee
						Records Found</td>

				</tr>

				<%
				}
				%>

			</tbody>

		</table>

	</div>

</body>
</html>