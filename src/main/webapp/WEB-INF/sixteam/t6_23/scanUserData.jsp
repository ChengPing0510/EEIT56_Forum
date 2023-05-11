<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>scanUserData</title>
            <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
            <link rel="stylesheet" href="/front_index/css/flaticon.css" />
            <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
            <!-- <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" /> -->
            <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
            <!-- main css -->
            <link rel="stylesheet" href="/front_index/css/style.css" />
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
            <script src="https://kit.fontawesome.com/f7498d7580.js" crossorigin="anonymous"></script>
            <script type="text/javascript">


                $(function () {
                    load();
                })

                function load() {
                    var id = $('#li_id').val();
                    $.ajax({
                        type: 'post',
                        url: '/t6_23/scanMatcherUser2.controller/' + id,
                        dataType: 'JSON',
                        success: (result) => {
                            var ul = $('#matchPeople');

                            if (result.profession != null) {
                                var li_profession = "<li><hr /><span style='font-size:18px;'>職業:</span><br><br><span style='font-size:16px;'>"
                                    + result.profession + "</span></li>";
                                ul.append(li_profession);
                            }

                            if (result.hobby != null) {
                                var li_hobby = "<li><hr /><span style='font-size:18px;'>興趣:</span><br><br><span style='font-size:16px;'>"
                                    + result.hobby + "</span></li>";
                                ul.append(li_hobby);
                            }

                            if (result.personality != null) {
                                var li_personality = "<li><hr /><span style='font-size:18px;'>個性:</span><br><br><span style='font-size:16px;'>"
                                    + result.personality + "</span></li>";
                                ul.append(li.personality);
                            }

                            if (result.dream != null) {
                                var li_dream = "<li><hr /><span style='font-size:18px;'>夢想:</span><br><br><span style='font-size:16px;'>"
                                    + result.dream + "</span></li>";
                                ul.append(li_dream);
                            }

                            if (result.introduction != null) {
                                var li_introduction = "<li><hr /><span style='font-size:18px;'>自我介紹:</span><br><br><span style='font-size:16px;'>"
                                    + result.introduction + "</span></li>";
                                ul.append(li_introduction);
                            }

                        }
                    });


                }

            </script>
        </head>

        <body>
            <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
            <div class="container" style="margin-left: 300px;">
                <h3 style="margin-left: 300px;margin-top: 30px">個人摘要</h3>
                <!-- <img src="<c:url value='/t6_23/getImages.controller/${bean.id}' />" alt=""
                    style="width: 229px; height: 315px;"> -->

                <ul style="list-style-type:none" id="matchPeople">
                    <li id="li_id" value="${bean.id}"><span style="font-size:24px;">${bean.name}</span>
                        <img src="<c:url value='/t6_23/getImages.controller/${bean.id}' />" alt=""
                            style="width: 229px; height: 315px; margin-left: 100px;">


                    </li>
                    <li><span style="font-size:18px;">信仰宗教:</span><br><br><span style="font-size:16px;">
                            ${bean.religion}</span>
                    </li>
                    <li>
                        <hr /><span style="font-size:18px;">年齡區間:</span><br><br><span
                            style="font-size:16px;">${bean.age}</span>
                    </li>
                    <li>
                        <hr /><span style="font-size:18px;">居住地區:</span><br><br><span
                            style="font-size:16px;">${bean.address}</span>
                    </li>
                    <li>
                        <hr /><span style="font-size:18px;">性別:</span><br><br><span
                            style="font-size:16px;">${bean.sex}</span>
                    </li>
                    <li>
                        <hr /><span style="font-size:18px;">星座:</span><br><br><span
                            style="font-size:16px;">${bean.star}</span>
                    </li>
                    <li>
                        <hr /><span style="font-size:18px;">血型:</span><br><br><span
                            style="font-size:16px;">${bean.bloobtype}</span>
                    </li>
                    <li></li>
                </ul>
                <div>
                    <form action="/t6_23/matchSuccess.controller/${bean.id}">
                        <button id="${bean.id}" class="btn btn-success btn-user ">進行配對</button>
                    </form>
                    <form action="/t6_23/goback.controller">
                        <button class="btn btn-primary goIndex" onclick="goback()">回前頁</button>
                    </form>
                </div>


            </div>
            <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />

            <script type="text/javascript">
                // $('.goMatch').on('click', () => {
                //     // console.log($('.goMatch'))
                //     var MyValue = $('.goMatch').attr("id");
                //     // console.log('id= ' + MyValue);
                //     location.href = '/t6_23/matchSuccess.controller/' + MyValue;
                // })

                // function goback() {
                //     location.href = '/t6_23/goback.controller';
                // }
            </script>




        </body>

        </html>