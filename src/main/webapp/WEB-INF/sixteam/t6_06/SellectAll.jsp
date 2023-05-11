<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
        <jsp:include page="/background_index/index-backToMVC.jsp" />
    </div>
    <div id="layoutSidenav_content" style="margin-left: 250px">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">寺廟後臺資料</h1>
                <div><a href="exportCsv" class="btn btn-success">匯出 <i class="fas fa-pen-square"></i></a></div>
                <ol class="breadcrumb mb-4">
                </ol>
                    <button id="myButton" class="btn btn-success">一鍵輸入<i class="fas fa-pen-square"></i></button>
                <div class="card mb-4">
                    <div class="card-body">
                    	<form name="ContralTempleData" action=" <c:url value=''/>" method="POST">
                        <table id="datatablesSimpleone" class="datatablesSimpleone">
                            <thead>
                                <tr>
                                    <th>編號</th>
                                    <th>寺廟名稱</th>
                                    <th>主祀神</th>
                                    <th>行政區</th>
                                    <th>地址</th>
                                    <th>教別</th>
                                    <th>電話</th>
                                    <th>X座標</th>
                                    <th>Y座標</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                    	<input type="text" name="intempleId" id="intempleId" style="width: 50px; height: 25px; ">
                                    </td>
                                    <td><input type="text" name="intempleName" id="intempleName" style="width: 80px; height: 25px;">
                                    </td>
                                    <td><input type="text" name="indeitiesName" id="indeitiesName" style="width: 100px; height: 25px;">
                                    </td>
                                    <td><select name="inadministrative" id="inadministrative" required style="width: 75px; height: 25px;">
                                            <option value="臺北市">臺北市</option>
                                            <option value="新北市">新北市</option>
                                            <option value="桃園市">桃園市</option>
                                            <option value="臺中市">臺中市</option>
                                            <option value="臺南市">臺南市</option>
                                            <option value="高雄市">高雄市</option>
                                            <option value="新竹縣">新竹縣</option>
                                            <option value="苗栗縣">苗栗縣</option>
                                            <option value="彰化縣">彰化縣</option>
                                            <option value="南投縣">南投縣</option>
                                            <option value="雲林縣">雲林縣</option>
                                            <option value="嘉義縣">嘉義縣</option>
                                            <option value="屏東縣">屏東縣</option>
                                            <option value="宜蘭縣">宜蘭縣</option>
                                            <option value="花蓮縣">花蓮縣</option>
                                            <option value="臺東縣">臺東縣</option>
                                            <option value="澎湖縣">澎湖縣</option>
                                            <option value="金門縣">金門縣</option>
                                            <option value="連江縣">連江縣</option>
                                            <option value="基隆市">基隆市</option>
                                            <option value="新竹市">新竹市</option>
                                            <option value="嘉義市">嘉義市</option>
                                        </select></td>
                                    <td><input type="text" name="inaddress" id="inaddress" style="width: 150px; height: 25px;"></td>
                                    <td><input type="text" name="insect" id="insect" style="width: 60px; height: 25px;"></td>
                                    <td><input type="text" name="inphone" id="inphone" style="width: 100px; height: 25px;"></td>
                                    <td><input type="text" name="inwGS84X" id="inwGS84X" style="width: 160px; height: 25px;"></td>
                                    <td><input type="text" name="inwGS84Y" id="inwGS84Y" style="width: 160px; height: 25px;"></td>
                                    <td>
                                    	<button class="btn btn-success" type="submit" value="新增" id="insert" formaction="insertTempleDataAction">新增<i class="fas fa-pen-square"></i></button>
                                   		<button class="btn btn-success" type="submit" value="更改" id="updatetrue" formaction="updateTempleDataAction">更改<i class="fas fa-pen-square"></i></button>
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
                        顯示所有寺廟資料
                    </div>
                    <div class="card-body">
                    <form name="ContralTempleData" action=" <c:url value=''/>" method="POST">
                        <table id="datatablesSimple" class="display">
                            <thead>
                                <tr>
                                    <th>編號</th>
                                    <th>寺廟名稱</th>
                                    <th>主祀神</th>
                                    <th>行政區</th>
                                    <th>地址</th>
                                    <th>教別</th>
                                    <th>電話</th>
                                    <th>X座標</th>
                                    <th>Y座標</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                    <c:forEach var="tmp" items="${tmp}">
                                <tr>
                                    <td><a href="<c:url value='/setDatatoroom/${tmp.templeId}'/>">${tmp.templeId}</a><input type="hidden" name="templeId" value="${tmp.templeId}"> 
                                    </td>
                                    <td>${tmp.templeName}<input type="hidden" name="templeName"
                                            value="${tmp.templeName}"></td>
                                    <td>${tmp.deitiesName}<input type="hidden" name="deitiesName"
                                            value="${tmp.deitiesName}"></td>
                                    <td>${tmp.administrative}<input type="hidden" name="administrative"
                                            value="${tmp.administrative}"></td>
                                    <td>${tmp.address}<input type="hidden" name="address" value="${tmp.address}"></td>
                                    <td>${tmp.sect}<input type="hidden" name="sect" value="${tmp.sect}"></td>
                                    <td>${tmp.phone}<input type="hidden" name="phone" value="${tmp.phone}"></td>
                                    <td>${tmp.WGS84X}<input type="hidden" name="wGS84X" value="${tmp.WGS84X}"></td>
                                    <td>${tmp.WGS84Y}<input type="hidden" name="wGS84Y" value="${tmp.WGS84Y}"></td>
                                    <td>
                                    	<div>
                                    		<button class="btn btn-danger delbtn deleteThisTemple" id="${tmp.templeId}">刪除<i class="fas fa-trash-alt"></i></button>
                                    		<button class="btn btn-success updateThisTemple" id="${tmp.templeId}">修改<i class="fas fa-pen-square"></i></button>
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
	

	
$(document).ready(function () {
    $('.datatablesSimpleone').DataTable({
    	"searching": false, // 預設為true 搜尋功能，若要開啟不用特別設定
        "paging": false, // 預設為true 分頁功能，若要開啟不用特別設定
        "ordering": false, // 預設為true 排序功能，若要開啟不用特別設定
        "info": false, //預設為true　是否要顯示"目前有 x  筆資料"
        "scrollCollapse": true // 預設為false 是否開始滾軸功能控制X、Y軸
    });
    
});
	
	
  //重複確認
  $(document).ready(function () {
	  $('body').on('click','.deleteThisTemple',function(e) {
		  e.preventDefault();
		  let MyValue=$(this).attr("id");  //抓按鈕的id
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
                   url:'templeDeleteActionfromall/'+MyValue,
                    method:"post",
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
  
  //按按鈕讓新增按鈕消失更改按鈕出現,並且拉到頁面最上層,將按鈕該行的資料帶入更改的input元素內
  $(document).ready(function () {
	  $('body').on('click','.updateThisTemple',function(e) {
		  e.preventDefault();
		  
		  var MyRow = $(this).closest('tr');
          var MyData = [];
          MyRow.find('td').each(function() {
            MyData.push($(this).text());
          });
          console.log(MyData);
          
          var templeid = MyData[0];
          templeid.replace(' \n                                    ', '')
          
          console.log(templeid);
          console.log(MyData[1]);
		  let MyValue=$(this).attr("id");  //抓id
		  console.log(MyValue);
		  $("#updatetrue").show();   //更新按鈕出現
          $("#insert").hide();		 //新增按鈕消失
          $("#intempleId").show();	 //id的input元素出現
          window.scrollTo(0, 0);   //跳到網頁最上面
          $("#intempleId").val(templeid).prop("readonly", true);   //把id塞進input標籤內,限制唯讀
          $("#intempleName").val(MyData[1]);
          $("#indeitiesName").val(MyData[2]);
          $("#inadministrative").val(MyData[3]);
          $("#inaddress").val(MyData[4]);
          $("#insect").val(MyData[5]);
          $("#inphone").val(MyData[6]);
          $("#inwGS84X").val(MyData[7]);
          $("#inwGS84Y").val(MyData[8]);
    });
});

  $("#updatetrue").hide();
  $("#intempleId").hide();
  
  const myButton = document.getElementById('myButton');

  myButton.addEventListener('click', function() {
	  $("#intempleName").val('鹿港天后宮');
      $("#indeitiesName").val('媽祖');
      $("#inadministrative").val('彰化縣');
      $("#inaddress").val('彰化縣鹿港鎮中山路430號');
      $("#insect").val('道教');
      $("#inphone").val('04-7779899');
      $("#inwGS84X").val('120.43220244505672');
      $("#inwGS84Y").val('24.059571596604783');
  });
</script>
    
    
   
</body>

</html>