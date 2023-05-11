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

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>
<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.feature-img {
	text-align: center;
}
.backtolist{
width:200px;
text-align: center;
}
</style>

</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section_gap">

		<div class="backtolist">
			<a href="/t6_27showboard.controller?board=${post.board}"> <input
				type="submit" name="board" value="回文章列表">
			</a>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
<!-- 							<div class="feature-img"> -->
<!-- 								<img class="img-fluid" -->
<%-- 									src="<c:url value='/t6_27img.controller/${post.postid}' />"> --%>
<!-- 							</div> -->
						</div>
						<div class="col-lg-3  col-md-3">
							<div class="blog_info text-right">

								<ul class="blog_meta list">
									<li><a href="#">${post.date}<i class="ti-calendar"></i></a></li>
									<li><a href="#">${post.good}<i class="ti-heart"></i></a></li>
									<li><a href="#" class="comment-count"> <i
											class="ti-comment"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-7 col-md-8 blog_details">
							<h2>${post.title}</h2>
							<p class="excert">${post.content}</p>
						</div>
						<div id="checklogin_forumarea"
							class="col-lg-1 col-md-1 blog_details">
							
							<!-- 喜歡文章按紐 -->
							<button data-postid="${post.postid}"
								class="btn btn-success goodpost-btn">
								<i class="fas fa-thumbs-up"></i> ${post.good}
							</button>&nbsp;

							<!-- 不喜歡文章按紐 -->
							<button data-postid="${post.postid}"
								class="btn btn-danger badpost-btn">
								<i class="fas fa-thumbs-down"></i> ${post.bad}
							</button>&nbsp;
							
							<!-- 檢舉文章按紐 -->
							<button data-postid="${post.postid}"
								class="btn btn-warning report-btn">
								<i class="fa-solid fa-triangle-exclamation"></i> 檢舉
							</button>
						</div>

					</div>
					<hr>

					<!-- ==============================留言區======================================================= -->
					<div class="comments-area">
						<h3>
							<strong> 留言區 <i class="fa-solid fa-comments"></i>
							</strong>
						</h3>

						<c:set var="commentCount" value="0" />
						<c:forEach var="comments" items="${commentlist}">

							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img src="img/blog/c1.jpg" alt="">
											<%-- 這邊放會員照片 --%>
										</div>
										<div class="desc">
											<h5>
												<a href="#">${comments.commentid}</a>
												<%--這邊放會員名稱--%>
											</h5>
											<p class="date">${comments.commenttime}</p>
											<p class="comment">${comments.commentcontent}</p>
										</div>
									</div>
									
									<div class="checklogin_forumarea">
										<div class="commentcontrol-btn">
											<!-- 喜歡留言按紐 -->
											<button data-commentid="${comments.commentid}"
												class="btn btn-success likecomment-btn">
												<i class="fas fa-thumbs-up"></i> ${comments.commentlike}
											</button>
											<!-- 不喜歡留言按紐 -->
											<button data-commentid="${comments.commentid}"
												class="btn btn-danger dislikecomment-btn">
												<i class="fas fa-thumbs-down"></i>
												${comments.commentdislike}
											</button>
											<!-- 刪除留言按紐 -->
											<button id="${comments.commentid}"
												class="btn btn-danger delcommentbtn">
												<i class="fas fa-trash-alt"></i>
											</button>
										</div>
									</div>

								</div>
							</div>
							<c:set var="commentCount" value="${commentCount+1}" />
						</c:forEach>

					</div>
					<div id="checklogin_area">
						<form name="usersid" class="comment-form"
							data-commentid="${post.postid}" method="post"
							action="<c:url value='/t6_27addFrontComment.controller'/>"
							enctype="multipart/form-data">
							<h3>
								<strong>我有話要說</strong>
							</h3>
							<div class="form-group">
								<textarea class="form-control mb-10" rows="5" maxlength="25"
									name="commentcontent" placeholder="想說些甚麼?"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '想說些甚麼?'" required="required"></textarea>
								<input type="submit" class="primary-btn" value="送出留言">
							</div>
							<input type="hidden" name="commentpostid" value="${post.postid}">
							<input type="hidden" name="commentid" value="${post.postid}">
						</form>
					</div>
					<div id="tologin"></div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">熱門文章</h3>
							<c:forEach var="bean" items="${hotpostlist}">
								<div class="media post_item">
									<img height='120' width='120'
										src="<c:url value='../t6_27img.controller/${bean.postid}'/>">
									<div class="media-body">
										<a href="../t6_27findFontPostDetail.controller/${bean.postid}">
											<h3>${bean.title}</h3>
										</a>
										<p>${bean.date}</p>
									</div>
								</div>
							</c:forEach>

							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget ads_widget">
							<a href="#"><img class="img-fluid" src="img/blog/add.jpg"
								alt=""></a>

						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">論壇看板</h4>
							<ul class="list cat-list">
								<li><a href="../t6_27showboard.controller?board=星座運勢"
									title="星座運勢" class="d-flex justify-content-between">
										<p>星座運勢</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=紫微斗數"
									title="紫微斗數" class="d-flex justify-content-between">
										<p>紫微斗數</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=塔羅愛情"
									title="塔羅愛情" class="d-flex justify-content-between">
										<p>塔羅愛情</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=十二生肖"
									title="十二生肖" class="d-flex justify-content-between">
										<p>十二生肖</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=九星命卦"
									title="九星命卦" class="d-flex justify-content-between">
										<p>九星命卦</p>
								</a></li>
								<li><a href="/t6_27showboard.controller?board=心理測驗"
									title="心理測驗" class="d-flex justify-content-between">
										<p>心理測驗</p>
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
	<!-- 	<script src="front_index/js/jquery-3.2.1.min.js"></script> -->
	<!-- 	<script src="front_index/js/popper.js"></script> -->
	<!-- 	<script src="front_index/js/bootstrap.min.js"></script> -->
	<!-- 	<script -->
	<!-- 		src="front_index/vendors/nice-select/js/jquery.nice-select.min.js"></script> -->
	<!-- 	<script src="front_index/vendors/owl-carousel/owl.carousel.min.js"></script> -->
	<!-- 	<script src="front_index/js/owl-carousel-thumb.min.js"></script> -->
	<!-- 	<script src="front_index/js/jquery.ajaxchimp.min.js"></script> -->
	<!-- 	<script src="front_index/js/mail-script.js"></script> -->
	<!-- 	<!--gmaps Js-->
	-->
	<!-- 	<script -->
	<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script> -->
	<!-- 	<script src="front_index/js/gmaps.min.js"></script> -->
	<!-- 	<script src="front_index/js/theme.js"></script> -->

	<!--檢查是否登入會員-->
	<script>
    var check = '${LoginOK}'
    if (check != '') {
    } else {
        $('#checklogin_area').hide();
//         $('.comment-form').hide();
        $('#tologin')
                .append(
                        '<a href="/login" style="font-size: 18px; font-weight: bold">請施主先登入會員後，再新增留言</a>');

    }
    
    var check = '${LoginOK}'
        if (check != '') {
        } else {
            $('#checklogin_forumarea').hide();  
            $('.checklogin_forumarea').hide();
        }
    
	// 	按文章喜翻
    $(".goodpost-btn").click(function () {
        var postid = $(this).data("postid");
        $.ajax({
            url: "../likePost.controller",
            type: "post",
            data: {
            	postid: postid
            },
            success: function (data) {
                location.reload();
            }
        });
    });

    // 	按文章不喜翻
    $(".badpost-btn").click(function () {
        var postid = $(this).data("postid");
        $.ajax({
            url: "../dislikePost.controller",
            type: "post",
            data: {
            	postid: postid
            },
            success: function (data) {
                location.reload();
            }
        });
    });
    
 	// 檢舉文章
    $(".report-btn").click(function() {
        var postid = $(this).data("postid");
        $.ajax({
            url: "/reportPost",
            type: "POST",
            data: {
            	postid: postid
            },
            success: function(result) {
                alert("檢舉成功！");
            },
            error: function(result) {
                alert("檢舉失敗！");
            }
        });
    });
    

	// 	Delete留言防呆
	$(function(){
        $(".delcommentbtn").click(function(){
            let MyId=$(this).attr("id")
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
              axios.get('../t6_27deleteComment.controller/' + MyId)
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
	})
    


        
        // 	按留言喜翻
        $(".likecomment-btn").click(function() {
            var commentid = $(this).data("commentid");
            $.ajax({
                url: "../likeComment.controller",
                type: "post",
                data: {
                    commentid: commentid
                },
                success: function(data) {
                    location.reload();
                }
            });
        });

		// 	按留言不喜翻
        $(".dislikecomment-btn").click(function() {
            var commentid = $(this).data("commentid");
            $.ajax({
                url: "../dislikeComment.controller",
                type: "post",
                data: {
                    commentid: commentid
                },
                success: function(data) {
                    location.reload();
                }
            });
        });	
		

		//顯示留言數量
	   const comments = [...document.querySelectorAll(".comment-list")];
	   const commentCount = comments.length;
	   document.querySelector(".comment-count").innerHTML = commentCount+" 則留言";
	
	</script>


</body>
</html>