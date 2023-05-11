<%@page import="sixteam.t6_21.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<link rel="stylesheet" href="../front_index/css/bootstrap.css" />
<link rel="stylesheet" href="../front_index/css/flaticon.css" />
<link rel="stylesheet" href="../front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="../front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="../front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet" href="../front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style type="text/css">
.or {
	font-size: 23px;
}

.title {
	font-size: 23px;
}
</style>

</head>
<body>

	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

	<!--================ Start Course Details Area =================-->
	<section class="course_details_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 course_details_left">
					<div class="main_image">
						<img class="img-fluid" height='80' width='650'
							src="<c:url value='/t6_21images1.controller/${bean.classId}'/>"
							alt="">
					</div>
					<div class="content_wrapper">
						<h4 class="title" style="font-size: 30px">師資介紹</h4>
						<div class="content">
							<img class="img-fluid" height='100' width='200'
								src="/t6_21imagesclassteacher.controller/${bean.classId}">
						</div>


						<h4 class="title" style="font-size: 30px">課程資訊</h4>

						<div class="content">${bean.classInformation}</div>


					</div>
				</div>



				<div class="col-lg-4 right-contents">
					<ul>
						<li><a class="justify-content-between d-flex" href="#">
								<p class="or">授課老師:</p> <span class="or">${bean.classTeacherName}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p class="or">課程價錢:</p> <span class="or">$${bean.classPrice}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p class="or">課程人數:</p> <span class="or">${bean.classPeople}</span>
						</a></li>
						<li><a class="justify-content-between d-flex" href="#">
								<p class="or">課程時間:</p> <span class="or">${bean.classDate}</span>
						</a></li>


						<c:choose>
								<c:when test="${bean.classPeople gt bean.classApplicant}">
							<form action="<c:url value='/addToCart.controller'/>"
								method="post">
									<li><a class="justify-content-between d-flex">
											<p class="or">購買數量:</p> <span> 
											<input type="number"
												min="0" max="5" name="qty" id="qty" value="${qty}" required>
											<input type='hidden' name='classId' id="classId"
												value='${bean.classId}'>
										</span>
									</a></li>
									<input type="submit" id="addtocart"
										class="primary-btn2 text-uppercase enroll rounde333d-0 text-white addtocart or"
										value='加入購物車'>
							</form>
							</c:when>



							<c:otherwise>
							<li><a class="justify-content-between d-flex">
											<p class="or">購買數量:</p> <span> 
								<span style="color: red">目前課程報名已額滿</span>
								<input type="number" min="0" max="5" name="qty" id="qty"
									value="${qty}" readonly></span>
									</a></li>
									<input type="submit" id="addtocart"
										class="btn-secondary text-uppercase enroll  text-white"
										value='課程報名人數已滿' style="font-size:22px" disabled>
							</c:otherwise>
						</c:choose>

					</ul>

					<!-- 這些隱藏欄位都會送到後端 -->
					<!-- 					從這邊開始新增 -->
					<div>
						<div>
							<div>
								<h3 style="margin: 30px 25px">您可能會喜歡:</h3>
								<c:forEach var="typelist" items="${classtypelist}">
									<div style="margin: 30px 25px">
										<img src="/t6_21images1.controller/${typelist.classId}"
											height='200' width='300'>
									</div>

									<div style="margin: 30px 25px">
										<h3>
											<a href="/showClassDetail.controller/${typelist.classId}">${typelist.className}</a>
										</h3>
										<p>授課老師:${typelist.classTeacherName}</p>
										<p>開課時間:${typelist.classDate}</p>
									</div>

								</c:forEach>
							</div>
						</div>
					</div>




				</div>
				<!-- 				右邊購物車區域結束 -->
				<div id="app" class="container">
					<div class="row">
						<div class="col">
							<div id="map" value="${bean.classAddress}"
								class="embed-responsive embed-responsive-16by9"></div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!--================ End Course Details Area =================-->
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACIrHrrD1dvVinMSU9LoK3lWfXhav9S0k&callback=initMap">
		
	</script>
	<script>
        function initMap() {
            var geocoder = new google.maps.Geocoder();
            var address = $('#map').attr('value');
            let placeId;

            geocoder.geocode({ address: address }, function (results, status) {
                if (status === 'OK') {
                    placeId = results[0].place_id;
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    var myLatLng = { lat: latitude, lng: longitude };

                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 16,
                        center: myLatLng
                    });

                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        title: 'Hello World!'
                    });

                    const request = {
                        placeId: placeId,
                        fields: ['name', 'formatted_address', 'place_id', 'rating', 'reviews']
                    };

                    const service = new google.maps.places.PlacesService(map);
                    service.getDetails(request, callback);

                    function callback(place, status) {
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                            var infowindow = new google.maps.InfoWindow({
                                content: `
                            <h3>${place.name}</h3>
                    <p>地址：${place.formatted_address}</p>
                    <p>評分：${place.rating} / 5</p>
                    <p>評論：<a href="#">${place.reviews.length}</a></p>
                `
                            });

                            infowindow.open(map, marker);


                        } else {
                            console.error("Place details request was not successful for the following reason: " + status);
                        }
                    }
                } else {
                    console.error("Geocode was not successful for the following reason: " + status);
                }
            });
        }
    </script>
	<script type="text/javascript">
		//     $('#addtocart').on('click', function () {
		//         alert('hello');
		//         var qty = document.getElementById("qty").value;
		//         var classid = document.getElementById("classId").value;
		//         console.log(qty);
		//         console.log(classid);

		//         $.ajax({
		//             url: '/addToCart.controller',
		//             method: "post",
		//             dataType: "text",
		//             //這邊的"id"是給controller的變數名
		//             data: { "classId": classid, "qty": qty },
		//         }).done(function () {
		//             location.reload();
		//         }
		//         ).fail(function () {
		//             return;
		//         })
		//     }

		//     );

		//    $('#addtocart').on('click', function validateForm() {
		// 	 var qty = document.getElementById("qty").value
		// 	 console.log(qty)
		//        if(qty == ''){
		// //     	   alert('請輸入數量!')
		//     	   return false;
		//        }else if(qty == 0){
		//     	   alert('請輸入數量!')
		//     	   return false;
		//        }else{
		//     	   return true;
		//        }

		//     });

		//  $(document).ready(function(){
		//     $("#addtocart").click(function(){
		//         if($("#qty").val()==""){
		//             alert("你尚未填寫姓名");
		//             eval("document.form1['name'].focus()");       
		//         }else if($("#qty").val()= 0){
		//             alert("你尚未填寫姓名");
		//             eval("document.form1['name'].focus()");       
		//         }
		//     })
		//  })
	</script>

</body>
</html>