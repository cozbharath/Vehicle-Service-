<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.vehicle.model.Bill"%>
<%@ page import="com.vehicle.model.ServiceDetail"%>
<%@ page import="java.util.List"%>

<%
Bill bill = (Bill) request.getAttribute("bill");

List<ServiceDetail> details = (List<ServiceDetail>) request.getAttribute("details");

if (bill == null) {
	response.sendRedirect("billing.jsp");
	return;

}
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Vehicle Service Invoice</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background: #f4f6f9;
}

.invoice-card {
	max-width: 1100px;
	margin: 30px auto;
	background: white;
	padding: 35px;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.company-name {
	font-size: 32px;
	font-weight: bold;
	color: #041233;
	text-align: center;
}

.company-address {
	text-align: center;
	color: gray;
	margin-bottom: 20px;
}

.invoice-title {
	text-align: center;
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 25px;
	color: #2563eb;
}

.total-box {
	background: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
	margin-top: 20px;
}

.total-row {
	font-size: 18px;
	margin-bottom: 10px;
}

.grand-total {
	font-size: 28px;
	font-weight: bold;
	color: green;
}

.btn-area {
	text-align: center;
	margin-top: 30px;
}

.footer {
	text-align: center;
	margin-top: 25px;
	color: gray;
	font-style: italic;
}
</style>

</head>

<body>

	<div class="container">


		<div class="invoice-card">

			<div class="company-name">Vehicle Service Center</div>

			<div class="company-address">Service • Repair • Maintenance</div>

			<hr>

			<div class="invoice-title">

				<i class="bi bi-receipt-cutoff"></i> TAX INVOICE

			</div>

			<table class="table table-bordered">

				<tr>
					<th width="30%">Bill ID</th>
					<td>BILL-<%=bill.getBookingId()%></td>
				</tr>

				<tr>
					<th>Booking ID</th>
					<td><%=bill.getBookingId()%></td>
				</tr>

				<tr>
					<th>Customer Name</th>
					<td><%=bill.getCustomerName()%></td>
				</tr>

				<tr>
					<th>Vehicle Number</th>
					<td><%=bill.getVehicleNumber()%></td>
				</tr>

				<tr>
					<th>Service Type</th>
					<td><%=bill.getServiceType()%></td>
				</tr>

			</table>

			<h4 class="mt-4">Parts & Service Details</h4>

			<table class="table table-bordered table-hover">

				<thead class="table-dark">

					<tr>

						<th>Part Name</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Total</th>
						<th>Work Done</th>
						<th>Remarks</th>

					</tr>

				</thead>

				<tbody>

					<%
					if (details != null) {

						for (ServiceDetail sd : details) {
					%>

					<tr>

						<td><%=sd.getPartName()%></td>

						<td><%=sd.getQuantity()%></td>

						<td>₹ <%=String.format("%.2f", sd.getUnitPrice())%>
						</td>

						<td>₹ <%=String.format("%.2f",

		sd.getQuantity() * sd.getUnitPrice())%>

						</td>

						<td><%=sd.getWorkDone()%></td>

						<td><%=sd.getRemarks()%></td>

					</tr>

					<%
					}
					}
					%>

				</tbody>

			</table>

			<h4 class="mt-4">Invoice Summary</h4>

			<table class="table table-bordered">

				<tr>

					<th>Parts Total</th>

					<td>₹ <%=String.format("%.2f",

		bill.getPartsTotal())%>

					</td>

				</tr>

				<tr>

					<th>Labour Charge</th>

					<td>₹ <%=String.format("%.2f",

		bill.getLabourCharge())%>

					</td>

				</tr>

				<tr>

					<th>GST (5%)</th>

					<td>₹ <%=String.format("%.2f",

		bill.getGst())%>

					</td>

				</tr>

			</table>

			<div class="total-box">

				<div class="total-row">

					Parts Total : ₹
					<%=String.format("%.2f",

		bill.getPartsTotal())%>

				</div>

				<div class="total-row">

					Labour Charge : ₹
					<%=String.format("%.2f",

		bill.getLabourCharge())%>

				</div>

				<div class="total-row">

					GST : ₹
					<%=String.format("%.2f",

		bill.getGst())%>

				</div>

				<hr>

				<div class="grand-total">

					Grand Total : ₹
					<%=String.format("%.2f",

		bill.getGrandTotal())%>

				</div>

			</div>

			<div class="footer">Thank You For Choosing Vehicle Service
				Center</div>

			<div class="btn-area">

				<button onclick="window.print()" class="btn btn-success">

					<i class="bi bi-printer-fill"></i> Print Invoice

				</button>

				<a href="billing.jsp" class="btn btn-primary"> <i
					class="bi bi-arrow-left"></i> Back To Billing

				</a>

			</div>

		</div>


	</div>

</body>
</html>
