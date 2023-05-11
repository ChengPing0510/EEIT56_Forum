<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<html>

	<head>
		<meta charset="UTF-8">
		<title>配對</title>
		<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
		<link rel="stylesheet" href="/front_index/css/flaticon.css" />
		<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
		<!-- <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" /> -->
		<link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
		<!-- main css -->
		<link rel="stylesheet" href="/front_index/css/style.css" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script type="text/javascript">
			var x = 0;
			$(function () {
				load(x);
			});

			function load(x) {
				$.ajax({
					type: 'post',
					url: '/t6_23/findMatch2.controller',
					dataType: 'JSON',
					success: (result) => {

						$('#showMatch').empty("");
						// console.log(result);
						var data1 = $('#showMatch');

						$.each(result, (i, n) => {
							var div2 = "<div class='col-lg-4 col-md-6 col-sm-12 pb-1' id='" + n.id + "' onclick='scanMatcher(" + n.id + ")'><div class='card product-item border-0 mb-4 col-lg-12'><div class='single_course'><div class='course_head' ><img style='height:200;width:140' class='img-fluid' src='/t6_23/getImages.controller/" + n.id + "' /></div><div class='course_content'><span class='tag mb-4 d-inline-block'>" + n.religion + "</span><span class='uname'>" + n.name + "</span>" + "<h4 class='mb-3'><a href='/t6_23/scanMatcherUser.controller/" + n.id + "'>" + n.emotion + "</a></h4>" + "<p>星座:" + n.star + "</p>" + "<p>血型:" + n.bloobtype + "</p>" + "<div class='card-footer d-flex justify-content-between bg-light border' style='margin-top: 20px'> <a href='/t6_23/scanMatcherUser.controller/" + n.id + "' class='btn btn-sm text-dark p-0'><iclass='fas fa-eye text-primary mr-1'></i>瀏覽資料</a></div></div></div></div></div>";
							// console.log(i);
							var div = "<div class='col-lg-12' id='" + n.id + "' onclick='scanMatcher(" + n.id + ")'><div class='single_course'><div class='course_head'><img height='200' width='140' class='img-fluid' src='/t6_23/getImages.controller/" + n.id + "' /></div>"
								+ "<div class='course_content'><span class='uname'>" + n.name + "</span> <span class='tag mb-4 d-inline-block'>" + n.religion + "</span>" + "<h4 class='mb-3'><a href='/t6_23/scanMatcherUser.controller/" + n.id + "'>" + n.emotion + "</a></h4>" + "<p>星座:" + n.star + "</p>" + "<p>血型:" + n.bloobtype + "</p>" + "<a href='/t6_23/scanMatcherUser.controller/" + n.id + "'>瀏覽資料</a>"
								// + "<button style='float: right' id='" + n.id + "' class='btn btn-sm text-dark p-0 goMatch' onclick='goMatch(" + n.id + ")'>進行配對</button>"
								+ "</div></div></div>";
							if (i < 9) {
								data1.append(div2);
							}

						});

						var buttom = "<div><input class='btn btn-primary goIndex' type='button' value='刷新' onclick='reload(" + x + ");'><div>";
						data1.append(buttom);

					},
					error: () => {
						alert("error");
					}
				});
			}

			function reload(x) {
				x++;
				if (x < 5) {
					console.log("x= " + x);
					load(x);
				} else {
					location.href = "/t6_23/research.controller";
				}
			}

			function goMatch(id) {
				console.log('id= ' + id);
				location.href = '/t6_23/matchSuccess.controller/' + id;
			}

			function scanMatcher(uid) {
				// alert(uid);
				location.href = '/t6_23/scanMatcherUser.controller/' + uid;
			}


		</script>

	</head>

	<body>

		<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

		<div class="popular_courses">
			<div class="container">

				<!-- <div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3">為您準備幾堂不錯的課程</h2>
						<p>集結各領域老師開班授課!</p>
					</div>
				</div>
			</div> -->


				<!-- single course -->
				<!-- <div class="col-lg-12">
					<div class="owl-carousel active_course" id="showMatch"> -->
				<div class="row" id="showMatch"></div>
				<!-- <c:forEach var="bean" items="${classList}">
							<div class="col-lg-12">
								<div class="single_course">
									<div class="course_head">
										<img class="img-fluid" src="t6_21images1.controller/${bean.classId}" alt="" />
									</div>
									<div class="course_content">

										<span class="price">${bean.classPrice}</span> <span
											class="tag mb-4 d-inline-block">${bean.classType}</span>
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
						</c:forEach> -->
			</div>
			<!-- </div> -->

		</div>
		</div>


		<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	</body>

	</html>