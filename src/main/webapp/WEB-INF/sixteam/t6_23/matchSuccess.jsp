<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
            <link rel="stylesheet" href="/front_index/css/flaticon.css" />
            <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
            <!-- <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" /> -->
            <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
            <!-- main css -->
            <link rel="stylesheet" href="/front_index/css/style.css" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

            <style>
                .div1 {
                    margin-top: 70px;
                    margin-bottom: 70px;
                    margin-left: 610px;
                }

                .div2 {
                    /* margin-top: 70px; */
                    /* margin-bottom: 70px; */
                    margin-left: 110px;
                }
            </style>
        </head>

        <body style="margin: auto;">
            <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
            <div class="div1">
                <h3>與${bean.name}加Line聊天吧</h3>
                <img src="<c:url value='/t6_23/getline.controller/${bean.id}' />" alt=""
                    style="width: 315px; height: 315px;">
                <div class="div2">
                    <form action="<c:url value='/t6_23/go.controller' />">
                        <button class="btn btn-primary goIndex" type="submit">配對完成</br>反回首頁</button>
                    </form>
                </div>
            </div>


            <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
        </body>

        </html>