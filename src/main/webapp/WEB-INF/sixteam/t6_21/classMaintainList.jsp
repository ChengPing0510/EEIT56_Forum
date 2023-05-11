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
<link href="../background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="../background_index/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

</head>
<style>
.txt {
	width: 200px;
	border: solid 1px #ccc;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}
</style>
<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">

		<main>
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">後臺管理系統</li>
						<li class="breadcrumb-item">課程購物車</li>
						<li class="breadcrumb-item active" aria-current="page">課程商品管理</li>
					</ol>
				</nav>
			</div>
		</div>
		<br />
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">課程總覽</h1>
				<button class="btn btn-outline-secondary addclass">新增課程</button>
				<div class="dropdown" style="margin-left: 1025px">
					<button class="btn dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						style="border: 1px solid #002347">請選擇匯出檔案類型</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item"
							href="/classexportCsv.controller">CSV</a></li>
						<li><a class="dropdown-item"
							href="/classexportJson.controller">JSON</a></li>
					</ul>
				</div>
				<ol class="breadcrumb mb-4">
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>課程編號</th>
									<th>課程名稱</th>
									<th>課程老師</th>
									<th>課程價錢</th>
									<th>課程圖片</th>
									<th>老師照片</th>
									<th>課程分類</th>
									<th>課程地址</th>
									<th>課程日期</th>
									<th>人數上限</th>
									<th>報名人數</th>
									<th>課程資訊</th>
									<th>請確認</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bean" items="${classList}">
									<tr>
										<td>${bean.classId}</td>
										<td>${bean.className}</td>
										<td>${bean.classTeacherName}</td>
										<td>${bean.classPrice}</td>
										<td><img height='100' width='80'
											src="t6_21images1.controller/${bean.classId}"></td>
										<!-- 										<td>${bean.classPictureName}</td> -->
										<td><img height='100' width='80'
											src="t6_21imagesclassteacher.controller/${bean.classId}"></td>
										<!-- 										<td>${bean.classTeacherPictureName}</td> -->
										<td>${bean.classType}</td>
										<td>${bean.classAddress}</td>
										<td>${bean.classDate}</td>
										<td>${bean.classPeople}</td>
										<td>${bean.classApplicant}</td>
										<td><div class="txt">${bean.classInformation}</div></td>
										<td>
											<div style="display: inline">
												<!-- 						<input type="button" class="deleteThisAccount" id="${bean.classId}" value="刪除" /> -->


												<a href="t6_21preupdateClass.controller/${bean.classId}">
													<button class="btn btn-success">
														<i class="fas fa-pen-square"></i>
													</button>
												</a>

												<button id="${bean.classId}"
													class="btn btn-danger deleteThisAccount">
													<i class="fas fa-trash-alt"></i>
												</button>
											</div>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<div></div>
					</div>
				</div>

			</div>
		</main>
	</div>

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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script>
        $(function(){
            $('.deleteThisAccount').click(function(){
			 // 上面那個input標籤的ID屬性
//                   var classId = ('#classId').val(),
                let MyValue=$(this).attr("id");
			 	console.log(MyValue);
                Swal.fire({
                  title: '確定刪除課程?',
                  text: "刪除後將無法復原。",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 5種圖示
                  showCancelButton: true,
                  confirmButtonColor: '#007500',
                  cancelButtonColor: '#d33',
                  cancelButtonText: '取消',
                  confirmButtonText: '刪除'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                         url:'t6_21deleteClass.controller/'+MyValue,
                          method:"get",
                          dataType:"text",
			//這邊的"id"是給controller的變數名
                          data: {"classId":MyValue},
                        })
                            .done(function () {
                                console.log("delete")
                                Swal.fire(
										'刪除成功!',
										'',
										'success',
                                ).then((result)=>{
                                	location.reload();
                                	});
                             })
                             .fail(function(error) {
                                 console.log(error)
                             })
                    }
                  })
              })
        });
        
        $(function(){
            $('.addclass').click(function(){
                $.ajax({
                    url:'t6_21insertClass.controller',
                     method:"get",
                     dataType:"text",
		//這邊的"id"是給controller的變數名
                     data: {},
						success: function (response) {
							console.log("Success!");
							window.location.href = "/t6_21insertClass.controller"
							},
						error: function (error) {
							console.log("Error!");
						}

                   })

            	
            })
        });
     </script>
</body>
</html>