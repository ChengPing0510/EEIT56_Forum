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
<link
	href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/background_index/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>


<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<style type="text/css">
.scrollable {
	height: 500px;
	width: 350px;
	overflow: auto;
}
</style>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
</head>
<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">文章</h1>
				<Form action="<c:url value='/t6_27show.controller'/>" method="GET"
					name="loginForm">
					<input type="submit" value="回文章列表">
				</Form>
				<ol class="breadcrumb mb-4">
					<!-- <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
					<!-- <li class="breadcrumb-item active">Tables</li> -->
				</ol>
				<!-- <div class="card mb-4"> -->
				<!-- <div class="card-body"> -->
				<!-- DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
				<!-- <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
				<!-- . -->
				<!-- </div> -->
				<!-- </div> -->

				<!-- 				貼文區 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>編號</th>
									<th>文章日期</th>
									<th>標題</th>
									<th>封面圖</th>
									<th>內容</th>
									<th>推</th>
									<th>噓</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${post.postid}</td>
									<td>${post.date}</td>
									<td>
										<div class="scrollable">${post.title}</div>
									</td>
									<td><img height='150' width='200'
										src="<c:url value='/t6_27img.controller/${post.postid}' />"></td>
									<td>
										<div class="scrollable">${post.content}</div>
									</td>
									<td>${post.good}</td>
									<td>${post.bad}</td>
									<td>
										<div>
											<!-- 更新文章按紐 -->
											<a href="../t6_27updatePage.controller/${post.postid}">
												<button class="btn btn-success">
													<i class="fas fa-pen-square"></i>
												</button>
											</a>
										</div>
										<hr>
										<div>
											<!-- 刪除文章按紐 -->
											<button id="${post.postid}"
												class="btn btn-danger delpost-btn">
												<i class="fas fa-trash-alt"></i>
											</button>
										</div>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 留言區 -->
				<h3 class="mt-4" style="text-align: center">留言</h3>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
					</div>
					<div class="card-body">
						<table id="datatablesSimplet6_27">
							<thead>
								<tr>
									<th>編號</th>
									<th>時間</th>
									<th>留言</th>
									<th>喜翻數</th>
									<th>不喜翻數</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="comments" items="${comments}">
									<tr>
										<td>${comments.commentid}</td>
										<td>${comments.commenttime}</td>
										<td>${comments.commentcontent}</td>
										<td>${comments.commentlike}</td>
										<td>${comments.commentdislike}</td>
										<td>
											<div style="display: inline">
												<!-- 刪除留言按紐 -->
												<button id="${comments.commentid}"
													class="btn btn-danger delcommentbtn">
													<i class="fas fa-trash-alt"></i>
												</button>

											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 新增留言 -->
				<div class="card mb-4">
					<form data-commentid="${post.postid}" class="comment-form"
						name="form1" method="post" enctype="multipart/form-data">
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>留言內容</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" name="commentcontent"
											required="required"></td>
										<td><input type="submit" value="發表留言" /></td>
									</tr>
								</tbody>
							</table>
						</div>
						<input type="hidden" name="commentpostid" value="${post.postid}">
					</form>
				</div>

			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
<!-- 	<script -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" -->
<!-- 		crossorigin="anonymous"></script> -->
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script> --%>
<!-- 	<script -->
<%-- 		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script> --%>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" -->
<!-- 		crossorigin="anonymous"></script> -->

	<script
		src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>

	<script
		src="${pageContext.request.contextPath}/background_index/js/t6_27datatable.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

	<script type="text/javascript">
	// 	Delete文章防呆
	$(function () {
		$(".delpost-btn").click(function () {
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
								window.location.href = "http://localhost:8081/t6_27show.controller";
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
		});
	});
</script>
	<!--  =====================================文章End===============================================	 -->
<script type="text/javascript">
    // 	Delete留言防呆
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

    //	按新增留言
    $(".comment-form").submit(function (event) {
        event.preventDefault();

        var postId = $(this).data("commentid");
        var form = event.target;
        var formData = new FormData(form);

        $.ajax({
            url: "../t6_27addFrontComment.controller",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                location.reload();
            }
        });
    });


</script>
	<!--  =====================================留言End===============================================	 -->


</body>
</html>