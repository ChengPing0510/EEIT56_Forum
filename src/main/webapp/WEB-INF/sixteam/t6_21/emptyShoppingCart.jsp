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

</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />





	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table class="table table-bordered text-center mb-0">
					<thead class="bg-secondary" style="color: #fdc632">
						<tr>
							<th style="background-color: #002347">導師+課程名稱</th>
							<th style="background-color: #002347">單價</th>
							<th style="background-color: #002347">數量</th>
							<th style="background-color: #002347">價格</th>
							<th style="background-color: #002347"></th>
						</tr>
					</thead>
					<tbody class="align-middle">


							<tr>
								<td class="align-middle" style="float: left;"></td>

								<td class="align-middle oneprice"></td>

								<td class="align-middle">
									<div class="input-group quantity mx-auto update"
										style="width: 100px;">

										
									</div>
								</td>

								<td class="align-middle newprice"></td>

								<td class="align-middle">
									<button class="btn btn-sm btn-primary deleteClass"
										id="">
										<i class="fa fa-times"></i>
									</button>
								</td>

							</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<div class="card border-secondary mb-5"
					style="background-color: transparent">
					<div class="card-header" style="background-color: #002347">
						<h4 class="font-weight-semi-bold m-0" style="color: #fdc632">購物車總覽</h4>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium allprice"></h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">購買課程數量:</h6>
							<h6 class="font-weight-medium allquantity"></h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">總計:</h5>
							<h5 class="font-weight-bold allprice"></h5>
						</div>
						<button class="btn btn-block btn-primary my-3 py-3 checkout"
							style="background-color: #002347">
							<a href="" style="color: white">去結帳</a>
						</button>
						<a href="" onClick="return Abort();"
							style="float: right; color: #002347">放棄購物?</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />

</body>
</html>