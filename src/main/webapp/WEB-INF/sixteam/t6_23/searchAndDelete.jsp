<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <html>

        <head>
            <meta charset="UTF-8">
            <title>searchAndDelete</title>

            <link href="../background_index/css/index_backgroundOnly.css" rel="stylesheet" />

            <link href="../background_index/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

            <script type="text/javascript">
                var indexPage = 1,
                    name = '';

                $(function () {
                    load(indexPage, name);
                });

                function load(indexPage, name) {
                    $.ajax({
                        type: 'post',
                        url: '/t6_23/queryAndDeleteByPage.controller/' + indexPage,
                        data: { pname: name },
                        dataType: 'JSON',
                        success: (result) => {
                            $('#datatablesSimple').empty("");

                            if (result == null) {
                                $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
                            } else {
                                var table = $('#datatablesSimple');
                                table.append("<thead><tr><th width='80'>編號</th><th width='120'>暱稱</th><th width='80'>年齡</th><th width='80'>性別</th><th width='140'>地址</th><th width='150'>圖片</th><th width='60'>刪除</th></tr></thead>");

                                $.each(result, (i, n) => {
                                    var tr = "<tr><td align='center'><a href='/t6_23/showupdatepeopleform.controller/" + n.userid + "' />" + n.userid + "</a></td>" + "<td align='center'><a href='/t6_23/showupdatepeopleform.controller/" + n.userid + "' />" + n.name + "</a></td>" + "<td align='center'>" + n.age + "</td>" + "<td align='center'>" + n.sex + "</td>" + "<td align='center'>" + n.address + "</td>" + "<td align='center'>" + "<img height='100' width='80' src='/t6_23/toImages?id=" + n.userid + "' />" + "</td>" + "<td><button class='deleteData' value='" + n.userid
                                        + "' onclick='deletedata(" + n.userid + ")' '>刪除</button></td>" + "</tr>";

                                    table.append(tr);
                                });
                            }
                        }
                    });
                }

                function change(page) {
                    indexPage = page;
                    load(indexPage, name);
                }


                function deletedata(id) {
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
                                url: '/t6_23/removePeople2.controller/' + id, //放你controller的url 
                                method: "post",
                                dataType: "text",
                            })
                                .done(() => {
                                    location.reload();
                                    console.log("delete")
                                })
                                .fail((error) => {
                                    console.log(error)
                                })
                        }
                    })
                }


                // function deletedata(id) {
                //     if (confirm('你確定要刪除嗎?')) {
                //         // alert(id);
                //         tid = "'#" + id + "'";
                //         $.ajax({
                //             url: '/t6_23/removePeople2.controller/' + id,
                //             type: 'post',
                //             success: (result) => {
                //                 alert(result);
                //                 location.reload();
                //             },
                //             error: () => {
                //                 alert('刪除失敗');
                //             }
                //         });
                //     }
                // }

            </script>
        </head>

        <body class="sb-nav-fixed">
            <div>

                <jsp:include page="/background_index/index-backToMVC.jsp" />
            </div>
            <div id="layoutSidenav_content" style="margin-left: 250px">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4" style="text-align: center">會員資料清單</h1>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <!--                                 DataTable Example -->
                            </div>
                            <div class="card-body">
                                <table border='1' id="datatablesSimple">
                                </table>
                                <table id="showpage">
                                    <tr>
                                        <td>Total Pages:${totalPages}</td>
                                        <td colspan="3" align="right">
                                            <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                                                <button id="myPage" type="button" onclick="change(${i})"
                                                    value="${i}">${i}</button>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    <hr>
                                    <a href="<c:url value='/t6_23/test1.controller' />">回首頁</a>
                            </div>
                </main>
            </div>

            <!-- <script>
                $(function () {
                    $('.deleteData').click((e) => {
                        e.preventDefault();
                        let MyValue = $(this).val();  //抓按鈕的id 
                        console.log(MyValue);
                        Swal.fire({
                            title: '確定刪除?',
                            text: "刪除後將無法復原。",
                            icon: 'warning',
                            //icon:  "success", "error", "warning", "info" or "question" 5種圖示 
                            showCancelButton: true,
                            confirmButtonColor: '#f7d966',
                            cancelButtonColor: '#3d3b39',
                            cancelButtonText: '取消',
                            confirmButtonText: '刪除'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $.ajax({
                                    url: '/t6_23/removePeople2.controller/' + MyValue, //放你controller的url 
                                    method: "post",
                                    dataType: "text",

                                })
                                    .done(() => {
                                        location.reload();
                                        console.log("delete")
                                    })
                                    .fail((error) => {
                                        console.log(error)
                                    })
                            }
                        })
                    });
                });

            </script> -->





            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
        </body>

        </html>