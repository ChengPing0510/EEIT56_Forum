<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
  <jsp:include page="${pageContext.request.contextPath}/front_index/index-FrontToTopMVC.jsp" />

    <meta charset="utf-8">
    <title>活動頁面</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

<!-- 手寫 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!--     <script async -->
<!--       src="https://maps.googleapis.com/maps/api/js?key=&libraries=places&callback=initMap"></script> -->
    <style>
      /* Set the size of the div element that contains the map */
      #map {
        height: 500px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
</head>

<body>

<div class="container">
<hr>
<div>${act.activeDescription}</div> 

<a  id="signUpLink" href="../EventRegist/${act.activeID}">
             <button id="signUpButton" class="btn btn-success">
              我要報名</i>
             </button>
            </a><hr>
       <div id="map"></div>      
       </div> 
   
   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
axios.get("/EventRegist/checkSignUp/" + ${act.activeID})
.then(function (response) {
 let isSignUpAllowed = response.data;
    console.log(isSignUpAllowed)
  if (isSignUpAllowed) {
    document.getElementById("signUpButton").style.backgroundColor = "green";
    document.getElementById("signUpButton").disabled = false;
    document.getElementById("signUpLink").href = "/EventRegist/${act.activeID}";
  } else {
    document.getElementById("signUpButton").style.backgroundColor = "grey";
    document.getElementById("signUpButton").disabled = true;
    document.getElementById("signUpLink").removeAttribute("href");
  }
});



//map
function initMap() {
        var geocoder = new google.maps.Geocoder();
        var address = "${act.activeLocation}";
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
   
   
   
</body>

</html>
  <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />