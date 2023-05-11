<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<script src="https://kit.fontawesome.com/e136b47e13.js" crossorigin="anonymous"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>神明便利店-後臺管理系統</title>
    <link href="../background_index/css/index_backgroundOnly.css" rel="stylesheet" />
    <link href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../background_index/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/e136b47e13.js" crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
</head>

<body class="sb-nav-fixed">
	<div id="layoutSidenav">

		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>
            <div id="layoutSidenav_content" style="margin-left: 250px">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">訂單後台資料</h1>
                        <ol class="breadcrumb mb-4">
<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                             <li class="breadcrumb-item active">Tables</li> -->
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form name="ContralTempleRoomOrderData" enctype="multipart/form-data" action=" <c:url value=''/>" method="POST">
                        <table id="datatablesSimpleone" class="datatablesSimpleone">
                            <thead>
                                <tr>
									<th>訂單編號</th>
									<th>訂用者</th>
									<th>房間編號</th>
									<th>寺廟名稱</th>
					  				<th>入住日期</th>
									<th>退房日期</th>
									<th>金額</th>
									<th>是否被使用者刪除</th>
									<th>新增筆數</th>
									<th></th>
								</tr>
                            </thead>
                            <tbody>
                                <tr>
                                   <td><input type="text" name="insorderId" id="insorderId" style="width: 60px; height: 25px; "></td>
                                   <td><input type="text" name="insuserId" id="insuserId" style="width: 80px; height: 25px;" /></td>
                                   <td><input type="text" name="insroomId" id="insroomId" style="width: 80px; height: 25px;" /></td>
                                   <td><input type="text" name="instempleName" id="instempleName" style="width: 60px; height: 25px;" /></td>
                                   <td><input type="date" name="inscheckindate" id="inscheckindate" required style="width: 100px; height: 25px;"/></td>
                                   <td><input type="date" name="inscheckoutdate" id="inscheckoutdate" required style="width: 100px; height: 25px;"/></td>
                                   <td><input type="text" name="inscost" id="inscost" style="width: 80px; height: 25px;" /></td>
                                   <td><select name="indeletebymember" id="indeletebymember" required style="width: 75px; height: 25px;">
                                            <option value="未刪除">未刪除</option>
                                            <option value="已刪除">已刪除</option>
                                        </select></td>
                                   <td><input type="number" id="insertnum" name="insertnum" min="1" max="100"></td>
                                   <td>
                                   		<button class="btn btn-success" type="submit" value="新增" id="insert" formaction="insertTempleRoomOrderDataAction">新增<i class="fas fa-pen-square"></i></button>
                                   		<button class="btn btn-success" type="submit" value="更改" id="updatetrue" formaction="updateTempleRoomOrderDataAction">更改<i class="fas fa-pen-square"></i></button>
                                   </td>
                                 </tr>
                            </tbody>
                        </table>
                        </form>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                訂單資料
                            </div>
                            <div class="card-body">
                            <form name="ContralRoomData" action=" <c:url value=''/>" method="POST" enctype="multipart/form-data">
                                <table id="datatablesSimple">
                                    <thead>
									<tr>
										<th>訂單編號</th>
										<th>訂用者</th>
										<th>房間編號</th>
										<th>寺廟名稱</th>
					  					<th>入住日期</th>
										<th>退房日期</th>
										<th>金額</th>
										<th>是否被使用者刪除</th>
										<th></th>
									</tr>
								</thead>
                                   <tbody>
									<c:forEach var="trob" items="${trob}">
										<tr>
											<td>${trob.orderId}<input type="hidden" name="orderId"
												value="${trob.orderId}"></td>
											<td>${trob.userId}<input type="hidden" name="userId"
												value="${trob.roomId}"></td>
											<td>${trob.roomId}<input type="hidden" name="roomId"
												value="${trob.userId}"></td>
											<td>${trob.templeName}<input type="hidden"
												name="templeName" value="${trob.templeName}"></td>
											<td>${trob.checkindate}<input type="hidden"
												name="checkindate" value="${trob.checkindate}"></td>
											<td>${trob.checkoutdate}<input type="hidden"
												name="checkoutdate" value="${trob.checkoutdate}"></td>
											<td>${trob.cost}<input type="hidden" name="cost" id="cost"
												value="${trob.cost}"></td>
											<td>${trob.deletebymember}<input type="hidden" name="deletebymember" id="deletebymember"
												value="${trob.deletebymember}"></td>
											<td>
												<div>
													 <button class="btn btn-danger delbtn deleteThisOrder" id="${trob.orderId}">刪除<i class="fas fa-trash-alt"></i></button>
                                    			   	 <button class="btn btn-success updateThisOrder" id="${trob.orderId}">修改<i class="fas fa-pen-square"></i></button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
                                </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
     <script src="../background_index/js/datatables-simple-demo.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../background_index/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../background_index/assets/demo/chart-area-demo.js"></script>
    <script src="../background_index/assets/demo/chart-bar-demo.js"></script>
    <script>
    
    //datatable基本設定
	 $(document).ready(function () {
		    $('#datatablesSimpleone').DataTable({
		    	"searching": false, // 預設為true 搜尋功能，若要開啟不用特別設定
		        "paging": false, // 預設為true 分頁功能，若要開啟不用特別設定
		        "ordering": false, // 預設為true 排序功能，若要開啟不用特別設定
		        "info": false, //預設為true　是否要顯示"目前有 x  筆資料"
		        "scrollCollapse": true // 預設為false 是否開始滾軸功能控制X、Y軸
		    });
		    
		});
	 
		//重複確認
		  $(document).ready(function () {
			  $('body').on('click','.deleteThisOrder',function(e) {
				  e.preventDefault();
				  let MyValue=$(this).attr("id");
				  console.log(MyValue);
		          Swal.fire({
		            title: '確定刪除?',
		            text: "刪除後將無法復原。",
		            icon: 'warning',
		            //icon:  "success", "error", "warning", "info" or "question" 5種圖示
		            showCancelButton: true,
		            confirmButtonColor: '#007500',
		            cancelButtonColor: '#d33',
		            cancelButtonText: '取消',
		            confirmButtonText: '刪除'
		          }).then((result) => {
		              if (result.isConfirmed) {
		                  $.ajax({
		                   url:'templeRoomOrderDeleteAction/'+MyValue,
		                    method:"get",
		                    dataType:"text",
				//這邊的"id"是給controller的變數名
		                  })
		                      .done(function () {
		                          location.reload();
		                          console.log("delete")
		                       })
		                       .fail(function(error) {
		                           console.log(error)
		                       })
		              }
		            })
		    });
		});
		  
		  //按按鈕讓新增按鈕消失更改按鈕出現,並且拉到頁面最上層
	  $(document).ready(function () {
	  $('body').on('click','.updateThisOrder',function(e) {
		  e.preventDefault();
		  
		  var MyRow = $(this).closest('tr');
          var MyData = [];
          MyRow.find('td').each(function() {
            MyData.push($(this).text());
          });
          console.log(MyData);
          
          var templeid = MyData[0];
          templeid.replace(' \n                                    ', '')
          
          console.log(MyData[1]);
		  let MyValue=$(this).attr("id");  //抓id
		  $("#updatetrue").show();   //更新按鈕出現
          $("#insert").hide();		 //新增按鈕消失
          $("#insorderId").show();	 //id的input元素出現
          $("#insertnumber").hide();
          $("#insertnum").hide();
          window.scrollTo(0, 0);   //跳到網頁最上面
          $("#insorderId").val(templeid).prop("readonly", true);   //把id塞進input標籤內,限制唯讀
          $("#insuserId").val(MyData[1]);
          $("#insroomId").val(MyData[2]);
          $("#instempleName").val(MyData[3]);
          $("#inscheckindate").val(MyData[4]);
          $("#inscheckoutdate").val(MyData[5]);
          $("#inscost").val(MyData[6]);
    });
});
		  $("#updatetrue").hide();
		  $("#insorderId").hide();
		  
		
	</script>
	</body>
</html>