<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Payment Result</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      // 向後端發送請求
      $.get("/orderConfirm.controller", function(data) {
        // 顯示綠界回傳的資料
        console.log(data);
      });
    });
  </script>
</head>
<body>
  <h1>Payment Result</h1>
</body>
</html>




