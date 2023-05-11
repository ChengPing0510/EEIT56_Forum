<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="img/favicon.png" type="image/png" />
<title>神明便利店</title>
<!-- Bootstrap CSS -->
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
</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
	<!--================ End Header Menu Area =================-->
	<!--================ Start Home Banner Area =================-->
	<section class="blog_area section_gap">
		<div class="main_title">
			<h2 class="mb-3">神明文章列表</h2>
		</div>
		<div class="container">
			<!-- 			文章分類按鈕 -->
			<div class="sort_btn_div">
				<a href="../t6_27showsort.controller?sort=公告"><button
						class="sort_btn">公告</button></a> <a
					href="../t6_27showsort.controller?sort=閒聊"><button
						class="sort_btn">閒聊</button></a> <a
					href="../t6_27showsort.controller?sort=心得">
					<button class="sort_btn">心得</button>
				</a> <a href="../t6_27showsort.controller?sort=問題">
					<button class="sort_btn">問題</button>
				</a> <a href="../t6_27showsort.controller?sort=情報">
					<button class="sort_btn">情報</button>
				</a> <a href="../t6_27showsort.controller?sort=討論">
					<button class="sort_btn">討論</button>
				</a> <a href="../t6_27showsort.controller?sort=其他">
					<button class="sort_btn">其他</button>
				</a>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<article class="row blog_item">
							<table>
								<c:forEach var="bean" items="${sort}">
									<div class="col-md-3">
										<div class="blog_info text-right">
											<ul class="blog_meta list">
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.date}<i
														class="ti-calendar"></i></a></li>
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.sort}<i
														class="ti-clipboard"></i></a></li>
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.good}<i
														class="ti-heart"></i></a></li>
												<li><a
													href="/t6_27findFontPostDetail.controller/${bean.postid}">${bean.commentscount}<i
														class="ti-comment"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-9">
										<div class="blog_post">
											<div class="blog_details">
												<a href="/t6_27findFontPostDetail.controller/${bean.postid}">
													<h2>${bean.title}</h2>
												</a> <img height='120' width='150'
													src="<c:url value='../t6_27img.controller/${bean.postid}' />">
												<p></p>
												<a href="/t6_27findFontPostDetail.controller/${bean.postid}"
													class="blog_btn">閱讀全文 ...</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</table>
						</article>

						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <i
											class="ti-angle-left"></i>
									</span>
								</a></li>
								<li class="page-item"><a href="#" class="page-link">01</a></li>
								<li class="page-item active"><a href="#" class="page-link">02</a></li>
								<li class="page-item"><a href="#" class="page-link">03</a></li>
								<li class="page-item"><a href="#" class="page-link">04</a></li>
								<li class="page-item"><a href="#" class="page-link">09</a></li>
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <i
											class="ti-angle-right"></i>
									</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-4">



					<div id="checklogin_area">
						<form action="t6_27showFontAddPage.controller">
							<input type="submit" id="loginCheck" name="usersid"
								class="forumpost_btn" value="新增文章">
						</form>
					</div>

					<p></p>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Search Posts"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="ti-search"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Popular Posts</h3>
							<div class="media post_item">
								<img src="img/blog/popular-post/post1.jpg" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Space The Final Frontier</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post2.jpg" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>The Amazing Hubble</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post3.jpg" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Astronomy Or Astrology</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post4.jpg" alt="post">
								<div class="media-body">
									<a href="blog-details.html">
										<h3>Asteroids telescope</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget ads_widget">
							<a href="#"><img class="img-fluid" src="img/blog/add.jpg"
								alt=""></a>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Post Catgories</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex justify-content-between">
										<p>Technology</p>
										<p>37</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Lifestyle</p>
										<p>24</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Fashion</p>
										<p>59</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Art</p>
										<p>29</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Food</p>
										<p>15</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Architecture</p>
										<p>09</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>Adventure</p>
										<p>44</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================ Start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Top Products</h4>
					<ul>
						<li><a href="#">Managed Website</a></li>
						<li><a href="#">Manage Reputation</a></li>
						<li><a href="#">Power Tools</a></li>
						<li><a href="#">Marketing Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Features</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Resources</h4>
					<ul>
						<li><a href="#">Guides</a></li>
						<li><a href="#">Research</a></li>
						<li><a href="#">Experts</a></li>
						<li><a href="#">Agencies</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 single-footer-widget">
					<h4>Newsletter</h4>
					<p>You can trust us. we only send promo offers,</p>
					<div class="form-wrap" id="mc_embed_signup">
						<form target="_blank"
							action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							method="get" class="form-inline">
							<input class="form-control" name="EMAIL"
								placeholder="Your Email Address" onfocus="this.placeholder = ''"
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
					All rights reserved | This template is made with <i
						class="ti-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
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

	<!--檢查是否登入會員-->
	<script>
		var check = '${LoginOK}'
		if (check != '') {
		} else {
			$('#loginCheck').hide();
			$('#checklogin_area')
					.append(
							'<a href="/login" style="font-size: 18px; font-weight: bold">請施主先登入會員後，再新增文章</a>');

		}
	</script>

</body>
</html>