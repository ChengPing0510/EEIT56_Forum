<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <style>
                #search {
                    margin: 0 auto;
                    width: 400px;
                }

                h1 {
                    text-align: center;
                }
            </style>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script type="text/javascript">
                var indexPage = 1,
                    name = '';

                $(function () {
                    load(indexPage, name);
                });

                function load(indexPage, name) {
                    console.log("----------------------->" + name);
                    $.ajax({
                        type: 'post',
                        url: '/t6_23/userselect.controller/' + indexPage,
                        data: { pname: name },
                        dataType: 'JSON',
                        //contentType: 'application/json',
                        success: (result) => {
                            $('#showpeople').empty("");

                            if (result == null) {
                                $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
                            } else {
                                var table = $('#showpeople');
                                table.append("<tr><th width='80'>編號</th><th width='120'>暱稱</th><th width='80'>年齡</th>"
                                    + "<th width='80'>性別</th><th width='140'>地址</th><th width='150'>圖片</th></tr>");

                                $.each(result, (i, n) => {
                                    var tr = "<tr><td align='center'><a href='/t6_23/showpeople.controller?id=" + n.userid + "' />" + n.userid + "</a></td>"
                                        + "<td align='center'><a href='/t6_23/showpeople.controller?id=" + n.userid + "' />" + n.name + "</a></td>"
                                        + "<td align='center'>" + n.age + "</td>" + "<td align='center'>" + n.sex + "</td>"
                                        + "<td align='center'>" + n.address + "</td>"
                                        + "<td align='center'>" + "<img height='100' width='80' src='/t6_23/toImages?id=" + n.userid + "' />" + "</td>"
                                        + "</tr>";

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

                function searchname(name) {
                    name = $('#name').val();
                    console.log(name);
                    // name = pname;
                    load(indexPage, name);
                }


            </script>
            <link href="../background_index/css/index_backgroundOnly.css" rel="stylesheet" />

            <link href="../background_index/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <div>

                <jsp:include page="/background_index/index-backToMVC.jsp" />
            </div>
            <div align="RIGHT">
                <a href="http://localhost:8080/SecondServlet/index.html">回主頁</a>
                <!--  ShowAllPeopleServlet  -->
                <a href='<c:url value="/t6_23/showallpeople2.do" />'>查詢資料(後臺用)</a>
                <a href='<c:url value="/t6_23/insertPeopleForm.controller" />'>新增資料</a>
            </div>
            <dive>
                <h1>搜尋</h1>
                <table id="search">
                    <tr>
                        <th colspan='2' align="center">

                        </th>
                        <th></th>
                    </tr>
                    <tr>
                        <td width='160' align="RIGHT">輸入暱稱：</td>
                        <td width='100' align="LEFT"><input type="text" name="name" size="10" id="name"></td>
                        <td colspan="2" align="LEFT">
                            <button type="button" value="send" onclick="searchname(name)">搜尋</button>
                        </td>
                    </tr>
                </table>

                </div>
                <hr>
                <div align='center'>
                    <table border="1" id="showpeople"></table>
                    <table id="showpage">
                        <tr>
                            <td>Total Pages:${totalPages} Total Elements: ${totalElements}</td>
                            <td colspan="3" align="right">Previous
                                <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                                    <button id="myPage" type="button" onclick="change(${i})" value="${i}">${i}</button>
                                </c:forEach>Next
                            </td>
                        </tr>
                    </table>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="../background_index/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="../background_index/assets/demo/chart-area-demo.js"></script>
                <script src="../background_index/assets/demo/chart-bar-demo.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
                <script src="../background_index/js/datatables-simple-demo.js"></script>
        </body>

        </html>