<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<!-- Required meta tags -->
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
<style type="text/css">
.picture {
	background-image: url("front_index/img/god1.jpg");
	background-size: cover;
	background-position: center;
	color: transparent;
	width: 350px;
	height: 180px;
}

.picture1 {
	background-image: url("front_index/img/pic3.jpg");
	background-size: cover;
	background-position: center;
	color: transparent;
	width: 350px;
	height: 180px;
}

.picture2 {
	background-image: url("front_index/img/pic4.jpg");
	background-size: cover;
	background-position: center;
	color: transparent;
	width: 350px;
	height: 180px;
}

.image-container {
	opacity: 0.8;
}

.titlename {
	margin-left: 90px;
	margin-top: 20px;
}
</style>

</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="box_fixed">
			<span style="color: black"></span>
		</div>
		<div class="main_menu">
			<div class="search_input" id="search_input_box">
				<div class="container">
					<form class="d-flex justify-content-between" method="" action="">
						<input type="text" class="form-control" id="search_input"
							placeholder="Search Here" />
						<button type="submit" class="btn"></button>
						<span class="ti-close" id="close_search" title="Close Search"></span>
					</form>
				</div>
			</div>

			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="/welcomeToIndex"><img
						src="front_index/img/logo.png" alt="" /></a>
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
									<c:when test="${not empty LoginOK }">
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
										href="/showAllClass.controller">運勢小物</a></li>
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




							<!-- 						  <div class="rounded-circle border border-secondary" style="width: 50px; height: 50px; margin:10px;"> -->
							<!--        <a href="/profile">  -->
							<!--     <img src="/t6_10_showNowImg.controller" class="w-100 h-100" alt="找不到用戶圖"> -->
							<!--     	</a> -->
							<!--   </div> -->
							<!-- 							<a href="" class="btn border"> <i -->
							<!-- 								class="fas fa-heart text-primary" style="color: #fdc632"></i> <span -->
							<!-- 								class="badge">${shoppingCart.getItemNumber()}</span> -->
							<!-- 							</a>  -->
							<li class="nav-item" style="margin-top: 20px"><a
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
											<li class="nav-item"><a class="nav-link"
												href="blog.html"></a></li>
											<li class="nav-item"><a class="nav-link"
												href="/loginToProfile">基本資料</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/t6_21OrderMember.controller">課程訂單紀錄</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/EventRegist">已報名活動</a></li>
											<li class="nav-item"><a class="nav-link"
												href="/favorite">我的最愛活動</a></li>
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
		<!-- Alternate來回 slide進一次停 scroll重複 -->
		<!-- 		<marquee behavior="scroll" onMouseOver="this.stop()" -->
		<!-- 			onMouseOut="this.start()" height="100" direction="right" -->
		<!-- 			scrolldelay="4" scrollamount="12"> -->

		<!-- 			<img src='front_index/img/announce.gif' width='50px' height='50px'> -->
		<!-- 			<span style='color: white; font-size: 24px'>快訊:巴拉巴拉</span> -->

		<!-- 		</marquee> -->


		<!-- 		<marquee direction="down" width="400" height="350" -->
		<!-- 			behavior="alternate" -->
		<!-- 			style="position: fixed; right: 1%; bottom: 20%; border: solid;" -->
		<!-- 			scrollamount="12"> -->
		<!-- 			<marquee behavior="alternate" scrollamount="12"> -->
		<!-- 				<marquee direction="down" width="250" height="200" -->
		<!-- 					behavior="alternate" style="border: solid"> -->
		<!-- 					<marquee behavior="alternate"> -->
		<!-- 						<marquee direction="down" width="150" height="100" -->
		<!-- 							behavior="alternate" style="border: solid" scrollamount="12"> -->
		<!-- 							<marquee behavior="alternate" scrollamount="12"> -->
		<!-- 								<img src='front_index/img/spell.gif' width='150px' -->
		<!-- 									height='150px'> -->
		<!-- 							</marquee> -->
		<!-- 						</marquee> -->
		<!-- 					</marquee> -->
		<!-- 				</marquee> -->
		<!-- 			</marquee> -->
		<!-- 		</marquee> -->


	</header>
	<!--================ End Header Menu Area =================-->
	<!--================ Start Home Banner Area =================-->
	<section class="home_banner_area">
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

	<!--================ Start Feature Area =================-->
	<section class="feature_area section_gap_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">可以為您提供什麼服務?</h2>
						<p>為台灣廣大信徒建立值得信賴溝通的功能網</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single_feature picture image-container"></div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="single_feature picture1 image-container"></div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="single_feature picture2 image-container"></div>
				</div>
			</div>
		</div>
	</section>

	<!--================ End Feature Area =================-->

	<!--================ 課程一覽 =================-->

	<div class="popular_courses">
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">為您準備幾堂不錯的課程</h2>
						<p>集結各領域老師開班授課!</p>
					</div>
				</div>
			</div>


			<!-- single course -->
			<div class="col-lg-12">
				<div class="owl-carousel active_course">
					<c:forEach var="bean" items="${classList}">
						<div class="col-lg-12">
							<div class="single_course">
								<div class="course_head picture4">
									<img class="img-fluid"
										src="t6_21images1.controller/${bean.classId}" alt="" />
								</div>
								<div class="course_content" style="">

									<span class="price">${bean.classPrice}</span> <span
										class="tag mb-4 d-inline-block">${bean.classType}</span> <span>已報名人數:${bean.classApplicant}</span>

									<h4 class="mb-3">
										<a href="showClassDetail.controller/${bean.classId}">${bean.className}</a>
									</h4>
									<p>授課老師:${bean.classTeacherName}</p>
									<p>開課時間:${bean.classDate}</p>
									<a href="showClassDetail.controller/${bean.classId}">課程細節</a>


									<button style="float: right" id="${bean.classId}"
										class="btn btn-sm text-dark p-0 addtocart">
										<i class="fas fa-shopping-cart text-primary mr-1"></i> 加入購物車
									</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<!--================ End Popular Courses Area =================-->

	<!--================ Start Registration Area =================-->
	<div class="section_gap registration_area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7">
					<div class="row clock_sec clockdiv" id="clockdiv">
						<div class="col-lg-12">
							<h1 class="mb-3">快來註冊加入我們</h1>
							<p>加入神明便利店享受各式服務，宗教課程、聚會活動、宗教論壇一應俱全，只等待你加入!</p>
						</div>
						<div class="col clockinner1 clockinner">
							<h3 class="smalltext text-white">總會員數</h3>
							<h1 class="smalltext">56</h1>
						</div>
						<div class="col clockinner clockinner1">
							<h3 class="smalltext text-white">總課程數</h3>
							<h1 class="smalltext">8</h1>
						</div>
						<div class="col clockinner clockinner1">
							<h3 class="smalltext text-white">總活動數</h3>
							<h1 class="smalltext">14</h1>
						</div>
						<div class="col clockinner clockinner1">
							<h3 class="smalltext text-white">總文章數</h3>
							<h1 class="smalltext">20</h1>
						</div>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-1">
					<div class="register_form">
						<h3>
							<a class="navbar-brand logo_h" href="/welcomeToIndex"><img
								src="/front_index/img/logo.png" alt="" /></a>
						</h3>
						<p>免費加入!歡迎註冊!</p>
						<form class="form_area" id="myForm" action="mail.html"
							method="post">
							<div class="row">
								<div class="col-lg-12 form_group">
									<input name="name" placeholder="輸入帳戶" type="text" /> <input
										name="name" placeholder="輸入電話號碼" type="tel" /> <input
										name="email" placeholder="輸入電子信箱"
										pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
										type="email" />
								</div>
								<div class="col-lg-12 text-center">
									<button class="primary-btn">
										<a href="/register.controller" class="text-white">立即免費註冊</a>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================ End Registration Area =================-->

	<!--================ Start Trainers Area =================-->
	<section class="trainer_area section_gap_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">全台活動情報一覽</h2>
						<p>想找到志同道合的朋友一起參加活動嗎?</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center d-flex align-items-center">
				<c:forEach var="act" items="${actives}">
					<div class="col-lg-3 col-md-6 col-sm-12 single-trainer ">
						<div class="thumb d-flex justify-content-sm-center act"
							style="max-width: 263px; max-height: 223px;">
							<img class="img-fluid" src="actives/toImg/${act.activeID}" alt=""
								style="max-width: 263px; max-height: 223px;" />
						</div>
						<div class="meta-text text-sm-center ">
							<h2>
								<a href="actdesview/${act.activeID}">${act.activeName}</a>
							</h2>
							<p class="designation">${act.activeHost}</p>
							<div class="mb-4">
								<p>
									開始時間:${act.activeStartDate}<br>活動地點:${act.activeLocation}
								</p>
							</div>
							<div class="align-items-center justify-content-center d-flex">
								<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
									class="ti-twitter"></i></a> <a href="#"><i class="ti-linkedin"></i></a>
								<a href="#"><i class="ti-pinterest"></i></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--================ End Trainers Area =================-->

	<!--================ Start Events Area =================-->
	<!-- 	<div class="events_area"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row justify-content-center"> -->
	<!-- 				<div class="col-lg-5"> -->
	<!-- 					<div class="main_title"> -->
	<!-- 						<h2 class="mb-3 text-white">論壇文章一覽</h2> -->
	<!-- 						<p>各式各樣的朋友等你來認識，快來加入神明便利店</p> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div class="col-lg-6 col-md-6"> -->
	<!-- 					<div class="single_event position-relative"> -->
	<!-- 						<div class="event_thumb"> -->
	<%-- 							<img src="/t6_27img.controller/${post.postid}" width="550px" --%>
	<!-- 								height="400px" /> -->
	<!-- 						</div> -->
	<!-- 						<div class="event_details"> -->
	<!-- 							<div class="d-flex mb-4"> -->
	<!-- 								<div class="date"> -->
	<%-- 									<span>${post.date}</span> --%>
	<!-- 								</div> -->
	<!-- 							</div> -->
	<%-- 							<p>${post.title}</p> --%>
	<!-- 							<a href="/t6_27findFontPostDetail.controller/1004" -->
	<!-- 								class="primary-btn rounded-0 mt-3">閱讀全文</a> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				<div class="col-lg-6 col-md-6"> -->
	<!-- 					<div class="single_event position-relative"> -->
	<!-- 						<div class="event_thumb"> -->
	<%-- 							<img src="/t6_27img.controller/${post1.postid}" width="550px" --%>
	<!-- 								height="400px" /> -->
	<!-- 						</div> -->
	<!-- 						<div class="event_details"> -->
	<!-- 							<div class="d-flex mb-4"> -->
	<!-- 								<div class="date"> -->
	<%-- 									<span>${post1.date}</span> --%>
	<!-- 								</div> -->
	<!-- 							</div> -->
	<%-- 							<p>${post1.title}</p> --%>
	<!-- 							<a href="/t6_27findFontPostDetail.controller/1005" -->
	<!-- 								class="primary-btn rounded-0 mt-3">閱讀全文</a> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->

	<!-- 				<div class="col-lg-12"> -->
	<!-- 					<div class="text-center pt-lg-5 pt-3"> -->
	<!-- 						<a href="/t6_27showFrontforumPage.controller" class="event-link"> -->
	<!-- 							到看板查詢 <img src="front_index/img/next.png" alt="" /> -->
	<!-- 						</a> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!--================ End Events Area =================-->

	<!--================ Start Testimonial Area =================-->
	<div class="testimonial_area section_gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">香客預約住宿</h2>
						<p>全台最潮香客大樓~東方文化獨特的內斂美學，並以禪風為主要象徵風格，來場身心靈的蛻變之旅~</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="testi_slider owl-carousel">
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>寧靜悠遠房</h4>
									<p>強調文雅、沉穩。整體不花俏、不活潑、不紊亂，利用質樸的內斂感帶給居住者雋永及放鬆的使用感受。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room1.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>現代禪風房</h4>
									<p>現代禪風為基調，純淨寫意、溫馨明亮的空間佈置，以全新的觀點感受，體驗不一樣的風貌，讓您暫忘都市塵囂，全然地沈澱身心靈。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room2.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>精緻慢遊房</h4>
									<p>能進行短暫的修行，還能夠磨練心智、淨化靈魂，想要更深入了解寺廟文化，不如來寺廟留宿，體驗一次禪修之旅。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room3.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>深度假期房</h4>
									<p>透過最簡單的線條呈現空間的層次，讓人有安靜平和的感受。莊嚴靜謐，暫且放下塵世煩惱，放空心靈，換來難得的寧靜。</p>
								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room4.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>輕奢家庭房</h4>
									<p>據說能在此遇見眾多神祇，前去參拜即能獲得力量，能療癒參拜者一身疲勞</p>
								</div>
							</div>
						</div>
					</div>
					<div class="testi_item">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<img src="front_index/img/testimonials/room5.jpg" alt="" />
							</div>
							<div class="col-lg-8">
								<div class="testi_text">
									<h4>心靈淨化房</h4>
									<p>汰舊換新x心靈蛻變x療癒旅程x經文解說x齋飯養生X添補財庫</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================ End Testimonial Area =================-->

	<!--================ Start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>購物商城</h4>
					<ul>
						<li><a href="#">運勢小物</a></li>
						<li><a href="http://localhost:8081/showAllClass.controller">改運課程</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>功能導覽</h4>
					<ul>
						<li><a href="single-blog.html">近期活動</a></li>
						<li><a href="single-blog.html">信徒論壇</a></li>
						<li><a href="single-blog.html">姻緣配對</a></li>
						<li><a href="single-blog.html">住宿訂房</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>會員中心</h4>
					<ul>
						<li><a href="/loginToProfile">基本資料</a></li>
						<li><a href="/showAllClass.controller">課程訂單紀錄</a></li>
						<li><a href="/EventRegist">已報名活動</a></li>
						<li><a href="/favorite">我的最愛活動</a></li>
						<li><a href="single-blog.html">訂房紀錄</a></li>
						<li><a href="single-blog.html">發文紀錄</a></li>
						<li><a href="single-blog.html">配對紀錄</a></li>
						<li><a href="single-blog.html">物品訂單紀錄</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>聯絡我們</h4>
					<ul>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 single-footer-widget">
					<h4>歡迎寄信到以下信箱</h4>
					<p>神明便利店誠摯歡迎您!</p>
					<div class="form-wrap" id="mc_embed_signup">
						<form target="_blank"
							action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							method="get" class="form-inline">
							<input class="form-control" name="EMAIL"
								placeholder="teemin20230202@gmail.com"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address'" required=""
								type="email" />
							<button class="click-btn btn btn-default">
								<span>subscribe</span>
							</button>
							<div style="position: absolute; left: -5000px;">
								<input name="b_36c4fd991d266f23781ded980_aefe40901a"
									tabindex="-1" value="" type="text" />
							</div>

							<div class="info"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					此網站版權屬於神明便利店所有 <i class="ti-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">李天明</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
						class="ti-twitter"></i></a> <a href="#"><i class="ti-dribbble"></i></a>
					<a href="#"><i class="ti-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$('#UserPic').on('click', function() {
			console.log("665445")
			window.location.href = '/login'
		});

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
	</script>
</body>
</html>