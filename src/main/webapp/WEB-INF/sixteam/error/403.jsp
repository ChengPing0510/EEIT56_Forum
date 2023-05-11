<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta charset="UTF-8">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>神明便利店-403權限不足</title>
        <link rel="icon" type="image/png"
	href="front_index/img/logo.png" />
    
    <style>
		.relative {
		  position: relative;
		  top: 30%;
		  left: 5%;
		  background-color:gray ;
		  width: 350px;
		  font-size: 48px;
		  text-align:center;
		}
		a{
		color:black;
		}
		
		a:hover {
		  color:white;
		  text-description:none;
		}
		
    </style>
</head>
<!-- 		src="front_index/img/pizi.png" style="width:100%;height:100%"-->
<body> 
    <div style="background-image: url(front_index/img/pizi3.png); height: 100%; width: 100%; background-size: center ; background-repeat: no-repeat;"
>

        <div class="relative">
        <div>403您沒有權限</div>
	        <a href="/loginToIndex" style="text-decoration:none">
	        點此回首頁
	        </a>
        </div>
    </div>
</body>

</html>