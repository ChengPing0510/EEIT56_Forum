<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				#a001 {
					margin: 0 auto;
					width: 600px;
				}
			</style>
			<link href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
				rel="stylesheet" />

			<link href="${pageContext.request.contextPath}/background_index/css/styles.css" rel="stylesheet" />
			<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		</head>

		<body onload="setInterval(countDown, 1000)" class="sb-nav-fixed">
			<div>

				<jsp:include page="/background_index/index-backToMVC.jsp" />
			</div>
			<div id="a001">
				<h1>歡迎 ${ peopleBean.name }!! 資料新增成功</h1>
				年齡: ${ peopleBean.age }
				性別: ${ peopleBean.sex }
				地址: ${ peopleBean.address }
				<hr>
				<a href='<c:url value="/t6_23/test1.controller" />'>回首頁</a><br>
				五秒鐘後自動回首頁<br>
				<font id="num" size="7" face="impact">5</font>
			</div>
			<script>
				var sec = 5;
				function countDown() {
					if (sec > 1)
						num.innerHTML = --sec;
					else
						location = '<c:url value="/t6_23/test1.controller" />';
				}
			</script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
				crossorigin="anonymous"></script>
			<script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
			<script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
		</body>

		</html>