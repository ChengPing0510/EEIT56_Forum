<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>神明便利店-個人資料</title>
    <link rel="icon" type="image/png"
	href="front_index/img/logo.png" />
    <link href="background_index/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<style>
 body{
    background-color: #9D9D9D;
    margin-top:20px;
}
.card {
    position: relative;
    display: flex;
    height :450px;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #9D9D9D;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
}
.me-2 {
    margin-right: .5rem!important;
}
    </style>
    
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>    
    
</head>

<body>
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

    <div class="container">
        <div class="main-body">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/welcomeToIndex">首頁</a></li>
<!--                     <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li> -->
                    <li class="breadcrumb-item active" aria-current="page">個人資料</li>
                </ol>
            </nav>
            <!-- /Breadcrumb -->

            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                    <div class="card" style="border-radius:20px;">
                        <div class="card-body" style="background-color:#E0E0E0;border-radius:20px;font-size:20px">
                            <div class="d-flex flex-column align-items-center text-center">
<a href="/loginToProfile"> <img src="/t6_10_showNowImg.controller"
								class="rounded-circle p-1 bg-primary" alt="找不到用戶圖" width="220px" height="220px"
								style="margin:auto">
							</a>
                                <div class="mt-3">
                                    <h4>${user.userName}</h4>
                                    <p class="text-secondary mb-1">
                                                                    <c:choose>
    <c:when test="${user.roles eq 'ROLE_USER'}">
       一般用戶
    </c:when>
    <c:otherwise>
       管理者
    </c:otherwise>
</c:choose>
                                    </p>
                                    <p class="text-muted font-size-sm">${user.email}</p>
                                     <a href="/logout" class="btn btn-primary" id="resetpwd">
                                            登出
                                        </a>
<!--                                     <button class="btn btn-outline-primary">Message</button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    

<!--                    <div class="card mt-3"> 
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-globe mr-2 icon-inline">
                                        <circle cx="12" cy="12" r="10"></circle>
                                        <line x1="2" y1="12" x2="22" y2="12"></line>
                                        <path
                                            d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                        </path>
                                    </svg>Website</h6>
                                <span class="text-secondary">https://bootdey.com</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-github mr-2 icon-inline">
                                        <path
                                            d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22">
                                        </path>
                                    </svg>Github</h6>
                                <span class="text-secondary">bootdey</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-twitter mr-2 icon-inline text-info">
                                        <path
                                            d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z">
                                        </path>
                                    </svg>Twitter</h6>
                                <span class="text-secondary">@bootdey</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-instagram mr-2 icon-inline text-danger">
                                        <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                                        <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                        <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                                    </svg>Instagram</h6>
                                <span class="text-secondary">bootdey</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-facebook mr-2 icon-inline text-primary">
                                        <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z">
                                        </path>
                                    </svg>Facebook</h6>
                                <span class="text-secondary">bootdey</span>
                            </li>
                        </ul>
                    </div>
                    -->
                    
                </div>
                

                
                <div class="col-md-8">
                    <div class="card mb-3" style="background-color:#E0E0E0;border-radius:20px">
                        <div class="card-body" style="background-color:#E0E0E0;border-radius:20px;font-size:20px">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">帳號</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${user.userName}
                                </div>
                            </div>
                            <hr>
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">密碼</h6>
                                </div>
                                <div class="col-sm-9 text-secondary" id="changePwdDiv">
                                
<!--                                 <input class="input100 col-sm-4" type="password" placeholder="請輸入舊密碼" id="inputPassword" name="password"> -->
<!--                                 <input class="input100 	col-sm-4" type="password" placeholder="請輸入新密碼" id="inputPasswordConfirm" name="inputPasswordConfirm"> -->
<!--                                 <button class="btn btn-success" id="doChangePwdButton">送出</button> -->
                                <button class="btn btn-success" id="toChangePwdButton">修改密碼</button>
                                
                                
                                
                                </div>
                            </div>
                            <hr>
                            
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">信箱</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${user.email}                                
                                </div>
                            </div>
                            <hr>
                            
                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">權限等級</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                   <c:choose>
    <c:when test="${user.roles eq 'ROLE_USER'}">
       一般用戶
    </c:when>
    <c:otherwise>
       管理者
    </c:otherwise>
</c:choose>
                                </div>
                            </div>
                            <hr>
                            
                           <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">登入天數</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${registDate.days}                                
                                </div>
                            </div>
                            <hr>
                            
                           <div class="row">
                                <div class="col-sm-3">
                                    <h5 class="mb-0">最近上線時間</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${registDate.lastLogin}                                
                                </div>
                            </div>
                            <hr>
                            
                            
                            
<!--                             <div class="row"> -->
<!--                                 <div class="col-sm-3"> -->
<!--                                     <h6 class="mb-0">Address</h6> -->
<!--                                 </div> -->
<!--                                 <div class="col-sm-9 text-secondary"> -->
<!--                                     Bay Area, San Francisco, CA -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <hr> -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <button class="btn btn-info " id="onekey"
                                        >一鍵輸入</button>
                                </div>
                            </div>
                        </div>
                    </div>


<!--                     <div class="row gutters-sm"> 
                        <div class="col-sm-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h6 class="d-flex align-items-center mb-3"><i
                                            class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                    <small>Web Design</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Website Markup</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 72%"
                                            aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>One Page</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 89%"
                                            aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Mobile Template</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 55%"
                                            aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Backend API</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 66%"
                                            aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 mb-3">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h6 class="d-flex align-items-center mb-3"><i
                                            class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                    <small>Web Design</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Website Markup</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 72%"
                                            aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>One Page</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 89%"
                                            aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Mobile Template</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 55%"
                                            aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <small>Backend API</small>
                                    <div class="progress mb-3" style="height: 5px">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 66%"
                                            aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>

        </div>
    </div>
-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--     <button class="btn btn-success" id="changePwdButton">修改密碼</button> -->
    <script>
    
    $(function () { // 新增也可抓
    
	    $('#changePwdDiv').on('click','#toChangePwdButton',function(e){
	    	console.log("123")
				e.preventDefault(); 
				$('#changePwdDiv').css('color','blue').html("<input class='input100 col-sm-4' type='password' placeholder='請輸入舊密碼' id='password' name='password'>"
+"                <input class='input100 	col-sm-4' type='password' placeholder='請輸入新密碼' id='inputPasswordConfirm' name='inputPasswordConfirm'>"
+"                <button class='btn btn-success' id='doChangePwdButton'>送出</button>'")
	    })	
    	
	    
	    $('#changePwdDiv').on('click','#doChangePwdButton',function(e){
	    	console.log("456")
			e.preventDefault(); 
	    	
	    	$.ajax({
			    url: "checkPassword.controller",
			    dataType: 'text',
			    type:'POST',
			    data:{
			    	password : $("#password").val(),
			    	newpassword : $("#inputPasswordConfirm").val()
			    },
			    error: function(xhr) {
			        alert('Ajax request 發生錯誤');
			    },
			    success: function(response){
                	if(response=='密碼正確'){
    			    	Swal.fire({
  			    		  icon: 'success',
  			    		  title: '更改密碼完成'
  			    		})
  			    		
                	}else{
       			    	Swal.fire({
    			    		  icon: 'error',
    			    		  title: '密碼錯誤'
    			    		})
                	}

			    }
			}) //ajax end

	    	
			$('#changePwdDiv').css('color','blue').html("<button class='btn btn-success' id='toChangePwdButton'>修改密碼</button>'")
	    })	
    	
    $('#onekey').on('click', function(){
        console.log("user")
        $('#password').val('Abc123456')
        $('#inputPasswordConfirm').val('Abc123456')
       })
	    
	    
    })
    </script> 
</body>

</html>