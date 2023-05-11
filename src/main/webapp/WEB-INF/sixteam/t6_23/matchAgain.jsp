<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title> try again</title>
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
                }

                form {
                    margin: auto;
                    width: 600px;

                }
            </style>
        </head>

        <body>

            <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

            <div class="div1">
                <form action="<c:url value='/t6_23/matchStar2.controller' />" method="POST"
                    enctype="multipart/form-data">
                    <h2>請回答下列問題，讓我們能重新幫您進行配對</h2>
                    <table style="margin: auto;">
                        <tbody>
                            <tr>
                                <td>是否抽菸:</td>
                                <td><input type="radio" name="smoker" value="是" id="yes" required><label
                                        for="yes">是</label>
                                    <label"><input type="radio" name="smoker" value="否">否</label>
                                </td>
                            </tr>
                            <tr>
                                <td>吃素:</td>
                                <td><input type="radio" name="vegetarian" value="是" id="yes2"><label
                                        for="yes2">是</label><label><input type="radio" name="vegetarian"
                                            value="否">否</label>
                                </td>
                            </tr>
                            <tr>
                                <td>工作時間:</td>
                                <td><select name="worktime" id="">
                                        <option value="">選擇工作時段</option>
                                        <option value="平日早上">平日早上</option>
                                        <option value="平日下午">平日下午</option>
                                        <option value="平日晚上">平日晚上</option>
                                        <option value="平日凌晨">平日凌晨</option>
                                        <option value="假日">假日</option>
                                        <option value="輪班">輪班</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td>身高:</td>
                                <td><input type="number" name="height" id="" min="0"></td>
                            </tr>
                            <!-- <tr>
                                <td>生日:</td>
                                <td><input type="date" name="birth" id="" min=""></td>
                            </tr> -->
                            <tr>
                                <td>興趣:
                                    <br>
                                    (請選擇5項以下)
                                </td>
                                <td><input type="checkbox" name="hobby" id="" value="聽音樂">聽音樂
                                    <input type="checkbox" name="hobby" id="" value="彈奏樂器">彈奏樂器
                                    <input type="checkbox" name="hobby" id="" value="烹飪">烹飪
                                    <input type="checkbox" name="hobby" id="" value="表演">表演
                                    <input type="checkbox" name="hobby" id="" value="繪畫">繪畫
                                    <br>
                                    <input type="checkbox" name="hobby" id="" value="球類運動">球類運動
                                    <input type="checkbox" name="hobby" id="" value="田徑運動">田徑運動
                                    <input type="checkbox" name="hobby" id="" value="體操運動">體操運動
                                    <input type="checkbox" name="hobby" id="" value="健身">健身
                                    <input type="checkbox" name="hobby" id="" value="水上運動">水上運動
                                    <br>
                                    <input type="checkbox" name="hobby" id="" value="閱讀">閱讀
                                    <input type="checkbox" name="hobby" id="" value="工藝">工藝
                                    <input type="checkbox" name="hobby" id="" value="電子遊戲">電子遊戲
                                    <input type="checkbox" name="hobby" id="" value="唱歌">唱歌
                                    <input type="checkbox" name="hobby" id="" value="電影">電影
                                    <br>
                                    <input type="checkbox" name="hobby" id="" value="公益活動">公益活動
                                    <input type="checkbox" name="hobby" id="" value="登山">登山
                                    <input type="checkbox" name="hobby" id="" value="自行車">自行車
                                    <input type="checkbox" name="hobby" id="" value="開車/騎車">開車/騎車
                                    <input type="checkbox" name="hobby" id="" value="養寵物">養寵物
                                    <br>
                                    <input type="checkbox" name="hobby" id="" value="收藏">收藏
                                    <input type="checkbox" name="hobby" id="" value="桌遊">桌遊
                                    <input type="checkbox" name="hobby" id="" value="社交">社交
                                    <input type="checkbox" name="hobby" id="" value="極限運動">極限運動
                                    <input type="checkbox" name="hobby" id="" value="冥想">冥想
                                </td>
                            </tr>
                            <tr>
                                <td>職業:</td>
                                <td align="left">
                                    分類:<select onchange="changeprofession(this.selectedIndex);" name="profession">
                                        <option value="${bean.profession}">請選擇類別
                                        <option value="農牧業">農牧業</option>
                                        <option value="漁業">漁業 </option>
                                        <option value="木材森林業">木材森林業</option>
                                        <option value="礦業採石業">礦業採石業</option>
                                        <option value="交通運輸業">交通運輸業</option>
                                        <option value="餐旅業">餐旅業 </option>
                                        <option value="建築工程業">建築工程業</option>
                                        <option value="製造業">製造業</option>
                                        <option value="衛生保健業">衛生保健業</option>
                                        <option value="娛樂業">娛樂業</option>
                                        <option value="文教機關">文教機關</option>
                                        <option value="宗教團體">宗教團體</option>
                                        <option value="公共事業">公共事業</option>
                                        <option value="一般商業">一般商業</option>
                                        <option value="服務業">服務業</option>
                                        <option value="家庭管理">家庭管理</option>
                                        <option value="治安人員">治安人員</option>
                                        <option value="軍人">軍人</option>
                                        <option value="資訊業">資訊業</option>
                                        <option value="職業運動人員">職業運動人員</option>
                                    </select>
                                </td>
                            </tr>
                            <tr style="margin-top:20px ;">
                                <td></td>
                                <td><input class='btn btn-primary goIndex' type="submit" name="" id="" value="提交"></td>
                            </tr>
                        </tbody>
                    </table>


                </form>
            </div>
            <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />
        </body>

        </html>