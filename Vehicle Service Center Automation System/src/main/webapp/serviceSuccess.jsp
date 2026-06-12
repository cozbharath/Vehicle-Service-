<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{
	background:#f4f6f9;
	display:flex;
	justify-content:center;
	align-items:center;
	height:100vh;
}

.success-card{
	background:white;
	padding:40px;
	border-radius:15px;
	box-shadow:0px 4px 15px rgba(0,0,0,0.1);
	text-align:center;
	width:500px;
}

.success-icon{
	font-size:80px;
	color:green;
}

.success-title{
	font-size:32px;
	font-weight:bold;
	margin-top:15px;
	color:#041233;
}

.success-msg{
	font-size:18px;
	margin-top:15px;
	color:#555;
}

.btn-dashboard{
	margin-top:25px;
	height:50px;
	font-size:18px;
	font-weight:bold;
}

</style>

</head>

<body>

<div class="success-card">

```
<div class="success-icon">
	<i class="bi bi-check-circle-fill"></i>
</div>

<div class="success-title">
	Service Details Saved
</div>

<div class="success-msg">
	Service status and service details have been saved successfully.
</div>

<a href="dashboard.jsp"
	class="btn btn-primary btn-dashboard">

	<i class="bi bi-house-fill"></i>
	Go To Dashboard

</a>
```

</div>

</body>
</html>
