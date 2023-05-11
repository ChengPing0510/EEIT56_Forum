<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>

   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="">
   <meta name="author" content="">

   <title>神明便利店-忘記密碼</title>
   <link rel="icon" type="image/png" href="front_index/img/logo.png" />

   <!-- Custom fonts for this template-->
   <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">


   <link href="background_index/css/styles.css" rel="stylesheet" />

   <!-- Custom styles for this template-->

   <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  </head>

  <body class="bg-gradient-primary">
   <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

     <div class="col-xl-10 col-lg-12 col-md-9">

      <div class="card o-hidden border-0 shadow-lg my-5">
       <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
         <div class="col-lg-6 d-none d-lg-block bg-password-image">
          <img src="front_index/img/logoextend.png" alt=""
           style=" width:100%;height:100%">
         </div>
         <div class="col-lg-6">
          <div class="p-5">
           <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">忘記密碼?</h1>
            <p class="mb-4">請輸入帳號及信箱</p>
           </div>
           <form class="user" action="findaccountnumber.controller" method="POST"
            id="pwdresetForm">
            <div class="form-group">
             <input type="text" class="form-control form-control-user"
              name="username" id="username" aria-describedby="emailHelp"
              placeholder="輸入帳號">
            </div>
            <div class="form-group">
             <input type="email" class="form-control form-control-user"
              name="email" id="email" aria-describedby="emailHelp"
              placeholder="Email">
            </div>

            <a href="" class="btn btn-success btn-user btn-block" id="sendmessage">
             寄送驗證信
            </a>
            <br>
            <div class="form-group">
             <input type="text" class="form-control form-control-user"
              id="verifycode" aria-describedby="emailHelp" placeholder="驗證碼">
            </div>

            <a href="" class="btn btn-primary btn-user btn-block"
             id="resetpassword">
             重設密碼
            </a>
           </form>
           <hr>
           <div class="row">
            <div class="text-right col-lg-3">
   
             <a class="small" href="/register.controller">創建帳號</a>
            </div>
            <div class="text-left col-lg-3">
             <a class="small" href="/login">已有帳號</a>
            </div>
            
                 <div class="container-login100-form-btn col-lg-6">
      <div class="wrap-login100-form-btn">
       <div class="login100-form-bgbtn"></div>
       <button class="login100-form-btn" id="onekey" type="button">一鍵輸入</button>
      </div>
     </div>
            
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>

     </div>

    </div>

   </div>

   <!-- Bootstrap core JavaScript-->

   <!-- Core plugin JavaScript-->

   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <!-- Custom scripts for all pages-->

   <script type="text/javascript">

    $(function () {
     var checkVo = '';
     $('#sendmessage').on('click', function (e) {
      e.preventDefault();
      $.ajax({
       url: "checkAccountEmail.controller",
       dataType: 'text',
       type: 'POST',
       async: false,
       data: {
        username: $("#username").val(),
        email: $("#email").val()
       },
       error: function (xhr) {
        Swal.fire({
         icon: 'error',
         title: '錯誤',
         text: '帳號信箱輸入錯誤，或是您尚未註冊。'
         //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
        })
       },
       success: function (response) {
        if (response.trim() == "OK") {
         $.ajax({
          url: "sendmailforverify.controller",
          dataType: 'text',
          type: 'POST',
          //async:false,
          data: {
           email: $("#email").val()
          },
          error: function (xhr) {
           alert('Ajax request 發生錯誤');
          },
          success: function (response) {
           checkVo = response;
           Swal.fire({
            icon: 'success',
            title: '驗證信已寄出'
           })
          }
         }) //ajax end
        } else { //if(response.trim() == "OK")的else
         Swal.fire({
          icon: 'error',
          title: '錯誤',
          text: '帳號信箱輸入錯誤，或是您尚未註冊。'
          //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
         })
        }
       }
      })
     })

     $('#resetpassword').on('click', function (e) {
      e.preventDefault();
      var verifycode = $('#verifycode').val();
      console.log(verifycode + '  ' + checkVo)
      if ((verifycode == checkVo) && (checkVo != '')) {
       $('#pwdresetForm').submit();
      } else {
       Swal.fire({
        icon: 'error',
        title: '錯誤',
        text: '驗證碼錯誤，請重新輸入!'
        //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
       })
      }
     })

  
       
      $('#onekey').on('click', function(){
        console.log("user")
        $('#username').val('gary2023')
        $('#email').val('teemin20230202@gmail.com')
       })


     
     

    })

   </script>
  </body>

  </html>