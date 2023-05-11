<%@page import="sixteam.t6_21.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<link rel="stylesheet" href="../front_index/css/flaticon.css" />
<link rel="stylesheet" href="../front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="../front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="../front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="../front_index/css/style.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="../front_index/css/bootstrap.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
	<style type="text/css">
.act img{
height:210px;
width:320px
}


	</style>
</head>
<body>

	<div style="position: relative"><jsp:include
			page="/front_index/index-FrontToTopMVC.jsp" /></div>

	<!--================ Start Course Details Area =================-->
	<div class="popular_courses" style="margin: 50px">
		<div class="container" style="max-width:1140px">





			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">為您準備幾堂不錯的課程</h2>
						<p>集結各領域老師開班授課!</p>
					</div>
				</div>
			</div>

			<!-- 		下拉式選單 -->
			<div class="row" style="margin:20px">
				<div class="col-md-6">
					<div class="dropdown"
						style="margin-left: -20px; margin-button: 20px">
						<button class="btn dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							style="border: 1px solid #002347">請選擇課程主題</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="/showAllClass.controller">瀏覽全部</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/西方宗教">西方宗教</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/東方占卜">東方占卜</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/星座運勢">星座運勢</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/道教">道教</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/佛教">佛教</a></li>
							<li><a class="dropdown-item"
								href="/showTypeClass.controller/本土宗教">本土宗教</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6">
					<div class="dropdown">

						<div class="dropdown" style="margin-left: 450px">
							<button class="btn dropdown-toggle" type="button"
								id="dropdownMenuButton1" data-bs-toggle="dropdown"
								style="border: 1px solid #002347">排序</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item"
									href="/showClassOrderBy.controller/1">依照熱門程度</a></li>
								<li><a class="dropdown-item"
									href="/showClassOrderBy.controller/2">依照日期順序</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 下拉式選單結束 -->

			<!-- 			頁面橫向選擇 -->

			<!-- 			<nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
			<!-- 				<a class="navbar-brand" href="#">類別分類</a> -->
			<!-- 				<button class="navbar-toggler" type="button" data-toggle="collapse" -->
			<!-- 					data-target="#navbarNav" aria-controls="navbarNav" -->
			<!-- 					aria-expanded="false" aria-label="Toggle navigation"> -->
			<!-- 					<span class="navbar-toggler-icon"></span> -->
			<!-- 				</button> -->
			<!-- 				<div class="collapse navbar-collapse" id="navbarNav"> -->
			<!-- 					<ul class="navbar-nav"> -->
			<!-- 						<li class="nav-item" style="margin-left:50px"><a class="nav-link" href="http://localhost:8081/welcomeToIndex">Features</a> -->
			<!-- 						</li> -->
			<!-- 						<li class="nav-item"><a class="nav-link" href="#">Pricing</a> -->
			<!-- 						</li> -->
			<!-- 						<li class="nav-item"><a class="nav-link" href="#">Disabled</a> -->
			<!-- 						</li> -->
			<!-- 					</ul> -->
			<!-- 				</div> -->
			<!-- 			</nav> -->
			<!-- 頁面橫向選擇結束 -->

			<div class="row">
				<c:forEach var="bean" items="${classList}">
					<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border-0 mb-4 col-lg-12">
							<div class="single_course">
								<div class="course_head act" >
									<img class="img-fluid"
										src="/t6_21images1.controller/${bean.classId}" height="210px" width="320px">
								</div>
								<div class="course_content">

									<!-- 									<span class="tag mb-4 d-inline-block" style="">${bean.classPrice}</span>  -->
									<span class="tag mb-4 d-inline-block">${bean.classType}</span>
									<span>已報名人數:${bean.classApplicant}</span>
									<h4 class="mb-3">
										<a href="/showClassDetail.controller/${bean.classId}">${bean.className}</a>
									</h4>
									<p>授課老師:${bean.classTeacherName}</p>
									<p>開課時間:${bean.classDate}</p>
									<div
										class="card-footer d-flex justify-content-between bg-light border"
										style="margin-top: 20px">
										<a href="/showClassDetail.controller/${bean.classId}"
											class="btn btn-sm text-dark p-0"><i
											class="fas fa-eye text-primary mr-1"></i>課程細節</a>
										<button style="float: right" id="${bean.classId}"
											class="btn btn-sm text-dark p-0 addtocart">
											<i class="fas fa-shopping-cart text-primary mr-1"></i> 加入購物車
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 熱門推薦開始 -->







			<!-- 熱門推薦結束 -->
		</div>
	</div>
	<!--================ End Course Details Area =================-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
		$('.addtocart').on('click', function() {
			let MyValue = $(this).attr("id");
			console.log(MyValue);
			$.ajax({
				url : '/onlyaddoneclassToCart.controller/' + MyValue,
				method : "get",
				dataType : "text",
				//這邊的"id"是給controller的變數名
				data : {
					"classId" : MyValue
				},
			}).done(function() {
				//         	alert("成功")
				location.reload();
			}).fail(function() {
				//         	alert("失敗")
				location.reload();
			})
		});

		// 		function selectTopic(topic) {
		// 			$.ajax({
		// 				url : '/showTypeClass.controller',
		// 				type : 'get',
		// 				dataType : "text",
		// 				data : {
		// 					"type" : topic
		// 				},
		// 			}).done(function() {
		// 				console.log(topic);
		// 				alert("成功")
		// 				location.reload();

		// 			});
		// 		}
	</script>
</body>
</html>