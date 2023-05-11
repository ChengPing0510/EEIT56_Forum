<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>後臺管理系統</title>
<!--         <link href="../background_index/css/index_backgroundOnly.css" rel="stylesheet" /> -->
        
<!--         <link href="../background_index/css/styles.css" rel="stylesheet" /> -->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
<!--    <script src="http://localhost:8080/background_index/js/sweetalert2.js"></script> -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!--    <script src="http://localhost:8080/background_index/js/jquery.js"></script> -->
<!-- 		<link rel="stylesheet" href="../background_index/css/sweetalert2.css"> -->
    </head>
    
    <body class="sb-nav-fixed">
    <div>
    	<jsp:include page="/background_index/index-backToMVC.jsp" /></div>
    
            <div id="layoutSidenav_content" style="margin-left: 250px">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4" style=" text-align:center">會員資料</h1>
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
				<th><span class="fa-solid fa-address-card"></span>會員編號</th>
                <th><span class="fa-solid fa-circle-user"></span>會員姓名</th>
          		<th><span class="fa-solid fa-key"></span>會員密碼</th>
                <th><span class="fa-solid fa-image"></span>會員圖片</th>
                <th><span class="fa-solid fa-pen-to-square"></span>操作</th>
			</tr>
		</thead>
		<tbody>
            <c:forEach var="bean" items="${accounts}">
                <tr>
                    <td>${bean.id}</td>
                    <td>${bean.account}</td>
                    <td><input type="password" name="password"  style="border:0px;background:rgba(0, 0, 0, 0);text-align:center;"  value="${bean.password}" disabled="disabled"></td>
                    <td><img height='100' width='80' src="<c:url value='/t6_10_img.controller/${bean.id}' />">
                    </td>
                    
                        <td>
                        <form action="t6_10_toUpdateAccount.controller/${bean.id}"><a class="fa-solid fa-screwdriver-wrench" ></a><input type="submit" value="修改"></form>&nbsp
<%--                     <form action="t6_10_delAccount.controller/${bean.id}"><a class="fa-solid fa-trash-can" ></a> --%>
<!--                     <input  type="submit" value="刪除"></form> -->
					<a class="fa-solid fa-trash-can" ></a>
                    <input type="button" value="刪除" id="${bean.id}"
                                            class="deleteThisAccount" />
                    	 </td>
                </tr>
            </c:forEach>
		</tbody>
                                </table>
					<div>
					<form action="t6_10_toAddAccount.controller/${accounts.get(accounts.size()-1).getId()+1}"><input type="submit" value="新增"><a class="fa-solid fa-user-plus" ></a></form>
					<form><input type="button" value="回首頁" class="goIndex"><a class="fa-solid fa-house" ></a></form>
					</div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
          
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--         <script src="../background_index/js/scripts.js"></script> -->
<!--         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
<!--         <script src="../background_index/assets/demo/chart-area-demo.js"></script> -->
<!--         <script src="../background_index/assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<!--         <script src="../background_index/js/datatables-simple-demo.js"></script> -->
        
        <script>
        $(function(){
        	

            $('.goIndex').click(function(){
                Swal.fire({
                  title: '你確定要離開這個頁面嗎?',
                  text: "即將前往首頁。",
                  icon: 'question',
                  //icon:  "success", "error", "warning", "info" or "question" 5種選項
                  showCancelButton: true,
                  confirmButtonColor: '#B87171',
                  cancelButtonColor: '#3d3b39',
                  cancelButtonText: '取消',
                  confirmButtonText: '前往後台首頁'
                }).then((result) => {
                    if (result.isConfirmed) {
                    	window.location.href = "/index-background.jsp";
                    }//if
                  })//then

              })//click end
        	
            $('.deleteThisAccount').click(function(){
                let MyId=$(this).attr("id");
                Swal.fire({
                  title: '你確定要刪除這個帳號嗎?',
                  text: "刪除後將無法復原。",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 5種選項
                  showCancelButton: true,
                  confirmButtonColor: '#B87070',
                  cancelButtonColor: '#3d3b39',
                  cancelButtonText: '取消',
                  confirmButtonText: '忍痛刪除'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                         url:'t6_10_delAccount.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":MyId},
                        })
                            .done(function () {
                                location.reload();
                                console.log("delete")
                             })//done
                             .fail(function(error) {
                                 console.log(error)
                             })//fail end
                    }//if
                  })//then

              })//click end
        });
        //function end
     </script>
        
    </body>
</html>