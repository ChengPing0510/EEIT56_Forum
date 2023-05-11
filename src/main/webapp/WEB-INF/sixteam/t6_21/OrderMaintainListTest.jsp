<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>後臺管理系統</title>
<link href="/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="/background_index/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
<style>
.form-style {
	border: 1px solid #ced4da !important;
	border-radius: 0.25rem !important;
}

.col-md-3 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 25%;
	flex: 0 0 25%;
	max-width: 25%;
}

.card .card-body {
	padding: 15px 15px 10px 15px;
}
</style>
</head>

<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" />
	</div>
	<br />
	<div class="container-fluid text-center"
		style="padding-left: 250px; margin-top: -68px;">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">後臺管理系統</li>
						<li class="breadcrumb-item">課程購物車</li>
						<li class="breadcrumb-item active" aria-current="page">訂單管理</li>
					</ol>
				</nav>
			</div>
		</div>
		<br />
		<div class="row">
		<div class="col-xl-1 col-md-6"></div>
			<div class="col-xl-3 col-md-6">
				<div class="card card-stats card-success">
					<div class="card-body" style="float: right;width:295px;height:159px">
						<div class="row" style="margin-top:30px">
							<div class="col-5">
								<img src='/front_index/img/856.PNG' height='75px' width='80px'>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers" style="font-size:24px">
									<p class="card-category">總訂單量</p>
									<h4 class="card-title totalorder"></h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card card-stats card-success">
					<div class="card-body" style="float: right;width:295px;height:159px">
						<div class="row" style="margin-top:30px">
							<div class="col-5">
								<img src='/front_index/img/545.PNG' height='75px' width='80px'>
							</div>
							<div class="col-7 d-flex align-items-center">
								<div class="numbers" style="font-size:24px">
									<p class="card-category">總營業額</p>
									<h4 class="card-title totalprice" style="text-align: center;"></h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-md-6">
				<div class="card text-white mb-4">
					<div class="card-body" style="float: left">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
		<div class="col-xl-1 col-md-6"></div>
		</div>



		<br />

		<!-- 				<div class="dropdown" style="margin-left:-1050px;margin-button:-20px"> -->
		<!-- 				</div> -->

		<div class="dropdown" style="margin-left: 75%;">
			<button class="btn dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				style="border: 1px solid #002347">請選擇匯出檔案類型</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item"
					href="/classOrderexportCsv.controller">CSV</a></li>
				<li><a class="dropdown-item"
					href="/classOrderexportJson.controller">JSON</a></li>
			</ul>
			<button class="btn dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				style="border: 1px solid #002347">排序</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item"
					href="/showOrderOrderBy.controller/1">依照日期順序</a></li>
				<li><a class="dropdown-item"
					href="/showOrderOrderBy.controller/2">依照金額順序</a></li>
				<li><a class="dropdown-item"
					href="/showOrderOrderBy.controller/3">依照訂單順序</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col">
				<table class="table table-striped" id="table_id">
					<thead>
						<tr>
							<th>訂單編號</th>
							<th>會員編號</th>
							<th>會員帳號</th>
							<th>會員信箱</th>
							<th>會員電話</th>
							<th>下單日期</th>
							<th>訂單總金額</th>
							<th>付款狀態</th>
							<th>請確認</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${orderList}">
							<tr class="count">
								<td><button data-bs-toggle="modal" class="oneordernumber"
										name="orderNumber" data-bs-target="#saveModal"
										id="${bean.orderNumber}">${bean.orderNumber}</button></td>
								<td>${bean.memberId}</td>
								<td>${bean.memberAccount}</td>
								<td>${bean.memberEmail}</td>
								<td>${bean.memberPhone}</td>
								<td class="date">${bean.orderDate}</td>
								<td class="orderPrice" value="${bean.orderPrice}">${bean.orderPrice}</td>
								<c:choose>
									<c:when test="${ bean.paymentStatus == null }">
										<td>未付款</td>
									</c:when>
									<c:otherwise>
										<td>${ bean.paymentStatus}</td>
									</c:otherwise>
								</c:choose>
								<td><button id="${bean.orderNumber}"
										class="btn btn-danger deleteThisAccount">
										<i class="fas fa-trash-alt"></i>
									</button></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>
	<!-- saveModal -->
	<div id="saveModal" class="modal fade" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">訂單明細</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="saveForm" class="needs-validation" novalidate>
						<div class="mb-3 row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<!--                                 查看表單 -->
										<table class="orderdetailtable" id="table_item"
											style="width: 100%">
										</table>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary updateorderitem">確認</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBtn">取消</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 	第二個modal表格 -->
	<div class="modal fade" id="saveModal1" tabindex="-1" role="dialog"
		aria-labelledby="saveModal1Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="saveModal1Label">新增訂單</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="test"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBtn">確認</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/background_index/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/background_index/js/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
	<script
		src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
				$('.oneordernumber').on('click', function () {
					let MyValue = $(this).attr("id");
					console.log(MyValue);

					$.ajax({
						url: '/oneclassorderdetail.controller/' + MyValue,
						method: "get",
						dataType: "json",
						//這邊的"id"是給controller的變數名
						data: {
							"orderNumber": MyValue
						},
						success: function (data) {
							// 		        	alert("成功")
							console.log(data)
							var table = $('#table_item').empty();
							table.append("<thead align='center'><tr><th>流水號</th><th>訂單編號</th><th>課程編號</th><th>課程描述</th><th>課程數量</th><th>課程價格</th><th>課程總價</th><th>請確認</th></tr></thead>");
							data.forEach(data => {
								console.log(data.seqno)
								console.log(data.description)
								var tr = "<tbody><tr align='center'>" + "<td class='seqno'>" + data.seqno + "</td>" + "<td class='ordno'>" + data.orderNumber + "</td>" +
									"<td class='classNumber'>" + data.classNumber + "</td>" + "<td class='description'>" + data.description + "</td>" +
									"<td>" + "<input type='number' min='1' max='5' class='classquantity' value='" + data.quantity + "' >" + "</td>" + "<td class='price'>" + data.classPrice + "</td>" + "<td class='newprice'>" + data.quantity * data.classPrice + 
									"</td>"+"<td><button class='deleteseqno' value='"+ data.seqno +"' >"+
									"<i class='fas fa-trash-alt'></i></button></td>" +
									"</tr></tbody>";
								table.append(tr);
								return false;

							});
						}, error: (function () {
							location.reload();
						})
					});
				})




				//刪除
				$(function () {
					$('.deleteThisAccount').click(function () {
						// 上面那個input標籤的ID屬性
						//                   var classId = ('#classId').val(),
						let MyValue = $(this).attr("id");
						console.log(MyValue);
						Swal.fire({
							title: '確定刪除?',
							text: "刪除後將無法復原。",
							icon: 'warning',
							//icon:  "success", "error", "warning", "info" or "question" 5種圖示
							showCancelButton: true,
							confirmButtonColor: '#007500',
							cancelButtonColor: '#d33',
							cancelButtonText: '取消',
							confirmButtonText: '刪除'
						}).then((result) => {
							if (result.isConfirmed) {
								$.ajax({
									url: 't6_21deleteClassorder.controller/' + MyValue,
									method: "get",
									dataType: "text",
									//這邊的"id"是給controller的變數名
									data: { "orderNumber": MyValue },
								})
									.done(function () {
		                                console.log("delete")
		                                Swal.fire(
												'刪除成功!',
												'',
												'success',
		                                ).then((result)=>{
		                                	location.reload();
		                                	});
									})
									.fail(function (error) {
										console.log(error)
									})
							}
						})
					})
				});


				//新增
				$('.addneworder').on('click', function () {
					$.ajax({
						url: '/addClassNewOrder.controller',
						method: "post",
						dataType: "json",
						//這邊的"id"是給controller的變數名
						data: {
						}, success: function (data) {
							console.log(data)
							var txt = '<select name="selectposition" class="selectposition">';
							data.forEach(data => {
								txt += '<option value=' + data.className + '>' + data.className + '</option>';
							});
							txt += '</select>';
							var test = $('.test').html(txt);
						}, error: (function () {
							location.reload();
						})
					});
				})

				$(document).on('change', '.classquantity', function () {
					let updatedValue = $(this).val();
					// 					console.log(updatedValue); //改變數量的標籤
					let allquan = $(this).closest('tr').find('.price').text();
					// 					console.log(allquan); //5400 單價
					let newprice = updatedValue * allquan;
					$(this).closest('tr').find('.newprice').text(newprice); //總金額的部分

				});

				//更新單筆訂單
				$(function () {
					$('.updateorderitem').click(function () {
						let dataArray = [];

						var orderElements = document.querySelectorAll('.orderdetailtable tbody');
						console.log(orderElements);


						for (var i = 0; i < orderElements.length; i++) {
							var seqno = $(orderElements[i]).find('.seqno').text();
							var orderNumber = $(orderElements[i]).find('.ordno').text();
							var classNumber = $(orderElements[i]).find('.classNumber').text();
							var description = $(orderElements[i]).find('.description').text();
							var classquantity = $(orderElements[i]).children().children().children().val();
							var price = $(orderElements[i]).find('.price').text();
							var newprice = $(orderElements[i]).find('.newprice').text();
							console.log(newprice);

							var data = {
								"seqno": seqno,
								"orderNumber": orderNumber,
								"classNumber": classNumber,
								"description": description,
								"quantity": classquantity,
								"classPrice":price,
								"unitPrice": newprice,
							};
							dataArray.push(data);
						}
						Swal.fire({
							title: '你確定進行修改嗎?',
							text: "",
							icon: 'warning',
							showCancelButton: true,
							cancelButtonColor: '#adb5bd',
							confirmButtonText: '確定',
							cancelButtonText: '取消',
						}).then((result) => {
							if (result.isConfirmed) {


								$.ajax({
									type: "post",
									url: "/updateOrderitem.controller",
									contentType: "application/json",
									data: JSON.stringify(dataArray),
									success: function (response) {
										console.log("Success!");
		                                Swal.fire(
												'修改成功!',
												'',
												'success',
		                                ).then((result)=>{
		                                	location.reload();
		                                	});
									},
									error: function (error) {
										console.log("Error!");
									}
								});
							}
						})
					});
					});
				
				
				//訂單細項刪除
				$(document).on("click", ".deleteseqno", function() {
					// 取得seqno的值
					var seqno = $(this).val();
					console.log(seqno);
						event.preventDefault();
						Swal.fire({
							title: '你確定刪除嗎?',
							text: "",
							icon: 'warning',
							showCancelButton: true,
							cancelButtonColor: '#adb5bd',
							confirmButtonText: '確定',
							cancelButtonText: '取消',
						}).then((result) => {
							if (result.isConfirmed) {
								$.ajax({
									url: "/t6_21deleteOrderItemDetail.controller/"+seqno,
									type: "post",
			                        dataType:"text",
			                         data: {"seqno":seqno},

									success: function (response) {
										console.log("Success!");
										Swal.fire(
											'刪除成功!',
											'',
											'success',
										).then((result)=>{
		                                	location.reload();
	                                	});
									},
									error: function (error) {
										console.log("Error!");
									}
								});
							}
						})						
					});
				
				//營業額
				var dataArr = 0;
				$('.orderPrice').each(function() {
				    var orderPrice = parseInt($(this).closest('td').text());
				    dataArr += orderPrice;
				});
				
				
				
				$('h4.totalprice').text(dataArr);
				
				

				console.log(dataArr);
				var ctx = document.getElementById('myChart');
				var myChart = new Chart(ctx, {
				  type: 'bar',
				  data: {
				    labels: ['Feb','Mar','Apr','May'],
				    datasets: [{
				      backgroundColor: [
                          'rgba(108, 108, 108, 0.2)',
                          'rgba(108, 108, 108, 0.2)',
                          'rgba(108, 108, 108, 0.2)',
                          'rgba(108, 108, 108, 0.2)',
				      ],
				      borderColor: [
                          'rgba(108, 108, 108, 0.4)',
                          'rgba(108, 108, 108, 0.4)',
                          'rgba(108, 108, 108, 0.4)',
                          'rgba(108, 108, 108, 0.4)',
				      ],
				      borderWidth: 1,
				      label: '銷售業績',
				      data: [dataArr,0,0,0]
				    }]
				  }
				});

				var loopCount = $('.count').length;
				console.log(loopCount);
				$('h4.totalorder').text(loopCount);
			</script>
</body>

</html>