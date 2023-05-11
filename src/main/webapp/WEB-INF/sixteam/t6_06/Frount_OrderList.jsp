<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>神明便利店-房間訂單</title>
<link rel="icon" type="image/png" href="front_index/img/logo.png" />
<link rel="stylesheet" href="../front_index/css/bootstrap.css" />
<link rel="stylesheet" href="../front_index/css/flaticon.css" />
<link rel="stylesheet" href="../front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="../front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="../front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="../front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">


</head>
<body>

	<div style="position: relative"><jsp:include
			page="/front_index/index-FrontToTopMVC.jsp" /></div>

	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table class="table table-bordered text-center mb-0">
					<thead class="bg-secondary" style="color: #fdc632">
						<tr>
							<th style="background-color: #002347">訂單編號</th>
							<th style="background-color: #002347">寺廟名稱</th>
							<th style="background-color: #002347">房型</th>
							<th style="background-color: #002347">入住日期</th>
							<th style="background-color: #002347">退房日期</th>
							<th style="background-color: #002347">總價</th>
						</tr>
					</thead>
					<tbody class="align-middle">


						<c:forEach var="trob" items="${trob}">
							<tr>
								<td class="align-middle orderId" id="orderId" >${trob.orderId}</td>

								<td class="align-middle oneprice">${trob.templeName}</td>

								<td class="align-middle roomId" id="roomId">${trob.roomId}</td>
								<td class="align-middle">${trob.checkindate}</td>
								<td class="align-middle">${trob.checkoutdate}</td>
								<td class="align-middle cost" id="amount">${trob.cost}</td>

								

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
			<c:forEach var="trob" items="${trob}">
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
						<h4 class="font-weight-semi-bold m-0" style="color: #fdc632">確認訂單</h4>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between mb-3 pt-1">
							<h6 class="font-weight-medium"></h6>
							<h6 class="font-weight-medium allprice">${ShoppingCart.getSubtotal()}</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">過夜天數:</h6>
							<h6 class="font-weight-medium allquantity">${trob.numberofnights}</h6>
						</div>
					</div>
					<div class="card-footer border-secondary bg-transparent">
						<div class="d-flex justify-content-between mt-2">
							<h5 class="font-weight-bold">總計:</h5>
							<h5 class="font-weight-bold allprice">${trob.cost}</h5>
						</div>
						<button class="btn btn-block btn-primary my-3 py-3 checkout submitButton"
							style="background-color: #002347" id="submitButton">去結帳
<!-- 							<a href="frount_orderroom77777" style="color: white">去結帳</a> -->
						</button>
						
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 			這邊開始熱門推薦 -->
	<!-- 								<div> -->
	<!-- 						<div> -->
	<!-- 							<div> -->
	<!-- 							<h3 style="margin: 30px 25px">您可能會喜歡:</h3> -->
	<%-- <c:forEach var="typelist" items="${list}"> --%>
	<!-- 								<div style="margin:30px 25px"> -->
	<%-- <img src="t6_21images1.controller/${typelist.classId}" height='300' width='300'> --%>
	<!-- 								</div> -->

	<!-- 								<div style="margin: 30px 25px"> -->
	<!-- 									<h3 > -->
	<%-- <a href="/showClassDetail.controller/${typelist.classId}">${typelist.className}</a> --%>
	<!-- 									</h3> -->
	<%-- <p>授課老師:${typelist.classTeacherName}</p> --%>
	<%-- <p>開課時間:${typelist.classDate}</p> --%>
	<!-- 								</div> -->

	<%-- </c:forEach> --%>
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->



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

		$(".addtext").change(
				function() {
					let MyValue = $(this).attr("id");
					var inputValue = $(this).val();
					console.log(MyValue);
					console.log(inputValue);
					$.ajax({
						url : '/updateshoppingqty.controller/' + MyValue,
						method : "post",
						dataType : "text",
						//這邊的"id"是給controller的變數名
						data : {
							"classId" : MyValue,
							"newQty" : inputValue
						},
						context : this,
					}).done(
							function() {
								// 				location.reload();
								//   			修改單項數量x價錢=總數
								console.log($(this));
								let price = $(this).parent().parent().parent()
										.children('.oneprice').text();
								// 				console.log(price);
								let newprice = price * inputValue;
								// 				console.log(newprice);
								let allp = $(this).parent().parent().parent()
										.children('.newprice').text(newprice);

								let allprice = $(this).parent().parent()
										.parent().parent().parent().parent()
										.parent().find('h6.allprice');
								console.log(allprice.length);
								// 				allprice.each(function(idx){
								// 					console.log(idx+" "+$(this).text());
								// 				});
								// 				allp.each(function(){
								// 					console.log($(this).text());
								// 				});

								// 				console.log(allprice);
							})

				});
		
		
// 		----------------------------------------------------------------------------------------------

$("#submitButton").click(function(){
    // 讀取表格欄位內的資料
    var productName =$("#roomId").text();
    var amount = $("#amount").text();
    var currency ="TWD";
    var confirmUrl ="http://localhost:8081/welcomeToIndex";
    var orderId =$("#orderId").text();
    console.log(amount+"1111111111111111111")
    
    // 將資料轉換成JSON格式
    var jsonData = {
        "productName":productName,
        "amount":amount,
        "currency":currency,
        "confirmUrl":confirmUrl,
        "orderId":orderId
    };
    console.log(jsonData);
    // 使用jQuery的ajax()方法將JSON數據發送到後端
    $.ajax({
        type: "GET",
        url: "/frount_orderroomByLinePay",
        data:{ "JsonOrderList":JSON.stringify(jsonData)},
        contentType: "application/json",
        dataType:"text",
        success: function(data) {
        	window.location.href = data;
        },
        error: function(error) {
            // 處理錯誤
        }
    });
});
	</script>
</body>
</html>