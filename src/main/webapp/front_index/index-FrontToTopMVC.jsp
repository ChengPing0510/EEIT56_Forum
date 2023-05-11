<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/flaticon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/style.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<!--================ Start Header Menu Area =================-->
<!--================ Start Header Menu Area =================-->
<header class="header_area white-header">
	<div class="main_menu">

		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="/welcomeToIndex"><img
					src="/front_index/img/logo.png" alt="" /></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item active"><c:choose>
								<c:when test="${! empty LoginOK }">
									<a class="nav-link" href="/logout"
										style="font-size: 18px; font-weight: bold"> 登出 </a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" href="/login"
										style="font-size: 18px; font-weight: bold"> 登入 </a>
								</c:otherwise>
							</c:choose></li>
						<c:choose>
							<c:when test="${ LoginOK.roles eq 'ROLE_USER,ROLE_ADMIN' }">
								<li class="nav-item active"><a class="nav-link"
									href="/toBackIndex" style="font-size: 18px; font-weight: bold">
										後台系統 </a></li>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"
							style="color: #fdc632; font-size: 18px; font-weight: bold">購物商城</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="/showAllClass.controller">改運課程</a></li>
								<li class="nav-item"><a class="nav-link"
									href="courses.html">運勢小物</a></li>
								<!--                     <li class="nav-item"> -->
								<!--                       <a class="nav-link" href="elements.html">Elements</a> -->
								<!--                     </li> -->
							</ul></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"
							style="color: #fdc632; font-size: 18px; font-weight: bold">功能導覽</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="blog.html"></a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="/actives/actview">近期活動</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/t6_27showFrontforumPage.controller">信徒論壇</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/t6_23/go.controller">姻緣配對</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/frount_findtemple.controller">住宿訂房</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/drawstraws.controller">抽籤</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="color: #fdc632; font-size: 18px; font-weight: bold">聯絡我們</a></li>




						<!--         <div class="rounded-circle border border-secondary" style="width: 50px; height: 50px; margin:10px;"> -->
						<!--        <a href="/profile">  -->
						<!--     <img src="/t6_10_showNowImg.controller" class="w-100 h-100" alt="找不到用戶圖"> -->
						<!--      </a> -->
						<!--   </div> -->
						<!--        <a href="" class="btn border"> <i -->
						<!--         class="fas fa-heart text-primary" style="color: #fdc632"></i> <span -->
						<!--         class="badge">${shoppingCart.getItemNumber()}</span> -->
						<!--        </a>  -->
						<li class="nav-item" style="margin-top: 16px"><a
							href="showshoppingcart.controller" class="btn border"> <i
								class="fas fa-shopping-cart" style="color: #fdc632"></i> <c:choose>
									<c:when test="${ ! empty ShoppingCart }">
										<span class="badge" style="color: #fdc632">${ShoppingCart.getItemNumber()}</span>
									</c:when>
									<c:otherwise>
										<span class="badge" style="color: #fdc632">0</span>
									</c:otherwise>
								</c:choose>
						</a></li>

						<c:choose>
							<c:when test="${not empty LoginOK }">
								<li class="nav-item submenu dropdown"
									style="margin-top: -2px; margin-right: -50px"><a href="#"
									class="nav-link dropdown-toggle" data-toggle="dropdown"
									role="button" aria-haspopup="true" aria-expanded="false"
									style="color: #fdc632; font-size: 18px; font-weight: bold"><img
										src="/t6_10_showNowImg.controller" class="rounded-circle"
										alt="找不到用戶圖" width="40px" height="40px"
										style="margin-left: 30px; margin-top: 18px"></a>
									<ul class="dropdown-menu"
										style="border-radius:; background-color:">
										<li class="nav-item"><a class="nav-link" href="blog.html"></a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="/loginToProfile">基本資料</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/t6_21OrderMember.controller">課程訂單紀錄</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/EventRegist">已報名活動</a></li>
										<li class="nav-item"><a class="nav-link" href="/favorite">我的最愛活動</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/Frount_ShowOrderById.controller">訂房紀錄</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/t6_27showFrontforumPage.controller">發文紀錄</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/t6_23/go.controller">配對紀錄</a></li>
										<li class="nav-item"><a class="nav-link"
											href="single-blog.html">物品訂單紀錄</a></li>
									</ul></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item submenu dropdown"
									style="margin-top: 15px; margin-right: -50px"><a
									id="UserPic" href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"
									style="color: #fdc632; font-size: 18px; font-weight: bold"><img
										src="/t6_10_showNowImg.controller" class="rounded-circle"
										alt="找不到用戶圖" width="40px" height="40px"
										style="margin-left: 30px"></a></li>
							</c:otherwise>
						</c:choose>




					</ul>



					<div class="col-lg-3 col-6 text-right"></div>

				</div>
			</div>
		</nav>
	</div>
</header>
<!--================ End Header Menu Area =================-->
<!--================ Start Home Banner Area =================-->
<section class="banner_area">
	<div class="banner_inner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner_content text-center">
						<p class="text-uppercase">
							<!--                   世界越快，心靈越慢 -->
						</p>
						<h2 class="text-uppercase mt-4 mb-5">
							<!--                   專為台灣信徒打造的網站 -->
						</h2>
						<!--                 <div> -->
						<!--                   <a href="#" class="primary-btn2 mb-3 mb-sm-0">點此進入</a> -->
						<!--                   <a href="#" class="primary-btn ml-sm-3 ml-0">點此進入</a> -->
						<!--                 </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================ End Home Banner Area =================-->

<!--================ End Home Banner Area =================-->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="${pageContext.request.contextPath}/front_index/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/js/popper.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/vendors/owl-carousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/js/owl-carousel-thumb.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/js/jquery.ajaxchimp.min.js"></script>
<script
	src="${pageContext.request.contextPath}/front_index/js/mail-script.js"></script>
<!--gmaps Js-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
<script src="front_index/js/gmaps.min.js"></script>
<script src="front_index/js/theme.js"></script>
<script type="text/javascript">
	$('#UserPic').on('click', function() {
		window.location.href = '/login'
	});
</script>