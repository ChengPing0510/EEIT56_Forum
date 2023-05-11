
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
<link
	href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/background_index/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- ck -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/ck/css/ck.css" />
</head>

<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>



	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">活動總覽</h1>
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
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>
					<div class="card-body">
						<form action="<c:url value='/actives/update'/>" method="post"
							enctype="multipart/form-data">
							
							 <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">活動編號</label>
    <div class="col-sm-10">
<input type="text" name="id" value="${act.activeID}"
											readonly />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動名稱</label>
    <div class="col-sm-10">
<input type="text" name="name"
											value="${act.activeName}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動圖片</label>
    <div class="col-sm-10">
<img id="preImg" height='100' width='80'
											src="<c:url value='/actives/toImg/${act.activeID}' />">

											<input id='uplodeImg' type='file' accept='.png,.jpg'
											name='img' required="required">    </div>
  </div>
  
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動開始時間</label>
    <div class="col-sm-10">
<input type="date" name="start"
											value="${act.activeStartDate}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動結束時間</label>
    <div class="col-sm-10">
<input type="date" name="end"
											value="${act.activeEndDate}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動地點</label>
    <div class="col-sm-10">
<input type="text" name="location"
											value="${act.activeLocation}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動主辦單位</label>
    <div class="col-sm-10">
<input type="text" name="host"
											value="${act.activeHost}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">人數上限</label>
    <div class="col-sm-10">
<input type="text" name="num" required="required"
											value="${act.activeParticipantNum}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">報名人數</label>
    <div class="col-sm-10">
<input type="text" name="signUpNum" required="required"
											value="${act.activeSignUpNumber}" />    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動價格</label>
    <div class="col-sm-10">
<input type="text" name="price" required="required"
											value="${act.activePrice}" />    </div>
  </div>
							<div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">活動描述</label>
    <div class="col-sm-10">
<textarea id="editor" cols="20" rows="10" name="description"
												required="required">${act.activeDescription}</textarea>    </div>
  </div>
  <div>
  <button type="submit" class="btn btn-success">
												確認<i class="fa-solid fa-circle-check"></i>
											</button>
  </div>
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
			
						</form>
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
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>
<!-- CK -->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/ck/js/ck.js"></script>
	<!-- 預覽圖片 -->
	<script type="text/javascript">
		$("#uplodeImg").change(function() {
			var reader = new FileReader();
			reader.onload = function() {
				$("#preImg").attr("src", reader.result);
			}
			reader.readAsDataURL(this.files[0]);
		});
		
		
	</script>
</body>
</html>