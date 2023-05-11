<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
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
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>
<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
	<!--================ End Header Menu Area =================-->

	<!--================Blog Area =================-->


	<section class="blog_area section_gap">
		<div class="main_title">
			<h2 class="mb-3">個人文章列表</h2>
		</div>
		<div class="container">

			<Form action="<c:url value='../t6_27showFrontforumPage.controller'/>"
				method="GET" name="loginForm">
				<input type="submit" value="回論壇首頁">
			</Form>
			<!-- 			文章分類按鈕 -->
			<!-- 			<div class="sort_btn_div"> -->
			<!-- 				<a href="../t6_27showsort.controller?sort=公告"><button -->
			<!-- 						class="sort_btn">公告</button></a> <a -->
			<!-- 					href="../t6_27showsort.controller?sort=閒聊"><button -->
			<!-- 						class="sort_btn">閒聊</button></a> <a -->
			<!-- 					href="../t6_27showsort.controller?sort=心得"> -->
			<!-- 					<button class="sort_btn">心得</button> -->
			<!-- 				</a> <a href="../t6_27showsort.controller?sort=問題"> -->
			<!-- 					<button class="sort_btn">問題</button> -->
			<!-- 				</a> <a href="../t6_27showsort.controller?sort=情報"> -->
			<!-- 					<button class="sort_btn">情報</button> -->
			<!-- 				</a> <a href="../t6_27showsort.controller?sort=討論"> -->
			<!-- 					<button class="sort_btn">討論</button> -->
			<!-- 				</a> <a href="../t6_27showsort.controller?sort=其他"> -->
			<!-- 					<button class="sort_btn">其他</button> -->
			<!-- 				</a> -->
			<!-- 			</div> -->
			<div class="row">
				<div class="col-lg-9">
					<div class="blog_left_sidebar">
						<article class="row blog_item">
							<table id="content">
								<c:forEach var="bean" items="${userPost}">
									<div class="col-md-3">
										<div class="blog_info text-right">
											<ul class="blog_meta list">
												<li><a href="#">${bean.date}<i class="ti-calendar"></i></a></li>
												<li><a href="#">${bean.board}<i class="ti-book"></i></a></li>
												<li><a href="#">${bean.good}<i class="ti-heart"></i></a></li>
												<li><a href="#">${bean.viewcount}<i class="ti-eye"></i></a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-9">
										<div class="blog_post">
											<div class="blog_details">
												<%-- <a href="/t6_27findFontPostDetail.controller/${bean.postid}"> --%>
												<h2>${bean.title}</h2>
												</a> <img height='150' width='200'
													src="<c:url value='../t6_27img.controller/${bean.postid}' />">
												<p></p>
												<button class="blog_btn" data-postid="${bean.postid}">閱讀全文
													...</button>
											</div>

											<div style="display: inline">
												<div class="commentcontrol-btn">
													<!-- 更新文章按紐 -->
													<a
														href="../t6_27showFontUpdatePage.controller/${bean.postid}">
														<button class="btn btn-success">
															<i class="fas fa-pen-square"></i>
														</button>
													</a>
													<!-- 刪除文章按紐 -->
													<button id="${bean.postid}"
														class="btn btn-danger delcommentbtn">
														<i class="fas fa-trash-alt"></i>
													</button>
												</div>
												<hr>
											</div>
										</div>
									</div>
									<input type="hidden" value="${bean.usersid}">
								</c:forEach>
							</table>
						</article>

						<nav class="blog-pagination justify-content-center d-flex">

							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${totalPages}" step="1">
									<li class="page-item"><a class="page-link" href="${i}">${i}</a></li>
								</c:forEach>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-3">



					<div id="checklogin_area">
						<form action="../t6_27showFontAddPage.controller">
							<input type="submit" id="loginCheck" name="usersid"
								class="forumpost_btn" value="新增文章">
						</form>
					</div>
					<div class="blog_right_sidebar">
						<p></p>
						<h3 class="widget_title">尋找文章</h3>
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<form action="../t6_27showboard.controller" method="GET"
									enctype="multipart/form-data">
									<input type="text" class="" placeholder="按下 Enter 送出"
										name="title" required="required"> <input type="hidden"
										name="board">
								</form>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

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
		
//	 	Delete留言防呆
		$(function () {
		        $(".delcommentbtn").click(function () {
		            let MyId = $(this).attr("id")
		            Swal.fire({
		                title: '是否確定刪除?',
		                text: "刪除後無法復原!",
		                icon: 'warning',
		                showCancelButton: true,
		                confirmButtonColor: '#007500',
		                cancelButtonColor: '#d33',
		                confirmButtonText: '確定刪除'
		            }).then((result) => {
		                if (result.isConfirmed) {
		                    axios.get('../t6_27delete.controller/' + MyId)
		                        .then(response => {
		                            Swal.fire(
		                                '刪除成功!',
		                                'success'
		                            )
		                            setTimeout(() => {
		                                location.reload();
		                            }, 2000);
		                        })
		                        .catch(error => {
		                            Swal.fire(
		                                'Error!',
		                                'There was an error while deleting the item.',
		                                'error'
		                            )
		                        });
		                }
		            })
		        })
		    });
		
	</script>

	<script>
		$(document).ready(function() {
			  $(".blog_btn").click(function(event) {
			    event.preventDefault(); // 阻止默認的按鈕行為
			    var postid = $(this).data("postid");
			    var url = "/viewCount.controller?postid=" + postid;
			    $.ajax({
			      url: url,
			      type: "POST",
			      success: function(result) {
			        console.log(result);
			        // 跳轉到文章詳細內容的頁面
			        window.location.href = "/t6_27findFontPostDetail.controller/" + postid;
			      },
			      error: function(xhr, status, error) {
			        console.log(xhr.responseText);
			      }
			    });
			  });
			});
	</script>



</body>
</html>