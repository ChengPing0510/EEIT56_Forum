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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
.mc_latest_title {
	background: #aaa;
	color: #fff;
	font-size: 1em;
	margin: 45px 0 0;
}

.pageTitle {
	margin: 30px 0 30px 0;
	text-align: center;
}

.memberWrap {
	padding: 50 200px;
}

.dtwrap {
	max-width: 1280px;
	margin: 0 auto;
}

.mo_latestWrap .mc_order {
	padding: 10px 0;
}

.mo_latestWrap .mc_order>div:last-child span {
	display: inline-block;
	padding: 0 5px;
	width: 30%;
}

.mo_latestWrap .mc_order>div:first-child {
	position: absolute;
	width: 100%;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-pack: justify;
	justify-content: space-between;
	top: 6px;
}

.content span {
	margin-right: 100px;
}

.content a {
	margin-right: 100px;
}

.content {
	margin: 30px;
}

ul {
	margin-right: 30px;
}

a:link {
	color: blue;
}
</style>
</head>
<body>
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />


	<div class="dtwrap is-clearfix">

		<div class="rightPanel memberWrap">
			<h2 class="is-size-3 has-text-centered pageTitle">
				MY ORDER
				<p>訂單查詢</p>
			</h2>
			<p class="greet">親愛的貴賓您好</p>
			<p class="greet">如果對於訂單有疑惑，歡迎寄信至:teemin20230202@gmail.com</p>
			<p class="greet">*僅保留90天的訂單資料提供查詢</p>
			<div class="mo_latestWrap">
				<div class="mc_latest_title has-text-centered is-hidden-touch">LATEST
					訂單紀錄</div>
				<ul style="margin-left:100px">
					<c:forEach var="bean" items="${orderList}">

						<li class="">
							<div class="content">
								<a data-bs-toggle="modal" class="oneordernumber"
									name="orderNumber" data-bs-target="#saveModal"
									id="${bean.orderNumber}" style="color: blue">ORD${bean.orderNumber}</a>
								<span class="date">${bean.orderDate}</span> <span>${bean.paymentStatus}</span>
								<span>${bean.orderPrice}</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<a href="/showAllClass.controller" class="btn is-hidden-desktop"
				style="margin-left: 400px; color: blue">回到課程列表</a>
		</div>
	</div>

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


	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
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
	
	$('.date').each(function() { // 選取所有class為"date"的元素並逐一處理
		  const dateValue = $(this).text(); // 獲取元素的文字內容
		  console.log(dateValue); // 輸出日期字串
			var date2 = dateValue.toString();
		  
			var date = new Date(date2);
			var year = date.getFullYear();
			var month = ("0" + (date.getMonth() + 1)).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			var formattedDate = year + "-" + month + "-" + day;
			console.log(formattedDate);
			const dateValue2 = $(this).text(formattedDate); 
		});

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
							table.append("<thead align='left'><tr><th>課程描述</th><th>課程數量</th><th>課程價格</th><th>課程總價</th></tr></thead>");
							data.forEach(data => {
								console.log(data.seqno)
								console.log(data.description)
								var tr = "<tbody><tr align='left'>" + "</td>" + "<td class='description'>" + data.description + "</td>" +
									"<td>" +  + data.quantity + "</td>" + "<td class='price'>" + data.classPrice + "</td>" + "<td class='newprice'>" + data.quantity * data.classPrice + 
									"</td>"+
									"</tr></tbody>";
								table.append(tr);
								return false;

							});
						}, error: (function () {
							location.reload();
						})
					});
				})

	
	</script>

</body>
</html>