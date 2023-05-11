<%@ page import="sixteam.t6_10.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員系統-新增會員</title>
<link rel="icon" type="image/png" href="front_index/img/logo.png" />
<link href="../background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="../background_index/css/styles.css" rel="stylesheet" />

<script src="https://kit.fontawesome.com/89b068a769.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
table {
	text-align: center;
}
</style>
</head>

<body class="sb-nav-fixed">
	<div>

		<jsp:include page="/background_index/index-backToMVC.jsp" />
	</div>

	<!--============================== -->

	<form id="addUserForm" name="form1" method="post"
		<%-- action='<c:url value='
        /t6_10_doAddUser.controller' />' --%>
       action='/t6_10_doAddUser.controller'
		enctype="multipart/form-data">

		<div id="layoutSidenav_content" style="margin-left: 250px">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4" style="text-align: center">
						<span class="fa-solid fa-users"></span>新增帳號
					</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>
							<!-- DataTable Example -->
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th><span class="fa-solid fa-address-card"></span>會員帳號</th>
										<!--                 <th>會員姓名</th> -->
										<th><span class="fa-solid fa-circle-user"></span>會員密碼</th>
										<!--                 <th>會員密碼</th> -->
										<th><span class="fa-solid fa-key"></span>Email</th>
										<!--                 <th>會員圖片</th> -->
										<th><span class="fa-solid fa-image"></span>當前圖片</th>
										<th><span class="fa-solid fa-pen-to-square"></span>送出資料</th>

									</tr>
								</thead>
								<tbody>
									<tr>

										<td><input type='text' name='username' id='username'
											placeholder='請輸入帳號' value="" required /> <br> <span
											id="response"></span></td>
										<td><input type="password" name="password" id="password"
											placeholder='請輸入密碼' value="" required></td>

										<td><input type='email' name='email' id='email'
											placeholder='請輸入Email' value="" required /></td>

										<td><img id="preImg" height='80' width='80'
											src="<c:url value='/images/0.png' />"><input
											id="uploadImg" type='file' name='photo' accept='.png,.jpg' />
										</td>
										<td>
											<!--            <button class="btn btn-primary btn-user btn-block" id="addUser"> -->
											<button class="btn btn-success btn-user btn-block"
												id="addUser">
												<i class="fa-solid fa-user-plus"></i> 新增
											</button>
											<button class="btn btn-primary btn-user btn-block"
												id="onekey" style='margin:10px'>
												<i class="fa-solid fa-user-plus"></i> 一鍵輸入
											</button>
										</td>
										<!--         <td><input type="button" value='新增帳號' class="btn btn-primary btn-user btn-block" id="addUser"></td> -->
										<!--           <td><button type="submit" value="upload" class="insert">新增</button></td> -->
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="roles" value="ROLE_USER" /> <input
								type="hidden" name="active" value="True" />
						</div>
					</div>
				</div>
			</main>
		</div>
	</form>






	<!--     <form action='/Hibernate_web_teacher/AddAccountControllersafe' enctype = 'multipart/form-data' method='post'> -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="../background_index/assets/demo/chart-area-demo.js"></script>
	<script src="../background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../background_index/js/datatables-simple-demo.js"></script>
	<script>
		$("#uploadImg").change(function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				//建立FileReader物件
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preImg").attr('src', e.target.result);
				}
				//以.readAsDataURL將上傳檔案轉換為base64字串
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script>
		$(function() {

			$(document)
					.ready(
							function() {
								$('#username')
										.keyup(
												function() {
													if (($('#username').val().length >= 5)
															&& ($('#username')
																	.val().length <= 20)) {
														$
																.ajax({
																	type : 'POST',
																	url : "checkUsername.controller",
																	dataType : 'text',
																	data : {
																		username : $(
																				'#username')
																				.val()
																	},
																	success : function(
																			response) {
																		if (response == '帳號重複') {
																			$(
																					'#response')
																					.css(
																							'color',
																							'red')
																					.html(
																							"<i class='fa-regular fa-circle-xmark'></i>"
																									+ response)
																			userAvailable = false;
																		} else {
																			$(
																					'#response')
																					.css(
																							'color',
																							'green')
																					.html(
																							"<i class='fa-regular fa-circle-check'></i>");
																			userAvailable = true;
																		}

																	},
																	error : function(
																			xhr,
																			ajaxOptions,
																			thrownError) {

																		alert(xhr.status
																				+ "\n"
																				+ thrownError);
																	}
																})
													} else {
														$('#response').empty()
													}
												})
							})

// 			$('#addUser')
// 					.on(
// 							'click',
// 							function() {
// 								if (userAvailable) {
// 									$('#addUserForm')
// 											.attr('action',
// 													'<c:url value='/t6_10_doAddUser.controller' />');
// 									$('#addUser').attr('type', 'submit');
// 								}

// 							})

			$('#onekey').on('click', function(e) {
				e.preventDefault()
				console.log("onekey")
				$('#username').val('Gary20230217')
				$('#password').val('Abc123456')
				$('#email').val('Gary20230217@gmail.com')
			})

		})
	</script>
</body>

</html>