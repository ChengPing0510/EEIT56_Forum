<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>神明便利店-註冊頁面</title>
    <link rel="icon" type="image/png"
 href="front_index/img/logo.png" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
 href="front_index/img/logo.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="login_v2/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login_v2/css/util.css">
<link rel="stylesheet" type="text/css" href="login_v2/css/main.css">
<!--===============================================================================================-->

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<%-- <jsp:include page="/front_index/index-FrontToTopMVC.jsp" /> --%>
<body>

 <div class="limiter">
  <div class="container-login100" style=width:100%>
   <div class="wrap-login100" style=width:55%>
    <form id="registForm" method="post" enctype="multipart/form-data" >
    <div class="row" > 
     <span class="col-lg-2">   
     </span>
     <span class="login100-form-title p-b-26 col-lg-8">   
     <img class="logo-2" src="front_index/img/logo.png" alt="" />註冊頁面
     </span>
     <span class="col-lg-2">   
     </span>
     
     <!--      <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c"> -->
     <div class="wrap-input100 validate-input col-lg-8">
      <input class="input100" type="text" id="username" name="username" required="required"> 
      <span class="focus-input100" data-placeholder="帳號"></span>
     </div>
     <div class="col-lg-4">
     <span id="response"></span>   
     </div>
     
     <div class="wrap-input100 validate-input col-lg-8"
      data-validate="Enter password">
      <span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
      </span> <input class="input100" type="password" id="inputPassword" name="password" required="required"> <span
       class="focus-input100" data-placeholder="密碼"></span>
     </div>
     <div class="col-lg-4">
     <span id="pwdCheck"></span>   
     </div>
     
     <div class="wrap-input100 validate-input col-lg-8"
      data-validate="Enter password">
      <span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
      </span> <input class="input100" type="password" id="inputPasswordConfirm" required="required"> <span
       class="focus-input100" data-placeholder="再次輸入密碼"></span>
     </div>
     <div class="col-lg-4">
      <span id="pwdConfirmCheck"></span>   
     </div>
     
<!--      <div class="row"> -->
      <div class="col-lg-8 wrap-input100 validate-input">
      <input class="input100" type="text" name="email" id="inputEmail" required="required"> 
      <span
       class="focus-input100" data-placeholder="信箱">
       <span id="emailCheck" style="float:right">
      </span>
      </span>
      </div>

      <div class="col-lg-4">
      <button class="btn btn-outline-secondary btn-user btn-block" id="sendletter" disabled>
                        寄出驗證信
                        </button>
      </div>
     
      
      <div class="col-lg-8 wrap-input100 validate-input">
      <input class="input100" type="text" id="verifycode" name="verifycode" required="required"> 
      <span
       class="focus-input100" data-placeholder="驗證碼">
       <span style="float:right">
      </span>
      </span>
      </div>

      <div class="col-lg-4  validate-input">
      <button class="btn btn-outline-secondary btn-user btn-block" id="sendcode" disabled>
                        確認驗證信
                        </button>
      </div>

<!--      <div -->
<!--       class="d-flex align-items-center justify-content-between mt-4 mb-0"> -->
<!--       <a class="small" href="/forgot.controller">忘記密碼?</a> -->
<!--       <button class="btn btn-primary" type="submit" value="login">送出</button> -->
<!--      </div> -->
     <div class="container-login100-form-btn col-lg-3">
     </div>
     <div class="container-login100-form-btn col-lg-6">
      <div class="wrap-login100-form-btn">
       <div class="login100-form-bgbtn"></div>
       <button class="login100-form-btn" id="regist" type="submit" disabled>註冊</button>
      </div>
     </div>
     <div class="container-login100-form-btn col-lg-3">
     </div>
     <div class="container-login100-form-btn col-lg-3">
     </div>
     
     <div class="container-login100-form-btn col-lg-3">
      <div class="wrap-login100-form-btn">
       <div class="login100-form-bgbtn"></div>
       <button class="login100-form-btn" id="onekey" type="button">一鍵輸入</button>
      </div>
     </div>
    <div class="container-login100-form-btn col-lg-3">
      <div class="wrap-login100-form-btn">
       <div class="login100-form-bgbtn"></div>
       <button class="login100-form-btn" id="onekeywrong" type="button">一鍵錯誤</button>
      </div>
     </div>
     
     <div class="container-login100-form-btn col-lg-3">
     </div>
     
     <div class="container-login100-form-btn col-lg-3">
     </div>
     <div class="text-center p-t-115 col-lg-6">
      <span class="txt1"> 已經有帳號了? </span> <a class="txt2" href="/login">
       前往登入 </a>
     </div>
    </div>
    <input type="hidden" name="roles" value="ROLE_USER"/>
    <input type="hidden" name="active" value="True"/> 
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
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script> 
$(function () {
    var userAvailable = false
    var pwdAvailable = false
    var pwdConfirmAvailable = false
    var emailAvailable = false
    var sendAvailable = false
    var send = false
    var codeAvailable = false
    var checkVo =''

    $(document).ready(function () {
        $('#username').keyup(function () { 
         console.log("123")
         if(($('#username').val().length >= 5) && ($('#username').val().length <= 20)){
             $.ajax({
                 type: 'POST',
                 url: "checkUsername.controller",
                 dataType: 'text',
                 data:{ username : $('#username').val()},
                 success: function (response) {
                  if(response=='帳號重複'){
                   $('#response').css('color','red').html("<i class='fa-regular fa-circle-xmark'></i>"+response)
                   userAvailable = false;
                  }else{
                   $('#response').css('color','green').html("<i class='fa-regular fa-circle-check'></i>");
                   userAvailable = true;
                  }
                     
                 } ,
                 error:function(xhr, ajaxOptions, thrownError){
                   
                     alert(xhr.status+"\n"+thrownError);
                 }
             })
         }else{
          $('#response').empty()
         }
         })
    })
    
    $('#inputPassword').keyup(function () { //inputPassword
        if(($('#inputPassword').val().length >= 1) && ($('#inputPassword').val().length <= 20)){
                 if(($('#inputPassword').val().length >= 6) && ($('#inputPassword').val().length <= 20)){
                  $('#pwdCheck').css('color','green').html("<i class='fa-regular fa-circle-check'></i>密碼格式正確");
                  pwdAvailable = true;
                 }else{
                  $('#pwdCheck').css('color','red').html("<i class='fa-regular fa-circle-xmark'></i>密碼格式錯誤")
                  pwdAvailable = false;
                 }
        }else{
         $('#pwdCheck').empty()
        }
     })
    
    $('#inputPasswordConfirm').keyup(function () { //inputPasswordConfirm
        if(($('#inputPasswordConfirm').val().length >= 1)){
                 if($('#inputPasswordConfirm').val()!=$('#inputPassword').val()){
                  $('#pwdConfirmCheck').css('color','red').html("<i class='fa-regular fa-circle-xmark'></i>密碼不一致")
                  pwdConfirmAvailable = false;
                 }else{
                  $('#pwdConfirmCheck').css('color','green').html("<i class='fa-regular fa-circle-check'></i>密碼一致");
                  pwdConfirmAvailable = true;
                 }
        }else{
         $('#pwdConfirmCheck').empty()
        }
        })
        ////////////// inputEmail
        $('#inputEmail').keyup(function () {
       var email = $('#inputEmail').val();
    if($('#inputEmail').val().length >=1){
     var emailRegxp = /[\w-]+@([\w-]+\.)+[\w-]+/; //2009-2-12更正為比較簡單的驗證
     console.log(email);
     console.log(emailRegxp.test(email));
     if (emailRegxp.test(email)){
      $('#emailCheck').css('color','green').html("<i class='fa-regular fa-circle-check'></i>Email格式正確");
         emailAvailable = true;
//       $('#emailCheck').focus();
//       $('#emailCheck').select();
     }else{
      $('#emailCheck').css('color','red').html("<i class='fa-regular fa-circle-xmark'></i>Email格式錯誤")
         emailAvailable = false;
     }
      }
       })
    
    ////////////////// 送出驗證信X

 $('#sendmessage').on('click',function(e){//send
  e.preventDefault(); 
        if(($('#inputPasswordConfirm').val().length >= 1)){
                 if($('#inputPasswordConfirm').val()!=$('#inputPassword').val()){
                  $('#pwdConfirmCheck').css('color','red').html("<i class='fa-regular fa-circle-xmark'></i>密碼不一致")
                  pwdConfirmAvailable = false;
                 }else{
                  $('#pwdConfirmCheck').css('color','green').html("<i class='fa-regular fa-circle-check'></i>密碼一致");
                  pwdConfirmAvailable = true;
                 }
        }else{
         $('#pwdConfirmCheck').empty()
        }
        })
    //////////////////  寄送鍵亮起
    $(document).keyup(function(event) {
     if(userAvailable && pwdAvailable && pwdConfirmAvailable && emailAvailable){
      $('#sendletter').attr('class','btn btn-success btn-user btn-block');
      $('#sendletter').attr('disabled',false)
      sendAvailable = true;
     }else{
      $('#sendletter').attr('class','btn btn-outline-secondary btn-user btn-block');
      $('#sendletter').attr('disabled','disabled')
      sendAvailable = false;
     }

});
    ////////////////// 寄出驗證
//     var checkVo =''
    $('#sendletter').on('click', function (e) {
     e.preventDefault();
     if(userAvailable && pwdAvailable && pwdConfirmAvailable && emailAvailable) {
         $.ajax({
       url: "sendmailforverify.controller",
       dataType: 'text',
       type:'POST',
//        async:false,
       data:{
        email : $("#inputEmail").val()
       },
       error: function(xhr) {
           alert('Ajax request 發生錯誤');
       },
       success: function(response){
        send = true
        checkVo = response;
        Swal.fire({
           icon: 'success',
           title: '驗證信已寄出'
         })
       }
   }) //ajax end
        }else { //if(response.trim() == "OK")的else
         Swal.fire({
            icon: 'error',
            title: '錯誤',
            text: '未達成條件'
            //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
          })
        }
     
     
//         if (userAvailable && pwdAvailable && pwdConfirmAvailable) {
//             $('#addUserForm').attr('action', '<c:url value='/t6_10_doAddUser.controller' />');
//             $('#addUser').attr('type','submit');
//         }
    })
    
    //////////////////  送出驗證亮起
    $(document).keyup(function(event) {
     if(userAvailable && pwdAvailable && pwdConfirmAvailable && emailAvailable && sendAvailable && send){
      $('#sendcode').attr('class','btn btn-success btn-user btn-block');
      $('#sendcode').attr('disabled',false)

     }else{
      $('#sendcode').attr('class','btn btn-outline-secondary btn-user btn-block');
      $('#sendcode').attr('disabled','disabled')

     }
    });
    //////////////////  確認驗證碼
  $('#sendcode').on('click',function(e){
   e.preventDefault();
   var verifycode = $('#verifycode').val();
   console.log(verifycode +'  '+checkVo)
   if((verifycode == checkVo) && (checkVo != '')){
       codeAvailable = true;
       Swal.fire({
          icon: 'success',
          title: '驗證碼正確'
        })
      $('#regist').attr('class','btn btn-success btn-user btn-block');
      $('#regist').attr('disabled',false)
   }else{
    codeAvailable = false;
    Swal.fire({
             icon: 'error',
             title: '錯誤',
             text: '驗證碼錯誤，請重新輸入!'
             //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
           })
   }
  })
 
       //////////////////  建立帳號亮起
    $(document).keyup(function(event) {
     if(userAvailable && pwdAvailable && pwdConfirmAvailable && emailAvailable && sendAvailable && codeAvailable){
      $('#regist').attr('class','btn btn-success btn-user btn-block');
      $('#regist').attr('disabled',false)

     }else{
      $('#regist').attr('class','btn btn-outline-secondary btn-user btn-block');
      $('#regist').attr('disabled','disabled')
     }
    });
  
    //////////////////  建立帳號
  $('#regist').on('click',function(){
   console.log("onclick")
   $('#registForm').attr('action', '/regist.controller');
   $('#regist').attr('type','submit');
//    var verifycode = $('#verifycode').val();
//    console.log(verifycode +'  '+checkVo)
//    if((verifycode == checkVo) && (checkVo != '')){
//        codeAvailable = true;
//    }else{
//     codeAvailable = false;
//     Swal.fire({
//              icon: 'error',
//              title: '錯誤',
//              text: '驗證碼錯誤，請重新輸入!'
//              //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
//            })
//    }
  })
  
  $('#onekey').on('click', function(){
   console.log("555")
   $('#username').val('gary2023').keyup()
   $('#inputPassword').val('Abc123456').keyup()
   $('#inputPasswordConfirm').val('Abc123456').keyup()
   $('#inputEmail').val('teemin20230202@gmail.com').keyup()
  })
  
  $('#onekeywrong').on('click', function(){
	   console.log("666")
	   $('#username').val('Naomi822').keyup()
	   $('#inputPassword').val('w12').keyup()
	   $('#inputPasswordConfirm').val('r12').keyup()
	   $('#inputEmail').val('e55e').keyup()
	  })
    
   })

</script>
</body>
</html>