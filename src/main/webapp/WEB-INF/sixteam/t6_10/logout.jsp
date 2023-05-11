<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
<h3>Logout</h3>
<form action="/logout" method="post">
   <table>
      <tr>
         <td>Logout:</td>
         <td><button type="submit" value="logout">Logout</button></td>
      </tr>
   </table>
</form>
<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
</body>
</html>