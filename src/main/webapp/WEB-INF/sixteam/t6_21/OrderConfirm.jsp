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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />


	<!-- Checkout Start -->
	<form action="/payment/checkout" method="post">

		<div class="container-fluid pt-5">

			<div class="row px-xl-5">
				<div class="col-lg-8">
					<div class="mb-4">
						<h4 class="font-weight-semi-bold mb-4">請填寫以下訂購資訊</h4>
						<div class="row">
							<div class="col-md-6 form-group">
								<label>帳號:</label> <input class="form-control" type="text"
									name="memberAccount" id="memberAccount"
									value="${LoginOK.userName}" readonly>
							</div>

							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="email"
									name="memberEmail" id="memberEmail"
									placeholder="example@email.com" required>
							</div>
							<div class="col-md-6 form-group">
								<label>手機號碼:</label> <input class="form-control" type="text"
									name="memberPhone" id="memberPhone" placeholder="09123 456 78"
									pattern="09\d{2}\d{6}" maxlength="11" required>
							</div>
							<div class="col-md-6 form-group" >
								<label></label> <input type="button" value='一鍵輸入'
							class="btn btn-info btn-user btn-block btn-sm" id="inputform" style="margin-top:25px">
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card border-secondary mb-5">
						<div class="card-header" style="background-color: #002347">
							<h4 class="font-weight-semi-bold m-0" style="color: #fdc632">訂單總覽</h4>
						</div>
						<c:forEach var="anEntry" items="${ShoppingCart.getContent()}">
							<div class="card-body">
								<h5 class="font-weight-medium mb-3">課程</h5>
								<div class="d-flex justify-content-between">
									<p>${anEntry.value.description}<br />
									<p style="text-align: right">
										x${anEntry.value.quantity}<br />
										${anEntry.value.unitPrice*anEntry.value.quantity}
									</p>

								</div>
							</div>
						</c:forEach>

						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">Total</h5>
								<h5 class="font-weight-bold">${ShoppingCart.getSubtotal()}</h5>
							</div>
						</div>
					</div>
					<div class="card border-secondary mb-5">
						<div class="card-header" style="background-color: #002347">
							<h4 class="font-weight-semi-bold m-0" style="color: #fdc632">付款方式</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
										id="paypal"> <label class="custom-control-label"
										for="paypal">信用卡付款</label>
								</div>
							</div>
							<!-- 							<div class="form-group"> -->
							<!-- 								<div class="custom-control custom-radio"> -->
							<!-- 									<input type="radio" class="custom-control-input" name="payment" -->
							<!-- 										id="directcheck"> <label class="custom-control-label" -->
							<!-- 										for="directcheck">Direct Check</label> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<!-- 							<div class=""> -->
							<!-- 								<div class="custom-control custom-radio"> -->
							<!-- 									<input type="radio" class="custom-control-input" name="payment" -->
							<!-- 										id="banktransfer"> <label class="custom-control-label" -->
							<!-- 										for="banktransfer">Bank Transfer</label> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<button onClick="return Abort();"
								class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3 orderConfirm"
								style="background-color: #002347">訂單確認</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Checkout End -->
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		function Abort() {
			if (confirm("確定送出訂單 ? ")) {
				return true;
			} else {
				return false;
			}
		}
		   $(function () {
			    
			     $(document).ready(function () {  
			   $('#inputform').on('click',function(){
			             $('#memberEmail').attr('value','teemin20230202@gmail.com')
			             $('#memberPhone').attr('value','0920178266')
			      })
			    
			     
			    })
		   })
		// 					$('.orderConfirm').on('click', function() {
		// 						    	 var formData = $("#form-id").serialize();
		// 						let memberId = $('#memberId').val();
		// 						let memberAccount = $('#memberAccount').val();
		// 						let memberEmail = $('#memberEmail').val();
		// 						let memberPhone = $('#memberPhone').val();
		// 						console.log(memberId);
		// 						console.log(memberAccount);
		// 						console.log(memberEmail);
		// 						console.log(memberPhone);

		// 						$.ajax({
		// 							url : '/orderConfirm.controller',
		// 							method : "post",
		// 							dataType : "text",
		// 							data : {
		// 								"memberAccount" : memberAccount,
		// 								"memberEmail" : memberEmail,
		// 								"memberPhone" : memberPhone,
		// 							},
		// 						})
		// 						.done(function() {
		// 							alert('成功'),
		// 							location.href ="OrderSuccess.jsp",

		// 						}).fail(function() {
		// 							alert("失敗")
		// 						})
		// 					});
	</script>
</body>
</html>