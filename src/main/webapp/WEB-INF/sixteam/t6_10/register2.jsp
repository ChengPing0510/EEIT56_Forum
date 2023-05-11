<%@ page import="sixteam.t6_10.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>神明便利店-註冊頁面</title>         <!-- 這是Title -->
    <link rel="icon" type="image/png" href="front_index/img/logo.png" />  <!-- 加這行 -->
	
    <link href="background_index/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>

<body class="bg-primary">

    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">註冊帳號</h3>
                                </div>
                                <div class="card-body">
                                    <form method="">
                                        <div class="row mb-3">
                                            <div class="col-md-6"> <!-- 半格 -->
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="username" type="text"
                                                        placeholder="Enter your first name" required/>
                   									 <span id="response"></span>
                                                    <label for="inputFirstName">帳號</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                       			 <div class="form-floating mb-3">
                                           		 <input class="form-control" id="none" type="email"
                                            	    placeholder="name@example.com" />
                                          		  <label for="inputEmail">暫時無</label>
                                           		 </div>
                                        </div>
                                        </div>
                                        
                                        <div class="row mb-3">
                                        
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputPassword" type="password"
                                                        placeholder="Create a password" required/>
                                                        <span id="pwdCheck"></span>
                                                    <label for="inputPassword">2-1密碼</label>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputPasswordConfirm"
                                                        type="password" placeholder="Confirm password" />
                                                                            <span id="pwdConfirmCheck"></span>
                                                    <label for="inputPasswordConfirm">2-2再次確認密碼</label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <div class="row mb-3">
                                        
                                        <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmail" type="email"
                                                placeholder="name@example.com" required/>
                                                <span id="emailCheck"></span>
                                            <label for="inputEmail">3-1Email</label>
                                              </div>
                                        </div>
                                        
                                        <div class="col-md-6">
                                        <button  class="btn btn-outline-secondary btn-user btn-block" id="sendletter" disabled>
                                            寄送驗證信
                                        </button>
                                        </div>
                                        
                                        
                                        </div>
                                        
                                        <div class="row mb-3">
                                        
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="verifycode" type="password"
                                                        placeholder="Create a password" required="required"/>
                                                    <label for="inputPassword">4-1驗證碼</label>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                        <button class="btn btn-outline-secondary btn-user btn-block" id="sendcode" disabled>
                                            送出驗證碼
                                        </button>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        
                                        
                                        
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                        <button class="btn btn-outline-secondary btn-user btn-block" id="regist" disabled>
                                            建立帳號
                                        </button>        
                                                    </div>
                                        </div>
                                    </form>
                                </div> <!-- card end -->
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="/login">已經有帳號了? 前往登入</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2022</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script> 
    $(function () {
    	var userAvailable=false
    	var pwdAvailable=false
    	var pwdConfirmAvailable=false
    	var emailAvailable=false
    	var sendAvailable = false
    	var send = false
    	var codeAvailable = false
    	var checkVo =''

	    $(document).ready(function () {
	        $('#username').keyup(function () { 
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
// 	    		$('#emailCheck').focus();
// 	    		$('#emailCheck').select();
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
    	//////////////////	寄出驗證
//     	var checkVo =''
    	$('#sendletter').on('click', function (e) {
    		e.preventDefault();
    		if(userAvailable && pwdAvailable && pwdConfirmAvailable && emailAvailable) {
	        	$.ajax({
				    url: "sendmailforverify.controller",
				    dataType: 'text',
				    type:'POST',
// 				    async:false,
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
    		
    		
// 	        if (userAvailable && pwdAvailable && pwdConfirmAvailable) {
// 	            $('#addUserForm').attr('action', '<c:url value='/t6_10_doAddUser.controller' />');
// 	            $('#addUser').attr('type','submit');
// 	        }
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
			$('#regist').on('click',function(e){
				e.preventDefault();
				console.log("good")
// 				var verifycode = $('#verifycode').val();
// 				console.log(verifycode +'  '+checkVo)
// 				if((verifycode == checkVo) && (checkVo != '')){
// 	    			codeAvailable = true;
// 				}else{
// 					codeAvailable = false;
// 					Swal.fire({
// 		        		  icon: 'error',
// 		        		  title: '錯誤',
// 		        		  text: '驗證碼錯誤，請重新輸入!'
// 		        		  //footer: '<a href="memberInsert">沒有帳號? 創建帳號</a>'
// 		        		})
// 				}
			})

	    
    })

</script>
</body>

</html>