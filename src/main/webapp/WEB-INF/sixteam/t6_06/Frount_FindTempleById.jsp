<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<meta charset="UTF-8">
	<title>神明便利店-寺廟詳細資訊</title>
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
	<style>
		#map {
			height: 400px;
			width: 100%;
		}

		form {
			margin: 0 auto;
			width: 600px;
		}
	</style>
</head>

<body>
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
	<div class="row g-5 align-items-center">
		<c:forEach var="tmp" items="${tmp}">
			<div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
				<div id="map">
					<script>
						var y = ${ tmp.WGS84Y }
						var x = ${ tmp.WGS84X }
						function initMap() {
							const map = new google.maps.Map(document.getElementById("map"), {
								zoom: 17,
								center: { lat: y, lng: x },
							});
							const image =
								"https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png";
							const beachMarker = new google.maps.Marker({
								position: { lat: y, lng: x },
								map,
								icon: image,
							});
						}

					</script>
				</div>
			</div>
			<div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
				<h1 class="display-5 mb-4">${tmp.templeName}</h1>
				<p><i class="fa fa-check text-primary me-3"></i>主祀神祇 ： ${tmp.deitiesName}</p>
				<p><i class="fa fa-check text-primary me-3"></i>寺廟地址 ： ${tmp.address}</p>
				<p><i class="fa fa-check text-primary me-3"></i>宗教類型 ： ${tmp.sect}</p>
				<p><i class="fa fa-check text-primary me-3"></i>電話 ： ${tmp.phone}</p>
				<a class="btn btn-primary rounded-pill py-3 px-5 mt-3"
					href="<c:url value='/frount_findroombytempleid/${tmp.templeId}'/>">查看香客住宿</a>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACIrHrrD1dvVinMSU9LoK3lWfXhav9S0k&callback=initMap">
		</script>
</body>

</html>