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

<style>
.scrollable {
	height: 100px;
	width: 100px;
	overflow: hidden;
}

a {
    text-decoration:none;
}
</style>
</head>



<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" class="app" style="margin-left: 250px">
		<main>




			<h4 class="title">活動資訊</h4>
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col-6 col-md-4">
						<div class="content_wrapper">
							<div class="content">
								<img class="img" height='223px' width='263px'
									src="/actives/toImg/${active.activeID}" alt="">
							</div>
							
							<br>
							<a href="/actives">
              <button  type="submit" class="btn  btn-rounded btn-outline-primary">
                <i class="fa-solid fa-rotate-left"></i>返回
              </button>
              </a>
              <a href="/actives/updateView/${active.activeID}">
              <button  type="submit" class="btn  btn-rounded btn-outline-primary">
                <i class="fa-solid fa-pen-to-square"></i>編輯活動
              </button>
              </a>
					</div>
					</div>


					<div class="col-6 col-md-4">
						<div style="margin-top:40px">
<br>
							<ul>
								<li>名稱：${active.activeName}</li>
								<li>開始時間：${active.activeStartDate}</li>
								<li>結束時間：${active.activeEndDate}</li>
								<li>地點：${active.activeLocation}</li>
								<li>主辦單位：${active.activeHost}</li>
								<li>報名人數：${active.activeSignUpNumber}</li>
							</ul>



						</div>
					</div>
					<div class="card-body">

						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>報名編號</th>
									<th>報名者帳號</th>
									<th>報名者姓名</th>
									<th>報名者email</th>
									<th>報名者電話</th>
									<!-- 									<th>操作</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="enroll" items="${enrollinfo}">
									<tr>
										<td>${enroll.participantId}</td>
										<td>${enroll.users.userName}</td>
										<td>${enroll.participantName}</td>
										<td>${enroll.participantEmail}</td>
										<td>${enroll.participantPhone}</td>
										<!-- 										<td> -->
										<!-- 											<div style="display: inline"> -->

										<%-- 												<a href="actives/updateView/${act.activeID}"> --%>
										<!-- 													<button class="btn btn-success"> -->
										<!-- 														<i class="fas fa-pen-square"></i> -->
										<!-- 													</button> -->
										<!-- 												</a> -->
										<%-- 												<a href="actives/del/${act.activeID}"> --%>
										<%-- 												<button id="${act.activeID}" class="btn btn-danger delbtn"> --%>
										<!-- 													<i class="fas fa-trash-alt" ></i> -->
										<!-- 												</button> -->
										<!-- 												</a>		 -->
										<!-- 											</div></td> -->
									</tr>

								</c:forEach>
							</tbody>
						</table>
						

					</div>
				</div>
			</div>
		</main>
	</div>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


	<script type="text/javascript">
	$(function(){
		$(".delbtn").click(function(){
			let MyId=$(this).attr("id")
		  Swal.fire({
		    title: '你確定嗎?',
		    text: "刪除後就回不去囉!",
		    icon: 'warning',
		    showCancelButton: true,
		    confirmButtonColor: '#007500',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '就是要刪'
		  }).then((result) => {
		    if (result.isConfirmed) {
		      axios.delete('actives/' + MyId)
		      .then(response => {
		        Swal.fire(
		          '活動已刪除!',
		          '別怪我沒有提醒你嘿',
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
	    }
		)})
</script>



</body>
</html>
