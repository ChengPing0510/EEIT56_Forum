<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<%-- <jsp:include page="/front_index/index-FrontToTopMVC.jsp" /> --%>

<meta charset="utf-8">
<link rel="icon" href="/front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- 手寫 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style>
.card img {
	height: 208px;
	transition: transform 0.3s ease-in-out;
}

.card img:hover {
	transform: scale(1.1);
}

h6      a {
	font-size: 17px;
	color: black;
}

h6 a:hover {
	color: red;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.css">

</head>

<body>
<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

	<hr>
	<div id="carousel-example-1z"
		class="container carousel slide carousel-fade" data-bs-ride="carousel">
		<!--Indicators-->
		<ol class="carousel-indicators">
			<li data-bs-target="#carousel-example-1z" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carousel-example-1z" data-bs-slide-to="1"></li>
			<li data-bs-target="#carousel-example-1z" data-bs-slide-to="2"></li>
		</ol>
		<!--/.Indicators-->
		<!--Slides-->
		<div class="carousel-inner" role="listbox">
			<!--First slide-->
			<div class="carousel-item active">
				<a href="actdesview/${top3[0].activeID}" target="_blank"> <img
					class="d-block w-100" width="500px" height="500px"
					src="../actives/toImg/${top3[0].activeID}" alt="First slide" />
				</a>
			</div>
			<!--/First slide-->
			<!--Second slide-->
			<div class="carousel-item">
				<a href="actdesview/${top3[1].activeID}" target="_blank"> <img
					class="d-block w-100" width="500px" height="500px"
					src="../actives/toImg/${top3[1].activeID}" alt="Second slide" />
				</a>
			</div>
			<!--/Second slide-->
			<!--Third slide-->
			<div class="carousel-item">
				<a href="actdesview/${top3[2].activeID}" target="_blank"> <img
					class="d-block w-100" width="500px" height="500px"
					src="../actives/toImg/${top3[2].activeID}" alt="Third slide" />
				</a>
			</div>
			<!--/Third slide-->
		</div>
		<!--/.Slides-->
		<!--Controls-->
		<a class="carousel-control-prev" href="#carousel-example-1z"
			role="button" data-bs-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carousel-example-1z"
			role="button" data-bs-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
		<!--/.Controls-->
	</div>
	<!--/.Carousel Wrapper-->

	<!-- Blog Start -->
	<div class="container">
		<div class="text-center my-5">
			<h1>近期活動</h1>
			<hr>
		</div>

		<!-- Row Start -->
		<div class="row">
			<c:forEach var="act" items="${actives}" varStatus="status">

				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="card mb-5 shadow-sm animated fadeInUp wow"
						data-wow-delay="${(status.index % 3) * 0.2 + 0.1}s">
						<a href="actdesview/${act.activeID}"> <img
							src="../actives/toImg/${act.activeID}" class="img-fluid "
							width="500" height="500">
						</a>
						<div class="card-body">
							<div class="card-title">

								<h6>
									<a href="actdesview/${act.activeID}">${act.activeName}</a>
								</h6>
							</div>
							<div class="card-text">
								<p>
									開始時間:${act.activeStartDate}-${act.activeEndDate}<br>活動地點:${act.activeLocation}<br>可報名人數:${act.activeParticipantNum}
								</p>
							</div>
							<div>
								<button id="${act.activeID}" class="btn btn-outline-primary rounded-0 float-left favoriteBtn">									
								</button>
								<a href="actdesview/${act.activeID}"
									class="btn btn-outline-primary rounded-0 float-end">活動資訊</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- Row End -->
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/8bf3b6e829.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		new WOW().init();

		//測試
		



		//確認是否加入最愛
		const buttons = document.querySelectorAll('.favoriteBtn');
buttons.forEach(button => {
  const activeID = button.id;
  axios.get('/favorite/check/' + activeID)
    .then(response => {
      if (response.data) {
        // 如果已加入最愛，將按鈕文字改為「已加入」
        button.innerHTML = '<i class=\"fa fa-heart\" aria-hidden=\"true\"></i>已加入最愛';
      } else {
        // 如果未加入最愛，將按鈕文字改為「加入最愛」
        button.innerHTML = '<i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i>加入最愛';
      }
    })
    .catch(error => {
      console.log(error);
    });


//按下最愛按鈕
  button.addEventListener("click", () => {	  
    if (button.innerHTML === "<i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i>加入最愛") {
      // 發送新增請求
      axios.post('/favorite/add/' + activeID)
        .then(response => {
        	 if(response.data==="no"){
       		  alert("請先登入");
       		  return;
       	  }
          button.innerHTML = "<i class=\"fa fa-heart\" aria-hidden=\"true\"></i>已加入最愛";
        })
        .catch(error => {
          console.log(error);
        });
    } else if (button.innerHTML === "<i class=\"fa fa-heart\" aria-hidden=\"true\"></i>已加入最愛") {
      // 發送刪除請求
      axios.delete('/favorite/del/' + activeID)
        .then(response => {
          button.innerHTML = "<i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i>加入最愛";
        })
        .catch(error => {
          console.log(error);
        });
    }
  });

  
});
		









		

	</script>


</body>

</html>
<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
