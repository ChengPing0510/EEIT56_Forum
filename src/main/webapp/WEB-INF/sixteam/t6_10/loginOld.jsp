<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login WEB-INF_t6_10</title>
</head>
<body>
<c:if test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}">
  <p>輸入的帳號或密碼錯誤</p>
</c:if>

<form action="/login/page" method="post">
   <table>
     <tr>
       <td>UserName:</td>
       <td><input type="text" name="username" required="required"/></td>
     </tr>
     <tr>
       <td>Password:</td>
       <td><input type="password" name="password" required="required"/></td>
     </tr>
     <tr>
       <td colspan="2">
          <input type="checkbox" name="remember-me">RememberMe
       </td>
     </tr>
     <tr>
       <td colspan="2"><button type="submit" value="login">Login</button></td>
     </tr>
   </table>
</form>
</body>
</html>