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


						<c:forEach var="anEntry" items="${ShoppingCart.getContent()}">
							<tr>
								<td class="align-middle" style="float: left;"><img
									src="t6_21images1.controller/${anEntry.value.classNumber}"
									alt="" style="width: 20%; float: left;">
									${anEntry.value.description}</td>

								<td class="align-middle oneprice">${anEntry.value.unitPrice}</td>

								<td class="align-middle">
									<div class="input-group quantity mx-auto update"
										style="width: 100px;">

										<input type="number" min="1" max="5"
											style="background-color: white"
											class="form-control text-center addtext newQty"
											value="${anEntry.value.quantity}" name="newQty"
											id="${anEntry.value.classNumber}">
									</div>
								</td>

								<td class="align-middle newprice">${anEntry.value.unitPrice*anEntry.value.quantity}</td>

								<td class="align-middle">
									<button class="btn btn-sm btn-primary deleteClass"
										id="${anEntry.value.classNumber}">
										<i class="fa fa-times"></i>
									</button>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<!-- 				<form class="mb-5" action=""> -->
				<!-- 					<div class="input-group"> -->
				<!-- 						<input type="text" class="form-control p-4" -->
				<!-- 							placeholder="Coupon Code"> -->
				<!-- 						<div class="input-group-append"> -->
				<!-- 							<button class="btn btn-primary">Apply Coupon</button> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</form> -->
				<div class="card border-secondary mb-5"
					style="background-color: transparent">
					<div class="card-header" style="background-color: #002347">
						<h4 class="font-weight-semi-bold m-0" style="color: #fdc632">購物車總覽</h4>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium">Subtotal</h6>
							<h6 class="font-weight-medium allprice">${ShoppingCart.getSubtotal()}</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">購買課程數量:</h6>
							<h6 class="font-weight-medium allquantity">${ShoppingCart.getItemNumber()}</h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">總計:</h5>
							<h5 class="font-weight-bold allprice1">${ShoppingCart.getSubtotal()}</h5>
						</div>
						<button class="btn btn-block btn-primary my-3 py-3 checkout"
							style="background-color: #002347">
							<a href="shoppingCartCheckout.controller" style="color: white">去結帳</a>
						</button>
						<a href="showAllClass.controller">繼續選購</a> <a
							href="abandonshopping.controller" onClick="return Abort();"
							style="float: right; color: #002347">放棄購物?</a>
					</div>
				</div>
			</div>






			<!-- 			這邊開始熱門推薦 -->
			<div class="row gx-1" style="margin: 0px">
				<div style="margin: 5px 100px 30px 50px">
					<div>
						<h3>您可能會喜歡:</h3>
						<div style="display: flex;">
							<c:forEach var="typelist" items="${list}">

								<div class="col-3" style="margin: 10px">
									<div class="box">
										<img src="/t6_21images1.controller/${typelist.classId}"
											height='100' width='180'>
									</div>
									<div style="margin-top: 10px">
										<h5>
											<a href="/showClassDetail.controller/${typelist.classId}">${typelist.className}</a>
										</h5>
										<h5>授課老師:${typelist.classTeacherName}</h5>
										<h5>開課時間:${typelist.classDate}</h5>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- 	熱門推薦結束 -->



		</div>
	</div>



	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		// 	$('.checkout').on('click', function () {

		// 		$.ajax({
		//             url: '/shoppingCartCheckout.controller',
		//             method: "post",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		// //             data: { "classId": MyValue },
		//         })

		// 	  });

		function Abort() {
			if (confirm("確定放棄購物 ? ")) {
				return true;
			} else {
				return false;
			}
		}

		//     $('.abandonshopping').on('click', function () {
		//     	var result = confirm('是否確定刪除?');
		//     	if(result == true){
		// //         let MyValue = $(this).attr("id");
		// //         console.log(MyValue);
		//         $.ajax({
		//             url: '/abandonshopping.controller',
		//             method: "get",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		// //             data: { "classId": MyValue },
		//         }).done(function () {
		//             location.reload();
		//         })}else{
		//         	return;
		//         }
		//     });

		$('.deleteClass').on('click', function() {
			var result = confirm('是否確定刪除?');
			if (result == true) {
				let MyValue = $(this).attr("id");
				console.log(MyValue);
				$.ajax({
					url : '/deleteshoppingitem.controller/' + MyValue,
					method : "get",
					dataType : "text",
					//這邊的"id"是給controller的變數名
					data : {
						"classId" : MyValue
					},
				}).done(function() {
					location.reload();
				})
			} else {
				return;
			}
		});

		$(".addtext")
				.change(
						function() {
							let MyValue = $(this).attr("id");
							var inputValue = $(this).val();
							console.log(MyValue);
							console.log(inputValue);
							$
									.ajax(
											{
												url : '/updateshoppingqty.controller/'
														+ MyValue,
												method : "post",
												dataType : "text",
												//這邊的"id"是給controller的變數名
												data : {
													"classId" : MyValue,
													"newQty" : inputValue
												},
												context : this,
											})
									.done(
											function() {
												// 				location.reload();
												//   			修改單項數量x價錢=總數
												console.log($(this));
												let price = $(this).parent()
														.parent().parent()
														.children('.oneprice')
														.text();
												// 				console.log(price);
												let newprice = price
														* inputValue;
												// 				console.log(newprice);
												let allp = $(this).parent()
														.parent().parent()
														.children('.newprice')
														.text(newprice);

												// 												let allprice = $(this).parent()
												// 														.parent().parent()
												// 														.parent().parent()
												// 														.parent().parent()
												// 														.find('h6.allprice')
												// 														.text(newprice);

												let total = 0;
												const newpriceElements = $('.newprice');
												for (let i = 0; i < newpriceElements.length; i++) {
													total += parseFloat(newpriceElements[i].textContent);
												}
												console.log(total);

												let allquantity = $(this)
														.parent().parent()
														.parent().parent()
														.parent().parent()
														.parent().find(
																'h6.allprice')
														.text(total);
												let allprice1 = $(this)
														.parent().parent()
														.parent().parent()
														.parent().parent()
														.parent().find(
																'h5.allprice1')
														.text(total);

												// 獲取所有 .addtext 的數值並累加
												let total1 = 0;
												$(".addtext")
														.each(
																function() {
																	total1 += parseInt($(
																			this)
																			.val());
																});

												let allquan = $(this).parent()
														.parent().parent()
														.parent().parent()
														.parent().parent()
														.find('h6.allquantity')
														.text(total1);

											})

						});
	</script>
</body>
</html>