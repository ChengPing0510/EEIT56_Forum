<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>神明便利店-顯示所有寺廟資料</title>
<link rel="icon" type="image/png" href="front_index/img/logo.png" />
<link href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
<link rel="stylesheet" href="/front_index/css/flaticon.css" />
<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
<link rel="stylesheet"
    href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
    href="/front_index/vendors/nice-select/css/nice-select.css" />
<link rel="stylesheet" href="/front_index/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<body>
    <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
			<div class="container-fluid px-4">
                <div class="card mb-4">
                    <div class="card-body">
                    <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        顯示所有寺廟資料
                    </div>
                </div>
                        <table id="datatablesSimpleone" class="datatablesSimpleone">
                            <thead>
                                <tr>
                                    <th>寺廟名稱</th>
                                    <th>主祀神</th>
                                    <th>行政區</th>
                                    <th>地址</th>
                                    <th>教別</th>
                                    <th>電話</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <c:forEach var="tmp" items="${tmp}">
                                <tr>
                                    <td><a href="<c:url value='/frount_findtemplebyid/${tmp.templeId}'/>">${tmp.templeName}<input type="hidden" name="templeName"
                                            value="${tmp.templeName}"></a></td>
                                    <td>${tmp.deitiesName}<input type="hidden" name="deitiesName"
                                            value="${tmp.deitiesName}"></td>
                                    <td>${tmp.administrative}<input type="hidden" name="administrative"
                                            value="${tmp.administrative}"></td>
                                    <td>${tmp.address}<input type="hidden" name="address" value="${tmp.address}"></td>
                                    <td>${tmp.sect}<input type="hidden" name="sect" value="${tmp.sect}"></td>
                                    <td>${tmp.phone}<input type="hidden" name="phone" value="${tmp.phone}"></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
            </div>
	<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
	<script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
	$(document).ready( function () {
	    $('.datatablesSimpleone').DataTable();
	} );
	</script>
</body>
</html>