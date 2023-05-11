<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
   <title>神明便利店-登入頁面</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!--===============================================================================================-->
   <link rel="icon" type="image/png" href="front_index/img/logo.png" />
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/bootstrap/css/bootstrap.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/fonts/iconic/css/material-design-iconic-font.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/animate/animate.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/css-hamburgers/hamburgers.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/animsition/css/animsition.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/select2/select2.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/vendor/daterangepicker/daterangepicker.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="login_v2/css/util.css">
   <link rel="stylesheet" type="text/css" href="login_v2/css/main.css">
   <!--===============================================================================================-->
  </head>
  <%-- <jsp:include page="/front_index/index-FrontToTopMVC.jsp" /> --%>

  <body>

   <div class="limiter">
    <div class="container-login100">
     <div class="wrap-login100">
      <form action="/login" method="post">
       <span class="login100-form-title p-b-26"> 登入頁面 </span> <span
        class="login100-form-title p-b-48"> <img class="logo-2" src="front_index/img/logo.png"
         alt="" />
       </span>
       <c:if test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}">
        <p>輸入的帳號或密碼錯誤</p>
       </c:if>

       <!--      <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c"> -->
       <div class="wrap-input100 validate-input">
        <input class="input100" type="text" name="username" id="username" required="required"> <span
         class="focus-input100" data-placeholder="帳號"></span>
       </div>

       <div class="wrap-input100 validate-input" data-validate="Enter password">
        <span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
        </span> <input class="input100" type="password" name="password" id="inputPassword" required="required">
        <span class="focus-input100" data-placeholder="密碼"></span>
       </div>
       
          <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
         <div class="login100-form-bgbtn"></div>
         <button class="login100-form-btn" id="onekeyUser" type="button">使用者一鍵登入</button>
        </div>
       </div>          
       <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
         <div class="login100-form-bgbtn"></div>
         <button class="login100-form-btn" id="onekeyAdmin" type="button">管理者一鍵登入</button>
        </div>
       </div>
        
        
        

       <div class="form-check mb-3 " style='margin:25px'>
        <input class="form-check-input" id="inputRememberPassword" type="checkbox"
         name="remember-me" /> <label class="form-check-label"
         for="inputRememberPassword">記住我(1hr)</label>
        <span style="float:right">
         <a class="small" href="/forgot.controller">忘記密碼?</a>
        </span>
       </div>
       <!--      <div -->
       <!--       class="d-flex align-items-center justify-content-between mt-4 mb-0"> -->
       <!--       <a class="small" href="/forgot.controller">忘記密碼?</a> -->
       <!--       <button class="btn btn-primary" type="submit" value="login">送出</button> -->
       <!--      </div> -->

       <div class="container-login100-form-btn">
        <div class="wrap-login100-form-btn">
         <div class="login100-form-bgbtn"></div>
         <button class="login100-form-btn" type="submit" value="login">登入</button>
        </div>
       </div>

       <div class="text-center p-t-115">
        <span class="txt1"> 還沒有帳號嗎? </span> <a class="txt2" href="/register.controller">
         前往註冊 </a>
       </div>
      </form>
     </div>
    </div>
   </div>


   <div id="dropDownSelect1"></div>

   <!--===============================================================================================-->
   <script src="login_v2/vendor/jquery/jquery-3.2.1.min.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/vendor/animsition/js/animsition.min.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/vendor/bootstrap/js/popper.js"></script>
   <script src="login_v2/vendor/bootstrap/js/bootstrap.min.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/vendor/select2/select2.min.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/vendor/daterangepicker/moment.min.js"></script>
   <script src="login_v2/vendor/daterangepicker/daterangepicker.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/vendor/countdowntime/countdowntime.js"></script>
   <!--===============================================================================================-->
   <script src="login_v2/js/main.js"></script>

<script> 
    $(function () {   
   
  $('#onekeyUser').on('click', function(){
    console.log("user")
    $('#username').val('Marilyn239')
    $('#inputPassword').val('Abc123456')
   })
   
   $('#onekeyAdmin').on('click', function(){
    console.log("Admin")
    $('#username').val('Aspasia')
    $('#inputPassword').val('Abc123456')
   })

     
    })

</script>
  </body>

  </html>