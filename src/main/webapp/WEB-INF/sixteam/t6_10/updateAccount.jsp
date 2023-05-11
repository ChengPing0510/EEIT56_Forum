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
    <title>修改帳號資訊頁面</title>
    <link href="../background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="../background_index/css/styles.css" rel="stylesheet" />
    
    <script src="https://kit.fontawesome.com/89b068a769.js" crossorigin="anonymous"></script>
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

		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>
<!-- ================'/t6_10_doUpdateAccount.controller'========= -->
<form id="form1" name="form1" method="post"
		action='<c:url value='/t6_10_doAddAccount.controller' />' enctype="multipart/form-data">
    		<div id="layoutSidenav_content" style="margin-left: 250px">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4" style="text-align: center"><span class="fa-solid fa-users"></span>修改帳號</h1>
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
                <th style="display:flex"><span class="fa-solid fa-address-card"></span>會員編號</th>
                <th><span class="fa-solid fa-circle-user"></span>會員帳號</th>
          		<th><span class="fa-solid fa-key"></span>會員密碼</th>
                <th><span class="fa-solid fa-image"></span>會員圖片</th>
                <th><span class="fa-solid fa-pen-to-square"></span>修改會員資料</th>
            </tr>
        </thead>
        <tbody>
                <tr >
                	
                    <td><input type='text' name='id' readonly="readonly" value="${account.id}"/></td>
                    <td><input type='text' name='account' value="${account.account}"/></td>
                    <td><input type="password" name="password"  style="border:0px;background:rgba(0, 0, 0, 0);text-align:center;"  value="${account.password}" required></td>
               
                    <td>
											<img id="preImg" height='100' width='80' 
											src="<c:url value='/t6_10_img.controller/${account.id}' />"><input id="uploadImg" type='file' name='photo' accept='.png,.jpg'/></td>
				<td><button type="submit" value="upload" class="insert">修改	</button></td>
                </tr>
        </tbody>
        
        
    </table>
    
						</div>
					</div>
				</div>
			</main>
		</div>
    
    </form>
    
    
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
		$("#uploadImg").change(function(){
	     readURL(this);
	   	});
		
		function readURL(input){
			  if(input.files && input.files[0]){
				//建立FileReader物件
			    var reader = new FileReader();
			    reader.onload = function (e) {
			       $("#preImg").attr('src', e.target.result);
			    }
			  //以.readAsDataURL將上傳檔案轉換為base64字串
			    reader.readAsDataURL(input.files[0]);
			  }
			}
	</script>
</body>

</html>