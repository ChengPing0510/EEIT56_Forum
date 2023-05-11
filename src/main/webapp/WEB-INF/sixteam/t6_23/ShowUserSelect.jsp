<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				form {
					margin: 0 auto;
					width: 400px;
				}
			</style>
			<link href="../background_index/css/index_backgroundOnly.css" rel="stylesheet" />

			<link href="../background_index/css/styles.css" rel="stylesheet" />
			<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		</head>

		<body class="sb-nav-fixed">
			<div>

				<jsp:include page="/background_index/index-backToMVC.jsp" />
			</div>
			<div id="layoutSidenav_content" style="margin-left: 250px">
				<main>
					<div align="RIGHT">
						<a href="http://localhost:8080/SecondServlet/index.html">回主頁</a>
						<!--  ShowAllPeopleServlet  -->
						<a href='<c:url value="/t6_23/showallpeople.do" />'>查詢資料(後臺用)</a>
						<a href='<c:url value="/t6_23/insertPeopleForm.controller" />'>新增資料</a>
					</div>
					<div>
						<form action="<c:url value='/t6_23/userselect.controller' />" method="POST">
							<table>
								<tr>
									<th colspan='2' align="center">
										<h1>搜尋</h1>
									</th>
									<th></th>
								</tr>
								<tr>
									<td width='160' align="RIGHT">輸入帳號或暱稱：</td>
									<td width='100' align="LEFT"><input type="text" name="userId" size="10"
											id="getname"></td>
									<td colspan="2" align="LEFT">
										<button id="send" type="submit" value="send">搜尋</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<hr>
					<div align='center'>
						<div class="container-fluid px-4">
							<h1 class="mt-4" style="text-align: center">會員資料清單</h1>
							<table id="datatablesSimple">
								<tr>
									<th width='80'>編號</th>
									<th width='120'>暱稱</th>
									<th width='80'>年齡</th>
									<th width='80'>性別</th>
									<th width='140'>地址</th>
									<th width='150'>圖片</th>
								</tr>
								<c:forEach var="bean" items="${peopleBeans}">
									<tr>
										<td align='center'><a
												href="<c:url value='/t6_23/showpeople.controller?id=${bean.userid}' />">${bean.userid}</a>
										</td>
										<td align='center'><a
												href="<c:url value='/t6_23/showpeople.controller?id=${bean.userid}' />">${bean.name}</a>
										</td>
										<td align='center'> ${bean.age} </td>
										<td align='center'>${bean.sex}</td>
										<td align='center'>${bean.address}</td>
										<td align='center'><img height='100' width='80'
												src="<c:url value='/t6_23/toImages?id=${bean.userid}' />"></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<p>
							<hr>
							<a href="javascript:history.back()">回上頁</a>
					</div>
				</main>
			</div>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
			<script type="text/javascript">
				$(() => {
					$('#send').click(() => {
						var userid = $('#getname').val();
						console.log('userid: ' + userid);
					})

				})

			</script>


			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="../background_index/js/scripts.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
				crossorigin="anonymous"></script>
			<script src="../background_index/assets/demo/chart-area-demo.js"></script>
			<script src="../background_index/assets/demo/chart-bar-demo.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="../background_index/js/datatables-simple-demo.js"></script>
		</body>

		</html>