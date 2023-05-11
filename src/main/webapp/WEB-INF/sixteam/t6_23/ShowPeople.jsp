<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
				rel="stylesheet" />

			<link href="${pageContext.request.contextPath}/background_index/css/styles.css" rel="stylesheet" />
			<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		</head>

		<body class="sb-nav-fixed">
			<div>

				<jsp:include page="/background_index/index-backToMVC.jsp" />
			</div>
			<div align='center'>
				<h2>會員資料清單</h2>
				<hr>
				<table border='1' id="showpeople">
					<tr>
						<th width='80'>編號</th>
						<th width='120'>暱稱</th>
						<th width='80'>年齡</th>
						<th width='80'>性別</th>
						<th width='140'>地址</th>
						<th width='150'>圖片</th>
						<th width='60'>刪除</th>
					</tr>
					<c:forEach var="bean" items="${peopleBeans}">
						<tr id="${bean.userid}">
							<td align='center'><a
									href="<c:url value='/t6_23/showupdatepeopleform.controller/${bean.userid}' />">${bean.userid}</a>
							</td>
							<td align='center'><a
									href='/t6_23/showupdatepeopleform.controller/${bean.userid}'>${bean.name}</a>
							</td>
							<td align='center'>${bean.age}</td>
							<td align='center'>${bean.sex}</td>
							<td align='center'>${bean.address}</td>
							<td align='center'><img height='100' width='80'
									src="<c:url value='/t6_23/toImages?id=${bean.userid}' />"></td>
							<td><a href="/t6_23/removePeople.controller/${bean.userid}">刪除</a></td>
							<!-- <td><button class="deleteData" value="${bean.userid}">刪除</button></td> -->
						</tr>
					</c:forEach>
				</table>
				<p>
					<hr>
					<a href="<c:url value='/t6_23/test1.controller' />">回首頁</a>
			</div>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
			<script type="text/javascript">
				$(function () {
					// $('.deleteData').click(function () {
					// 	var uid = $(this).val(),
					// 		tid = "'#" + uid + "'";

					// 	if (confirm('你確定要刪除嗎?')) {
					// 		$.ajax({
					// 			url: '/t6_23/controller/removePeople.controller/' + uid,
					// 			type: 'delete',
					// 			success: () => {
					// 				alert('刪除成功');
					// 				$(tid).remove();
					// 			},
					// 			error: () => {
					// 				alert('刪除失敗');
					// 			}
					// 		});
					// 	}


					// if (confirm('你確定要刪除嗎?')) {
					// 	console.log(uid);
					// 	$.ajax({
					// 		url: '/t6_23/controller/removePeople.controller/' + uid,
					// 		type: 'GET',
					// 		dataType: "text",
					// 		success: function (data) {
					// 			$('#showpeople').empty("");

					// 			if (data == null) {
					// 				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
					// 			} else {
					// 				var table = $('#showpeople');
					// 				table.append("<tr>< th width = '80' > 編號</th >"
					// 					+ "<th width='120'>暱稱</th><th width='80'>年齡</th><th width='80'>性別</th><th width='140'>地址</th><th width='150'>圖片</th><th width='60'>刪除</th></tr > ");

					// 				$.each(data, function (i, n) {


					// 					var tr = "<tr><td align='center'><a href='/showPeopleControllersafe?id=" + n.userID + "' />" + n.userID + "</a></td>" + "<td align='center'><a href='/showPeopleControllersafe?id=" + n.userID + "' />" + n.name + "</a></td>" + "<td align='center'>" + n.age + "</td>" + "<td align='center'>" + n.sex + "</td>" + "<td align='center'>" + n.address + "</td>" + "<td align='center'>"
					// 						+ "<img height='100' width='80' src='/toImages?id=" + n.userID + "' />"
					// 						+ "</td>" + "<td><button class='deleteData' value='" + n.userID + "'>刪除</button></td>" + "</tr>"
					// 					table.append(tr);
					// 				});
					// 			}
					// 		}
					// 	});
					// }


					// Swal.fire({
					// 	title: '你確定要刪除這個帳號嗎?',
					// 	text: "刪除後將無法復原。",
					// 	icon: 'warning',
					// 	//icon:  "success", "error", "warning", "info" or "question" 5種選項
					// 	showCancelButton: true,
					// 	confirmButtonColor: '#f7d966',
					// 	cancelButtonColor: '#3d3b39',
					// 	cancelButtonText: '取消',
					// 	confirmButtonText: '忍痛刪除'

					// }).then((result) => {
					// 	if (confirm('你確定要刪除嗎?')) {
					// 		console.log(uid);
					// 		$.ajax({
					// 			url: 'removePeople.controller',
					// 			type: 'GET',
					// 			dataType: "text",
					// 			data: { "id": uid },
					// 		});
					// }
					// })
					// });

				});

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