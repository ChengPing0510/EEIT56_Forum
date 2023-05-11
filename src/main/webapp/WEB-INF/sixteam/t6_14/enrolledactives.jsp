<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

<meta charset="utf-8">
<title>活動頁面</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- 手寫 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
.card img {
	height: 208px;
	transition: transform 0.3s ease-in-out;
}

.card img:hover {
	transform: scale(1.1);
}

h6      a {
	font-size: 17px;
	color: black;
}

h6 a:hover {
	color: red;
}


</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">

</head>

<body>
	<hr>

	<!-- Blog Start -->
	<div class="container">
		<div class="text-center my-5">
			<h1>已報名活動</h1>
			<hr>
		</div>

		<!-- Row Start -->
		<div class="row">
			<c:forEach var="act" items="${actives}" varStatus="status">

				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="card mb-5 shadow-sm"
						>
						<a href="actdesview/${act.activeID}"> <img
							src="../actives/toImg/${act.activeID}" class="img-fluid "
							width="500" height="500">
						</a>
						<div class="card-body">
							<div class="card-title">

								<h6>
									<a href="actdesview/${act.activeID}">${act.activeName}</a>
								</h6>
							</div>
							<div class="card-text">
								<p>
									開始時間:${act.activeStartDate}-${act.activeEndDate}<br>活動地點:${act.activeLocation}
								</p>
							</div>
							<div>
								<a href="actdesview/${act.activeID}"
									class="btn btn-outline-primary rounded-0 float-end">活動資訊</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- Row End -->
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/8bf3b6e829.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	
		
	</script>


</body>

</html>
<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
