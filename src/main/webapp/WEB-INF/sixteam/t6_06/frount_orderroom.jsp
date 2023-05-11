<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>神明便利店-資訊業面</title>
    <link rel="icon" type="image/png" href="front_index/img/logo.png" />
    <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
    <link rel="stylesheet" href="/front_index/css/flaticon.css" />
    <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
    <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="/front_index/css/style.css" />
</head>

<body>
    <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
    <div style="margin: 0 auto; width: 50%;">
        <form action="/frount_orderroom" class="appointment-form" method="POST">
            <h3 class="mb-3">訂房資訊</h3>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">使用者
                        <input type="text" class="form-control" readonly placeholder="Full Name" name="insuserId" value="${userId}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-wrap">
                            <div class="icon"><span class="ion-md-calendar"></span>入住日期</div>
                            <input type="date" class="form-control appointment_date-check-in" placeholder="Check-In"
                                name="inscheckindate">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-wrap">
                            <div class="icon"><span class="ion-md-calendar"></span>退房日期</div>
                            <input type="date" class="form-control appointment_date-check-out" placeholder="Check-Out"
                                name="inscheckoutdate">
                        </div>
                    </div>
                </div>
				
                <div class="col-md-6">
                    <div class="form-group">寺廟名稱
                        <input type="text" class="form-control" readonly placeholder="寺廟名稱" name="instempleName" value="${trmp.templeName}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">金額
                        <input type="text" class="form-control" readonly placeholder="金額" name="inscost" value="${trmp.cost}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-wrap">
                            <div class="icon">房號<span class="ion-ios-clock"></span></div>
                            <input type="text" class="form-control appointment_time" readonly placeholder="房間" name="insroomId" value="${trmp.roomId}">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">房型
                        <input type="text" class="form-control" readonly placeholder="電話" value="${trmp.roomtype}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">電話
                        <input type="text" class="form-control" placeholder="電話">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-wrap">E-mail
                            <div class="icon"><span class="ion-ios-clock"></span></div>
                            <input type="text" class="form-control appointment_time" placeholder="E-mail" id="E-mail" value="${email}">
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input type="submit" value="預約住房" class="btn btn-primary py-3 px-4"
                            style="margin:  auto; width: 50%;">
                    </div>
                </div>
            </div>
        </form>
    </div>
<!--     <div class="container-fluid bg-light bg-icon py-6"> -->
<!--         <div class="container"> -->
<!--             <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" -->
<!--                 style="max-width: 500px;"> -->
<!--                 <h1 class="display-5 mb-3">Our Features</h1> -->
<!--                 <p>Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p> -->
<!--             </div> -->
<!--             <div class="row g-4"> -->
<!--                 <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s" style="margin: 0 auto;"> -->
<!--                     <div class="bg-white text-center h-100 p-4 p-xl-5" type="hidden"> -->
<!--                         <img class="img-fluid mb-4" src="t6_6_img.controller/1000" alt=""> -->
<!--                         <h4 class="mb-3">Natural Process</h4> -->
<!--                         <p class="mb-4">Tempor ut dolore lorem kasd vero ipsum sit eirmod sit. Ipsum diam justo sed vero -->
<!--                             dolor duo.</p> -->
<!--                         <a class="btn btn-outline-primary border-2 py-2 px-4 rounded-pill" href="">Read More</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- Feature End -->
    <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
    <script type="text/javascript">
    var checkInDate = document.querySelector('.appointment_date-check-in');
    var checkOutDate = document.querySelector('.appointment_date-check-out');

    // 加入 change 事件處理器，當值有變化時就會觸發
    checkOutDate.addEventListener('change', function() {
      // 取得入住日期和退房日期的值
      var checkInValue = new Date(checkInDate.value);
      var checkOutValue = new Date(checkOutDate.value);
      
      // 比較入住日期和退房日期，如果退房日期小於入住日期
      if (checkOutValue < checkInValue) {
        // 顯示警告
        alert('退房日期不能早於入住日期！');
        checkOutInput.value = checkInInput.value;
      }
    });
    
    const emailInput = document.querySelector(".appointment_time");

    emailInput.addEventListener("blur", function () {
      const emailValue = emailInput.value;
      const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

      if (!emailRegex.test(emailValue)) {
        // 如果 email 格式不正確，跳出警告
        alert("Email 格式不正確");
      }
    });
    </script>
</body>

</html>