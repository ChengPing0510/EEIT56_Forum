<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
form {
	margin: 0 auto;
	width: 400px;
}
</style>
</head>
<body>
<div align="RIGHT">
<a  href="http://localhost:8080/SecondServlet/index.html">回主頁</a>
<!--  ShowAllPeopleServlet  -->
<a href='<c:url value="/t6_23/controller/showPeople.do" />'>查詢資料(後臺用)</a>
<a href='<c:url value="/t6_23/controller/InsertPeopleForm.controller" />' >新增資料</a>
</div>
	<form action="<c:url value='/userSelectControllersafe' />" method="POST">
		<table >
			<tr>
				<th colspan='2' align="center">
					<h1>搜尋</h1>
				</th>
				<th></th>
			</tr>
			<tr>
				<td width='160' align="RIGHT">輸入帳號或暱稱：</td>
				<td width='100' align="LEFT"><input type="text" name="userId"
					size="10"></td>
					<td colspan="2" align="LEFT"><input type="submit" value="搜尋">
				</td>
			</tr>
			
		</table>


	</form>
	
	

</body>
</html>