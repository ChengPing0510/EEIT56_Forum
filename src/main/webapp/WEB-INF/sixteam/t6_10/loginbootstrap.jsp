<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	

	
<meta charset="UTF-8">


<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href="background_index/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="bg-primary">
	<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">登入系統</h3>
                                </div>
                                <div class="card-body">
                                <c:if test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}">
  <p>輸入的帳號或密碼錯誤</p>
</c:if>
                                    <form action="/login" method="post">
                                    	<div>帳號:
                                    	</div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmail" type="text" name="username" required="required"
                                                placeholder="name@example.com" />
                                            <label for="inputEmail">請輸入5~20字(含大小寫英文)</label>
                                        </div>
                                        <div>密碼:</div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" type="password" name="password" required="required"
                                                placeholder="Password" />
                                            <label for="inputPassword">請輸入密碼</label>
                       
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" id="inputRememberPassword" type="checkbox"
                                                name="remember-me" />
                                            <label class="form-check-label" for="inputRememberPassword">記住我(1hr)</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <a class="small" href="/forgot.controller">忘記密碼?</a>
                                            <button class="btn btn-primary" type="submit" value="login">送出</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="/register.controller">還沒有帳號? 註冊一個吧!</a></div>
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
    <script src="background_index/js/scripts.js"></script>
    <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
</body>

</html>