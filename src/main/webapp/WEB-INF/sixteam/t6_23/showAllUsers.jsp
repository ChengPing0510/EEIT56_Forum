<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html>

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>會員系統-全部顯示</title>


            <link href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
                rel="stylesheet" />

            <link href="${pageContext.request.contextPath}/background_index/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <!--    icon -->
            <script src="https://kit.fontawesome.com/8bf3b6e829.js" crossorigin="anonymous"></script>

            <!-- 	測試sweetalert -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
            <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

        </head>

        <body class="sb-nav-fixed">
            <div>
                <jsp:include page="/background_index/index-backToMVC.jsp" />
            </div>

            <div id="layoutSidenav_content" style="margin-left: 250px">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4" style="text-align: center">會員資訊</h1>
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <!--                                 DataTable Example -->
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th><span class="fa-solid fa-address-card"></span>員工帳號</th>
                                            <th><span class="fa-solid fa-circle-user"></span>操作項目</th>
                                            <th><span class="fa-solid fa-key"></span>修改日期</th>
                                            <th><span class="fa-solid fa-image"></span>修改原因</th>
                                            <th><span class="fa-solid fa-pen-to-square"></span>變更帳戶</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="bean" items="${MataData}">
                                            <tr>
                                                <td>${bean.username}</td>
                                                <td>${bean.dowhat}</td>
                                                <td>${bean.dodate}</td>
                                                <td>${bean.text}</td>
                                                <td>${bean.accountname}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>




            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
        </body>

        </html>