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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        .form-style {
            border: 1px solid #ced4da !important;
            border-radius: 0.25rem !important;
        }
    </style>
        </head>

<body class="sb-nav-fixed">

	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">訂單總覽</h1>
				<ol class="breadcrumb mb-4">
					<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
					<!--                             <li class="breadcrumb-item active">Tables</li> -->
				</ol>
				<!--                         <div class="card mb-4"> -->
				<!--                             <div class="card-body"> -->
				<!--                                 DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
				<!--                                 <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
				<!--                                 . -->
				<!--                             </div> -->
				<!--                         </div> -->
				
				
				
				
				    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
				
				
				
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>

					
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>訂單編號</th>
									<th>會員編號</th>
									<th>會員帳號</th>
									<th>電子信箱</th>
									<th>連絡電話</th>
									<th>下單日期</th>
									<th>訂單總額</th>
									<th>請確認</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="bean" items="${orderList}">
									<tr>
										<td><a href="#" class="open-modal">${bean.orderNumber}</a></td>
										<td>${bean.memberId}</td>
										<td>${bean.memberAccount}</td>
										<td>${bean.memberEmail}</td>
										<td>${bean.memberPhone}</td>
										<td>${bean.orderDate}</td>
										<td>${bean.orderPrice}</td>
										
										<td>
											<div style="display: inline">
						<input type="button" class="deleteThisAccount" id="${bean.orderNumber}" value="刪除" />
						
												<a href="t6_21preupdateClass.controller/${bean.orderNumber}">
													<input type="button" value="修改">
													</a>
													
													<a href="#" class="open-modal">Open Modal</a>
											</div></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<div>
<!-- 							<form action="t6_21insertClass.controller"> -->
<!-- 								<input type="submit" value="新增紀錄"> -->
<!-- 							</form> -->
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>

						    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
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
<script>
$(document).ready(function () {
    $('.open-modal').click(function () {
        $('#myModal').modal('show');
    });
});
     </script>
</body>
</html>