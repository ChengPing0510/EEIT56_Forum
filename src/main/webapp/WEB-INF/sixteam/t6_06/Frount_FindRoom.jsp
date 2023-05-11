<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>神明便利店-房型搜尋</title>
    <link rel="icon" type="image/png" href="front_index/img/logo.png" />
    <link href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
    <link rel="stylesheet" href="/front_index/css/flaticon.css" />
    <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
    <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="/front_index/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>
    <link rel="stylesheet" href="https://js.arcgis.com/4.16/esri/themes/light/main.css" />
    <script src="https://js.arcgis.com/4.16/"></script>
</head>

<body>
    <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
    <div class="row g-5 align-items-center">
	<c:forEach var="trmp" items="${trmp}" >
		<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
					<a href="/frount_findorderroom/${trmp.roomId}" >
                    <img style="width: 100%; height: 100%;" id="preImg" src="/t6_6_img.controller/${trmp.roomId}" >
                    </a>
                    <div class="bg-light p-4">
                        <a class="d-block h5 lh-base mb-4" href="/frount_findorderroom/${trmp.roomId}">${trmp.templeName}</a>
                        <div class="text-muted border-top pt-4">
                        <p>地址 ： ${trmp.address}</p>
                        <p>房型 ： ${trmp.roomtype}人房</p>
                        <p>價格 ： ${trmp.cost}/晚</p>
<!--                             <small class="me-3"><i class="fa fa-user text-primary me-2"></i>Admin</small> -->
<!--                             <small class="me-3"><i class="fa fa-calendar text-primary me-2"></i>01 Jan, 2045</small> -->
                        </div>
                    </div>
         </div>
    </c:forEach>
    </div>
    <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
    <script type="text/javascript">
	</script>
</body>

</html>