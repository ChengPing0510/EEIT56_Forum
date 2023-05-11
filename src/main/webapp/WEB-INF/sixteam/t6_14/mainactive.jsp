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
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>

<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<style>
.btn-container {
	position: absolute;
	right: 0;
	top: -60;
}

 .scrollable { 
  	height: 100px;  
 	width: 100px;
 	overflow: hidden;
}
td a {
    text-decoration:none;
}
</style>
</head>



<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>
		
	
	<div id="layoutSidenav_content" class="app" style="margin-left: 250px">
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
					<div class="btn-container">
						<a href="<c:url value='/actives/addView'/>">
							<button class="btn btn-secondary">+新增活動</button>
						</a>
					</div>
					<div class="card-body">

						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>活動編號</th>
									<th>活動名稱</th>
									<th>活動圖片</th>
									<th>活動描述</th>
									<th>開始時間</th>
									<th>結束時間</th>
									<th>活動地點</th>
									<th>主辦單位</th>
									<th>人數上限</th>
									<th>報名人數</th>
									<th>價格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="act" items="${actives}">
									<tr>
										<td>${act.activeID}</td>
										<td>${act.activeName}<a  href="/actives/toenroll/${act.activeID}">
													<button type="button" class="btn-sm btn-outline-dark">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</a></td>
										<td><img height='100' width='80'
											src="actives/toImg/${act.activeID}"></td>
										<%-- 					<td>${act.activeDescription}</td> --%>
										<td >
											<div class="scrollable">${act.activeDescription}</div>
										</td>

										<td>${act.activeStartDate}</td>
										<td>${act.activeEndDate}</td>
										<td>${act.activeLocation}</td>
										<td>${act.activeHost}</td>
										<td>${act.activeParticipantNum}</td>
										<td>${act.activeSignUpNumber}</td>
										<td>${act.activePrice}</td>
										<td>
											<div style="display: inline">

												<a href="/actives/updateView/${act.activeID}">
													<button class="btn btn-success">
														<i class="fas fa-pen-square"></i>
													</button>
												</a>
												<%-- <a href="actives/del/${act.activeID}"> --%>
												<button id="${act.activeID}" class="btn btn-danger delbtn">
													<i class="fas fa-trash-alt" ></i>
												</button>
												<!-- </a>		 -->
											</div></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
<a href="<c:url value='/actives/exportCsv'/>">
			<button class="btn btn-secondary">匯出csv</button>
		</a>

					</div>
				</div>
				</div>
		</main>
	</div>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		

	<script type="text/javascript">
	$(function(){
		$(".delbtn").click(function(){
			let MyId=$(this).attr("id")
		  Swal.fire({
		    title: '你確定嗎?',
		    text: "刪除後就回不去囉!",
		    icon: 'warning',
		    showCancelButton: true,
		    confirmButtonColor: '#007500',
		    cancelButtonColor: '#d33',
		    confirmButtonText: '就是要刪'
		  }).then((result) => {
		    if (result.isConfirmed) {
		      axios.delete('actives/' + MyId)
		      .then(response => {
		        Swal.fire(
		          '活動已刪除!',
		          '別怪我沒有提醒你嘿',
		          'success'
		        )
		        setTimeout(() => {
		        	location.reload();
		        	}, 2000);
		      })
		      .catch(error => {
		        Swal.fire(
		          'Error!',
		          'There was an error while deleting the item.',
		          'error'
		        )
		      });
		    }
		  })
	    }
		)})
// 用vue框架改寫
//  var vue = new Vue({
//     el: '.app'
//     data(){
// return{
// 	actives:{}
// }
//         }    ,created() {
//             console.log('component created')
//         },
//     methods: {
//       deleteConfirm(id) {
//         Swal.fire({
//           title: '你確定嗎?',
//           text: "刪除後就回不去囉!",
//           icon: 'warning',
//           showCancelButton: true,
//           confirmButtonColor: '#3085d6',
//           cancelButtonColor: '#d33',
//           confirmButtonText: '就是要刪'
//         }).then((result) => {
//           if (result.isConfirmed) {
//             axios.delete('actives/' + id)
//             .then(response => {
//               Swal.fire(
//                 '活動已刪除!',
//                 '別怪我沒有提醒你嘿',
//                 'success'
//               )
//               setTimeout(() => {
//                 location.reload();
//               }, 2000);
//             })
//             .catch(error => {
//               Swal.fire(
//                 'Error!',
//                 'There was an error while deleting the item.',
//                 'error'
//               )
//             });
//           }
//         })
//       },
// //       取得所有
// 	getAll(){
    		
//     		}
//     }
//   })


</script>



</body>
</html>
