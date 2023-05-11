<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>神明便利店-會員住房訂單查詢</title>
<link rel="icon" type="image/png" href="front_index/img/logo.png" />
<link href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
<link rel="stylesheet" href="/front_index/css/flaticon.css" />
<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
<link rel="stylesheet"
    href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
    href="/front_index/vendors/nice-select/css/nice-select.css" />
<link rel="stylesheet" href="/front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/e136b47e13.js" crossorigin="anonymous"></script>
</head>
<body>

	<div style="position: relative"><jsp:include
			page="/front_index/index-FrontToTopMVC.jsp" /></div>

	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5 mx-auto">
				<table class="table table-bordered text-center mb-0">
					<thead class="bg-secondary" style="color: #fdc632">
						<tr>
							<th style="background-color: #002347">訂單編號</th>
							<th style="background-color: #002347">寺廟名稱</th>
							<th style="background-color: #002347">房型</th>
							<th style="background-color: #002347">入住日期</th>
							<th style="background-color: #002347">退房日期</th>
							<th style="background-color: #002347">單價</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="align-middle">


						<c:forEach var="trob" items="${trob}">
							<tr>
								<td class="align-middle orderId" id="orderId" >${trob.orderId}</td>

								<td class="align-middle oneprice">${trob.templeName}</td>

								<td class="align-middle roomId" id="roomId">${trob.roomId}</td>
								<td class="align-middle">${trob.checkindate}</td>
								<td class="align-middle">${trob.checkoutdate}</td>
								<td class="align-middle cost" id="amount">${trob.cost}</td>
								<td class="align-middle cost"><button class="deleteThisOrder" id="${trob.orderId}">刪除<i class="fas fa-trash-alt"></i></button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script type="text/javascript">
	$(document).ready(function () {
		  $('body').on('click','.deleteThisOrder',function(e) {
			  e.preventDefault();
			  let MyValue=$(this).attr("id");
			  console.log(MyValue);
	          Swal.fire({
	            title: '確定刪除?',
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
	                   url:'frount_orderroomdelete/'+MyValue,
	                    method:"post",
	                    dataType:"text",
			//這邊的"id"是給controller的變數名
	                  })
	                      .done(function () {
	                          location.reload();
	                          console.log("delete")
	                       })
	                       .fail(function(error) {
	                           console.log(error)
	                       })
	              }
	            })
	    });
	});
	</script>
</body>
</html>