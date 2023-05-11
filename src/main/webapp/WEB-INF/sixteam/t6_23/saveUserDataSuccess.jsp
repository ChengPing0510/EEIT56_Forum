<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Success</title>
            <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
            <link rel="stylesheet" href="/front_index/css/flaticon.css" />
            <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
            <!-- <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" /> -->
            <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
            <!-- main css -->
            <link rel="stylesheet" href="/front_index/css/style.css" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <style>
                #a001 {
                    margin: 0 auto;
                    width: 600px;
                }

                .div1 {
                    margin-top: 70px;
                    margin-bottom: 70px;
                }
            </style>
        </head>

        <body onload="setInterval(countDown, 1000)">
            <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
            <div class="div1">
                <div id="a001">
                    <h1>修改成功</h1>
                    五秒鐘後自動回首頁<br>
                    <font id="num" size="7" face="impact">5</font>
                </div>
            </div>

            <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
            <script>
                var sec = 5;
                function countDown() {
                    if (sec > 1)
                        num.innerHTML = --sec;
                    else
                        location = '<c:url value="/t6_23/go.controller" />';
                }
            </script>
        </body>

        </html>