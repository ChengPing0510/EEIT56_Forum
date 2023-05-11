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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

</head>

<body class="sb-nav-fixed">
    <div id="layoutSidenav">

        <jsp:include page="/background_index/index-backToMVC.jsp" />
    </div>
    <div id="layoutSidenav_content" style="margin-left: 250px">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">香客大樓後台資料</h1>
                <ol class="breadcrumb mb-4">
<!--                     <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                     <li class="breadcrumb-item active">Tables</li> -->
                </ol>
                <div class="card mb-4">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                入住率
                            </div>
                            <div class="card-body"><canvas id="myChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form name="ContralTempleData" enctype="multipart/form-data" action=" <c:url value=''/>"
                            method="POST">
                            <table id="datatablesSimpleone" class="datatablesSimpleone">
                                <thead>
                                    <tr>
                                        <th>房間編號</th>
                                        <th>寺廟編號</th>
                                        <th>寺廟名稱</th>
                                        <th>地址</th>
                                        <th>幾人房</th>
                                        <th>房型照片</th>
                                        <th>金額</th>
                                        <th>是否為空房</th>
                                        <th id=insertnumber>新增筆數</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="tmp" items="${tmp}">
                                    <tr>
                                        <td><input type="text" name="inroomId" id="inroomId" 
                                                style="width: 60px; height: 25px; "></td>
                                        <td><input type="text" name="intempleId" id="intempleId" value="${tmp.templeId}"
                                                style="width: 80px; height: 25px;" /></td>
                                        <td><input type="text" name="intempleName" id="intempleName" value="${tmp.templeName}"
                                                style="width: 60px; height: 25px;" /></td>
                                        <td><input type="text" name="inaddress" id="inaddress" value="${tmp.address}" /></td>
                                        <td><input type="text" name="inroomtype" id="inroomtype" required
                                                style="width: 40px; height: 25px;" /></td>
                                        <td><img id="output1" height='100' width='80' style="display: none"><input
                                                id="inroompicture" type='file' onchange="openFile1(event)"
                                                name='inroompicture' accept='.png,.jpg' />
                                        </td>
                                        <td><input type="text" name="incost" id="incost"
                                                style="width: 80px; height: 25px;" /></td>
                                        <td><select name="infullorempty" id="infullorempty" required
                                                style="width: 75px; height: 25px;">
                                                <option value="1">是</option>
                                                <option value="0">否</option>
                                            </select>
                                        </td>
                                        <td> <input type="number" id="tentacles" name="tentacles" min="1" max="100">
                                        </td>
                                        <td>
                                            <button class="btn btn-success" type="submit" value="新增" id="insert"
                                                formaction="insertTempleRoomDataAction">新增<i
                                                    class="fas fa-pen-square"></i></button>
                                            <button class="btn btn-success" type="submit" value="更改" id="updatetrue"
                                                formaction="updateTempleRoomDataAction">更改<i
                                                    class="fas fa-pen-square"></i></button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        香客大樓
                    </div>
                    <div class="card-body">
                        <form name="ContralRoomData" action=" <c:url value=''/>" method="POST"
                            enctype="multipart/form-data">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>房間編號</th>
                                        <th>寺廟編號</th>
                                        <th>寺廟名稱</th>
                                        <th>地址</th>
                                        <th>幾人房</th>
                                        <th>房型照片</th>
                                        <th>金額</th>
                                        <th>是否為空房</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="trmp" items="${trmp}">
                                        <tr>
                                            <td><a href="#" id="${trmp.roomId}" class="chartjs">${trmp.roomId}</a><input
                                                    type="hidden" name="roomId" id="${trmp.roomId}"
                                                    value="${trmp.roomId}"></td>
                                            <td>${trmp.fk_templeId}<input type="hidden" name="fk_templeId"
                                                    value="${trmp.fk_templeId}"></td>
                                            <td>${trmp.templeName}<input type="hidden" name="templeName"
                                                    value="${trmp.templeName}"></td>
                                            <td>${trmp.address}<input type="hidden" name="address"
                                                    value="${trmp.address}"></td>
                                            <td>${trmp.roomtype}<input type="hidden" name="roomtype"
                                                    value="${trmp.roomtype}"></td>
                                            <td><img id="preImg" height='100' width='80'
                                                    src="t6_6_img.controller/${trmp.roomId}"><br /></td>
                                            <td>${trmp.cost}<input type="hidden" name="cost" id="cost"
                                                    value="${trmp.cost}"></td>
                                            <td id="fullorempty">${trmp.fullorempty}<input type="hidden"
                                                    name="fullorempty" id="fullorempty" value="${trmp.fullorempty}">
                                            </td>
                                            <td>
                                                <div>
                                                    <button class="btn btn-danger delbtn deleteThisRoom"
                                                        id="${trmp.roomId}">刪除<i class="fas fa-trash-alt"></i></button>
                                                    <button class="btn btn-success updateThisRoom"
                                                        id="${trmp.roomId}">修改<i class="fas fa-pen-square"></i></button>
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

        //圖片預覽
        function openFile1(event) {
            var input = event.target; //取得上傳檔案
            var reader = new FileReader(); //建立FileReader物件
            reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串
            reader.onload = function () { //FileReader取得上傳檔案後執行以下內容
                var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
                $('#output1').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
            };
        }

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


        $("#inroompicture").change(function () {
            readURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                //建立FileReader物件
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#preImg").attr('src', e.target.result);
                }
                //以.readAsDataURL將上傳檔案轉換為base64字串
                reader.readAsDataURL(input.files[0]);deleteThisRoom
            };
        };
        //重複確認
        $(document).ready(function () {
        	$('body').on('click','.deleteThisRoom',function(e) {
                e.preventDefault();
                let MyValue = $(this).attr("id");
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
                            url: 'templeRoomDeleteAction/' + MyValue,
                            method: "post",
                            dataType: "text",
                            //這邊的"id"是給controller的變數名
                        })
                            .done(function () {
                                location.reload();
                                console.log("delete")
                            })
                            .fail(function (error) {
                                console.log(error)
                            })
                    }
                })
            });
        });

        //按按鈕讓新增按鈕消失更改按鈕出現,並且拉到頁面最上層
        $(document).ready(function () {
            $('body').on('click', '.updateThisRoom', function (e) {
                e.preventDefault();
				
                var MyRow = $(this).closest('tr');
                var MyData = [];
                MyRow.find('td').each(function () {
                    MyData.push($(this).text());
                });
                console.log(MyData);

                var templeid = MyData[0];
                templeid.replace(' \n                                    ', '')

                console.log(MyData[1]);
                let MyValue = $(this).attr("id");  //抓id
                $("#updatetrue").show();   //更新按鈕出現
                $("#insert").hide();		 //新增按鈕消失
                $("#inroomId").show();	 //id的input元素出現
                $("#insertnumber").hide();
                $("#tentacles").hide();
                window.scrollTo(0, 0);   //跳到網頁最上面
                $("#inroomId").val(templeid).prop("readonly", true);   //把id塞進input標籤內,限制唯讀
                $("#intempleId").val(MyData[1]);
                $("#intempleName").val(MyData[2]);
                $("#inaddress").val(MyData[3]);
                $("#inroomtype").val(MyData[4]);
                //           $("#inroompicture").val(MyData[5]);   因為是ajax傳值所以接不到圖片
                $("#incost").val(MyData[6]);
                $("#infullorempty").val(MyData[7]);
            });
        });
        $("#updatetrue").hide();
        $("#inroomId").hide();

        // 這個是顯示是否為空房		  
        
        $('#datatablesSimple tbody tr').each(function () {
    var fullorempty = $(this).find('#fullorempty input[type="hidden"]').val();
    if (fullorempty == 0) {
        $(this).find('#fullorempty').text('滿');
    } else if (fullorempty == 1) {
        $(this).find('#fullorempty').text('空');
    }
});
        
        
        //chart.js
        $(document).ready(function () {
            $('.chartjs').click(function (e) {
                e.preventDefault();
                let MyValue = $(this).attr("id");
                window.scrollTo(0, 0);
                $.ajax({
                    type: "get",
                    url: "templeRoomOrderDate/" + MyValue,
                    success: function (data) {
                        myArray = data;
                        var ctx = document.getElementById('myChart');
                        var myChart = new Chart(ctx, {
                            type: 'bar', //圖表類型
                            data: {
                                //標題
                                labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                                datasets: [{
                                    label: '', //標籤
                                    //先抓roomid然後查訂單每個月入住天數
                                    data: myArray, //資料
                                    //圖表背景色
                                    backgroundColor: [
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(54, 162, 235, 0.2)'
                                    ],
                                    //圖表外框線色
                                    borderColor: [
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(54, 162, 235, 1)'
                                    ],
                                    //外框線寬度
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true,
                                            responsive: true //符合響應式
                                        }
                                    }]
                                }
                            }
                        });
                    }
                });
            });
        });


    </script>
</body>

</html>