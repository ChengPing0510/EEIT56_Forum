<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>

<meta charset="utf-8">
<title>報名頁面</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- 手寫 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
      body {
  background-color: hsl(0, 0%, 94%)
}
    </style>
</head>
<body>
<jsp:include
	page="${pageContext.request.contextPath}/front_index/index-FrontToTopMVC.jsp" />

		    <div class="">
        <div class="container">

            <!-- Card header -->
            <div class="card-header py-4 px-5 bg-light border-0">
              <h4 class="mb-0 fw-bold">完成報名!</h4>
            </div>
      
            <!-- Card body -->
            <div class="card-body px-5">
              <!-- Account section -->
              <div class="row gx-xl-5">
                <div class="col-md-4">
                  <h2>${active.activeName}</h2>
                  <p class="text-muted">開始時間:${active.activeStartDate}-${active.activeEndDate}<br>活動地點:${act.activeLocation}</p>
                <img height='100' width='80'
											src="/actives/toImg/${active.activeID}">
                </div>
      
                <div class="col-md-8">
          
                  </div>
                </div>
              </div>
      </div>
      
              
      
            <!-- Card footer -->
            <div class="card-footer text-end py-4 px-5 bg-light border-0">
            <a href="/actives/actview">
              <button  type="submit" class="btn btn-primary btn-rounded">
                返回活動頁面
              </button>
              </a>
            </div>
        </div>
      </div>

<jsp:include page="${pageContext.request.contextPath}/front_index/index-FrontToButtonMVC.jsp" />
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
		$(".complete").click(function(e){
			  e.preventDefault();

			document.querySelector('input[name="name"]').value = "${username}"
		    document.querySelector('input[name="email"]').value = "teemin20230202@gmail.com";
		    document.querySelector('input[name="phone"]').value = "666-666";
			});
		})
		</script>
		
		
</body>
</html>
