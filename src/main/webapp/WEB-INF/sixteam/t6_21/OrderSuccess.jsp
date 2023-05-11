<%@page import="sixteam.t6_21.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
<link rel="stylesheet" href="/front_index/css/flaticon.css" />
<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="/front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="/front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />


	<section class="order_details section-margin--small"
		style="margin: 100px">
		<div class="container">
			<!-- 			<p class="text-center billing-alert">Thank you. Your order has -->
			<!-- 				been received.</p> -->
			<div
				style="display: flex; justify-content: center; width: 300px; height: 100px">
				<h3 class="billing-title"
					style="position: absolute; margin: 0px -600px 0 100px; font-weight: bolder">感謝您的訂購，請確認以下訂單訊息</h3>
			</div>
			<div class="row mb-5">
				<div class="col-md-6 col-xl-4 mb-4 mb-xl-0"
					style="margin-left: 400px">
					<div class="confirmation-card">
						<h3 class="billing-title" style="font-weight: bolder">訂購人資訊</h3>
						<table class="order-rable">
							<tr>
								<td>訂購人姓名:</td>
								<td>${LoginOK.userName}</td>
							</tr>
							<tr>
								<td>訂購日期:</td>
								<td>${bean.orderDate}</td>
							</tr>
							<tr>
								<td>訂購人電話:</td>
								<td>${bean.memberPhone}</td>
							</tr>
							<tr>
								<td>訂購人信箱:</td>
								<td>${bean.memberEmail}</td>
							</tr>
							<tr>
								<td>總金額:</td>
								<td>${bean.orderPrice}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="order_details_table">
				<h2>訂單明細</h2>
				<div class="table-responsive">
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">訂單細節</h4>
						</div>
						<c:forEach var="oib" items="${orderItem}">
							<div class="card-body">
								<h5 class="font-weight-medium mb-3">課程</h5>
								<div class="d-flex justify-content-between">
									<p>${oib.description}<br />
									<p style="text-align: right">
										x${oib.quantity}<br /> ${oib.unitPrice}
									</p>

								</div>
							</div>
						</c:forEach>

						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">Total</h5>
								<h5 class="font-weight-bold">${bean.orderPrice}</h5>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div style="margin-left: 500px">
				<a href="showAllClass.controller">回課程購物列表</a>
			</div>
		</div>
	</section>

	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		
	</script>
</body>
</html>