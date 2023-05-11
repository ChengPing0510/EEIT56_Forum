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
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="background_index/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>

<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>


	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">神明便利店後台管理系統</h1>
				<ol class="breadcrumb mb-4">
					<!--                             <li class="breadcrumb-item active">Dashboard</li> -->
				</ol>
				<div class="row" style="margin-bottom: 20px">
					<div class="col-xl-3 col-md-6">
						<div class="card card-stats card-success">
							<div class="card-body"
								style="float: right; width: 295px; height: 159px">
								<div class="row" style="margin-top: 30px">
									<div class="col-5">
										<img src='/front_index/img/545.PNG' height='75px' width='80px'>
									</div>
									<div class="col-7 d-flex align-items-center">
										<div class="numbers" style="font-size: 24px">
											<p class="card-category">總營業額</p>
											<h4 class="card-title totalprice" style="text-align: center;">${totalprice}</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-3 col-md-6">
						<div class="card card-stats card-success">
							<div class="card-body"
								style="float: right; width: 295px; height: 159px">
								<div class="row" style="margin-top: 30px">
									<div class="col-5">
										<img src='/front_index/img/856.PNG' height='75px' width='80px'>
									</div>
									<div class="col-7 d-flex align-items-center">
										<div class="numbers" style="font-size: 24px">
											<p class="card-category">總訂單量</p>
											<h4 class="card-title totalorder" style="text-align: center;">${countclass}</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card card-stats card-success">
							<div class="card-body"
								style="float: right; width: 295px; height: 159px">
								<div class="row" style="margin-top: 30px">
									<div class="col-5">
										<img src='/front_index/img/665.PNG' height='65px' width='85px'>
									</div>
									<div class="col-7 d-flex align-items-center">
										<div class="numbers" style="font-size: 24px;">
											<p class="card-category">總會員數</p>
											<h4 class="card-title totalorder" style="text-align: center;">${count}</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card card-stats card-success">
							<div class="card-body"
								style="float: right; width: 295px; height: 159px">
								<div class="row" style="margin-top: 30px">
									<div class="col-5">
										<img src='/front_index/img/775.PNG' height='75px' width='90px'>
									</div>
									<div class="col-7 d-flex align-items-center">
										<div class="numbers" style="font-size: 24px">
											<p class="card-category">論壇文章數</p>
											<h4 class="card-title totalorder" style="text-align: center;">5</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header" style="font-size: 24px">
								<i class="fas fa-chart-area me-1"></i> 會員成長人數
							</div>
							<div class="card-body">
								<canvas id="Chart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header" style="font-size: 24px">
								<i class="fas fa-chart-area me-1"></i>月份營業額統計
							</div>
							<div class="card-body">
								<canvas id="myChart" width="100%" height="40"
									value="${totalprice}"></canvas>
							</div>
						</div>
					</div>
				</div>
<!-- 				<div class="card mb-4"> -->
<!-- 					<div class="card-header"> -->
<!-- 						<i class="fas fa-table me-1"></i> DataTable Example -->
<!-- 					</div> -->
<!-- 					<div class="card-body"> -->
<!-- 						<table id="datatablesSimple"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th>Name</th> -->
<!-- 									<th>Position</th> -->
<!-- 									<th>Office</th> -->
<!-- 									<th>Age</th> -->
<!-- 									<th>Start date</th> -->
<!-- 									<th>Salary</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tfoot> -->
<!-- 								<tr> -->
<!-- 									<th>Name</th> -->
<!-- 									<th>Position</th> -->
<!-- 									<th>Office</th> -->
<!-- 									<th>Age</th> -->
<!-- 									<th>Start date</th> -->
<!-- 									<th>Salary</th> -->
<!-- 								</tr> -->
<!-- 							</tfoot> -->
<!-- 							<tbody> -->
<!-- 								<tr> -->
<!-- 									<td>Tiger Nixon</td> -->
<!-- 									<td>System Architect</td> -->
<!-- 									<td>Edinburgh</td> -->
<!-- 									<td>61</td> -->
<!-- 									<td>2011/04/25</td> -->
<!-- 									<td>$320,800</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>Garrett Winters</td> -->
<!-- 									<td>Accountant</td> -->
<!-- 									<td>Tokyo</td> -->
<!-- 									<td>63</td> -->
<!-- 									<td>2011/07/25</td> -->
<!-- 									<td>$170,750</td> -->
<!-- 								</tr> -->

<!-- 							</tbody> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</main>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="background_index/assets/demo/chart-area-demo.js"></script>
	<script src="background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="background_index/js/datatables-simple-demo.js"></script>
	<script>
		var ctx = document.getElementById("Chart");
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "Feb 1", "Feb 2", "Feb 3", "Feb 4", "Feb 5",
						"Feb 6", "Feb 7", "Feb 8", "Feb 9", "Feb 10", "Feb 11",
						"Feb 12", "Feb 13", "Feb 14" ],
				datasets : [ {
					label : "當日註冊人數",
					lineTension : 0.3,
					backgroundColor : "rgba(30,144,255,0.4)",
					borderColor : "rgba(2,117,216,1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(2,117,216,1)",
					pointBorderColor : "rgba(30,144,255,0.9)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(2,117,216,1)",
					pointHitRadius : 50,
					pointBorderWidth : 2,
					data : [ 10, 3, 3, 2, 6, 0, 6, 6, 13, 0, 5, 2, 0, 3 ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max : 20,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
		
		var value = parseInt($("#myChart").attr("value"));
		console.log(value);
		var ctx1 = document.getElementById('myChart');
		var myChart = new Chart(ctx1, {
			type : 'bar',
			data : {
				labels : [ 'Feb', 'Mar', 'Apr', 'May' ],
				datasets : [ {
					backgroundColor : [ 
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
							],
					borderColor : [ 
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
						'rgba(250, 128, 114, 0.5)',
							],
					borderWidth : 1,
					label : '銷售業績',
					data : [ value ]
				} ]
			}
		});
	</script>
</body>
</html>