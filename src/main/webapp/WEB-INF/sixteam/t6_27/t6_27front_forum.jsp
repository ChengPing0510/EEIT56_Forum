<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="front_index/css/bootstrap.css" />
<link rel="stylesheet" href="front_index/css/flaticon.css" />
<link rel="stylesheet" href="front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="front_index/css/style.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- t6_27 Core theme CSS (includes Bootstrap)-->
<link href="front_index/css/t6_27/t6_27styles.css" rel="stylesheet" />

<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.chan img {
	height: 208px;
}

.img-fluid img {
	width: 486px;
	height: 277px
}

.portfolio-box-caption {
	
}
</style>
</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
	<!--================ End Home Banner Area =================-->


	<section class="feature_area section_gap_top">
		<div class="main_title">
			<h2 class="mb-3">神明論壇看板</h2>
		</div>

		<!-- 		個人文章頁面 -->
		<div id="checklogin_area">
			<form action="/t6_27showFrontUserPostListPage.controller/1"
				method="POST">
				<input type="submit" id="loginCheck" value="查看個人文章" name="usersid"
					class="forumpost_btn"> <input type="hidden" name="id"
					id="id" value="${LoginOK.id}">
			</form>
		</div>

		<div id="portfolio">
			<div class="container-fluid p-0">
				<div class="row">
					<div class="col-lg-4 col-sm-6 chan">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=星座運勢" title="星座運勢"> <img
							class="img-fluid" src="/front_index/img/t6_27images/starsign.jpg"
							alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">星座運勢</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=紫微斗數" title="紫微斗數"> <img
							class="img-fluid" src="front_index/img/t6_27images/purple.jpg"
							alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">紫微斗數</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=塔羅愛情" title="塔羅愛情"> <img
							class="img-fluid" src="front_index/img/t6_27images/cards.jpg"
							alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">塔羅愛情</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=十二生肖" title="十二生肖"> <img
							class="img-fluid" src="front_index/img/t6_27images/zodiac.jpg"
							alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">十二生肖</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=九星命卦" title="九星命卦"> <img
							class="img-fluid" src="front_index/img/t6_27images/eight.jpg"
							alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">九星命卦</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6">
						<a class="portfolio-box"
							href="/t6_27showboard.controller?board=心理測驗" title="心理測驗"> <img
							class="img-fluid"
							src="front_index/img/t6_27images/psychological.jpg" alt="..."
							style="height: 350px !important; width: 100% !important" />
							<div class="portfolio-box-caption p-3">
								<div class="project-category text-white-50">看板</div>
								<div class="project-name">心理測驗</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--================ Start footer Area  =================-->
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />

	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="front_index/js/jquery-3.2.1.min.js"></script>
	<script src="front_index/js/popper.js"></script>
	<script src="front_index/js/bootstrap.min.js"></script>

	<script
		src="front_index/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="front_index/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="front_index/js/owl-carousel-thumb.min.js"></script>
	<script src="front_index/js/jquery.ajaxchimp.min.js"></script>
	<script src="front_index/js/mail-script.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="front_index/js/gmaps.min.js"></script>
	<script src="front_index/js/theme.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="/front_index/js/t6_27scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

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

		<!--檢查是否登入會員-->
		var check = '${LoginOK}'
		if (check != '') {

			console.log($('#id').val());

		} else {
			$('#loginCheck').hide();
			$('#checklogin_area')
					.append(
							'<a href="/login" style="font-size: 18px; font-weight: bold">請施主先登入會員後，再檢視個人介面</a>');

		}

		$(".userPost-btn").click(function() {
			var id = $(this).data("id");
			$.ajax({
				url : "../t6_27showFrontUserPostListPage.controller",
				type : "POST",
				data : {
					id : id
				},
				success : function(response) {
					// 取得後端的回應
				}
			});
		});
	</script>

</body>

</html>