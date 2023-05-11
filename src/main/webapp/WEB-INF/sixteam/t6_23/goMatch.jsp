<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <html>

        <head>
            <meta charset="UTF-8">
            <title>match</title>
            <title>Insert title here</title>
            <link rel="stylesheet" href="/front_index/css/bootstrap.css" />
            <link rel="stylesheet" href="/front_index/css/flaticon.css" />
            <link rel="stylesheet" href="/front_index/css/themify-icons.css" />
            <link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
            <link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
            <!-- main css -->
            <link rel="stylesheet" href="/front_index/css/style.css" />
            <style>
                .onoffswitch {
                    position: relative;
                    width: 40px;
                    -webkit-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                }

                .onoffswitch-checkbox {
                    position: absolute;
                    opacity: 0;
                    pointer-events: none;
                }

                .onoffswitch-label {
                    display: block;
                    overflow: hidden;
                    cursor: pointer;
                    height: 17px;
                    padding: 0;
                    line-height: 17px;
                    border: 2px solid #E3E3E3;
                    border-radius: 17px;
                    background-color: #FFFFFF;
                    transition: background-color 0.3s ease-in;
                }

                .onoffswitch-label:before {
                    content: "";
                    display: block;
                    width: 17px;
                    margin: 0px;
                    background: #FFFAFA;
                    position: absolute;
                    top: 0;
                    bottom: 0;
                    right: 21px;
                    border: 2px solid #E3E3E3;
                    border-radius: 17px;
                    transition: all 0.3s ease-in 0s;
                }

                .onoffswitch-checkbox:checked+.onoffswitch-label {
                    background-color: #46EBE0;
                }

                .onoffswitch-checkbox:checked+.onoffswitch-label,
                .onoffswitch-checkbox:checked+.onoffswitch-label:before {
                    border-color: #46EBE0;
                }

                .onoffswitch-checkbox:checked+.onoffswitch-label:before {
                    right: 0px;
                }
            </style>
            <style>
                form {
                    margin: 0 auto;
                    width: 600px;
                }

                .div1 {
                    margin-top: 70px;
                    margin-bottom: 70px;
                }
            </style>
        </head>

        <body>
            <jsp:include page="/front_index/index-FrontToTopMVC.jsp" />

            <div class="div1">



                <form name="MatchFormA" action="<c:url value='/t6_23/matchStar.controller' />" method="POST"
                    enctype="multipart/form-data">
                    <h1>請填寫資料讓其他人也能與你配對</h1>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2">請輸入資料</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>輸入暱稱:</td>
                                <td align="left">
                                    <input type="text" name="name">
                                    <span style="color:red;">${errors.ename}</span>
                                </td>
                            </tr>
                            <tr>
                                <td>年齡:</td>
                                <td align="left">
                                    <select name="age" id="age">
                                        <option value="">請選擇年齡區間</option>
                                        <option value="未滿18">未滿18</option>
                                        <option value="18~22">18~22</option>
                                        <option value="23~27">23~27</option>
                                        <option value="28~32">28~32</option>
                                        <option value="33~37">33~37</option>
                                        <option value="38~42">38~42</option>
                                        <option value="43~47">43~47</option>
                                        <option value="48~52">48~52</option>
                                        <option value="53~63">53~63</option>
                                        <option value="64以上">64以上</option>
                                    </select>
                                    <span style="color:red;">${errors.eage}</span>
                                </td>
                            </tr>
                            <tr>
                                <td>性別:</td>
                                <td align="left">
                                    <select name="gender" id="gender">
                                        <option value="">請選擇性別</option>
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                    <span style="color:red;">${errors.egender}</span>
                                </td>
                            </tr>
                            <tr>
                            
                                                           <td>居住地:</td>
                                <td align="left">
                                    <select name="city" id="city" onchange="changeCity(this.selectedIndex);">
                                        <option value="">請選擇縣市</option>
                                        <option value="台北市">台北市</option>
                                        <option value="基隆市">基隆市</option>
                                        <option value="新北市">新北市</option>
                                        <option value="宜蘭縣">宜蘭縣</option>
                                        <option value="桃園市">桃園市</option>
                                        <option value="新竹市">新竹市</option>
                                        <option value="新竹縣">新竹縣</option>
                                        <option value="苗栗縣">苗栗縣</option>
                                        <option value="台中市">台中市</option>
                                        <option value="彰化縣">彰化縣</option>
                                        <option value="南投縣">南投縣</option>
                                        <option value="嘉義市">嘉義市</option>
                                        <option value="嘉義縣">嘉義縣</option>
                                        <option value="雲林縣">雲林縣</option>
                                        <option value="台南市">台南市</option>
                                        <option value="高雄市">高雄市</option>
                                        <option value="澎湖縣">澎湖縣</option>
                                        <option value="金門縣">金門縣</option>
                                        <option value="屏東縣">屏東縣</option>
                                        <option value="台東縣">台東縣</option>
                                        <option value="花蓮縣">花蓮縣</option>
                                        <option value="連江縣">連江縣</option>
                                    </select>
<!-- <div class="nice-select" tabindex="0"> -->
<!-- <span class="current">請選擇縣市</span> -->
<!-- <ul class="list"> -->
<!-- <li data-value="" class="option selected">請選擇縣市</li> -->
<!-- <li data-value="台北市" class="option">台北市</li> -->
<!-- <li data-value="基隆市" class="option">基隆市</li> -->
<!-- <li data-value="新北市" class="option">新北市</li> -->
<!-- <li data-value="宜蘭縣" class="option">宜蘭縣</li> -->
<!-- <li data-value="桃園市" class="option">桃園市</li> -->
<!-- <li data-value="新竹市" class="option">新竹市</li> -->
<!-- <li data-value="新竹縣" class="option">新竹縣</li> -->
<!-- <li data-value="苗栗縣" class="option">苗栗縣</li> -->
<!-- <li data-value="台中市" class="option">台中市</li> -->
<!-- <li data-value="彰化縣" class="option">彰化縣</li> -->
<!-- <li data-value="南投縣" class="option">南投縣</li> -->
<!-- <li data-value="嘉義市" class="option">嘉義市</li> -->
<!-- <li data-value="嘉義縣" class="option">嘉義縣</li> -->
<!-- <li data-value="雲林縣" class="option">雲林縣</li> -->
<!-- <li data-value="台南市" class="option">台南市</li> -->
<!-- <li data-value="高雄市" class="option">高雄市</li> -->
<!-- <li data-value="澎湖縣" class="option">澎湖縣</li> -->
<!-- <li data-value="金門縣" class="option">金門縣</li> -->
<!-- <li data-value="屏東縣" class="option">屏東縣</li> -->
<!-- <li data-value="台東縣" class="option">台東縣</li> -->
<!-- <li data-value="花蓮縣" class="option">花蓮縣</li> -->
<!-- <li data-value="連江縣" class="option">連江縣</li> -->
<!-- </ul></div> -->
<!-- <div class="nice-select" tabindex="0"> -->
<!-- <span class="current">請選擇區域</span> -->
<!-- <ul class="list"><li data-value="" class="option selected">請選擇區域</li> -->
<!-- </ul></div> -->
<!--                                     <select name="place" id="place"> -->
<!--                                         <option value="">請選擇區域</option> -->
<!--                                     </select> -->
                                </td>
                            </tr>
                            <tr>
                                <td>信仰:</td>
                                <td align="left">
<!--                                     類別:<select onChange="renew(this.selectedIndex);" id="dept"> -->
<!--                                         <option>請選擇類別 -->
<!--                                         <option value="東方宗教">東方宗教 -->
<!--                                         <option value="西方宗教">西方宗教 -->
<!--                                     </select> -->
<!--                                     教別: -->
                                    <select name="religion" id="religion">
                                        <option value="">請由左方選取教別
                                        <option value="道教">道教
                                        <option value="佛教">佛教
                                        <option value="三一教">三一教
                                        <option value="理教">理教
                                        <option value="天主教">天主教
                                        <option value="基督教">基督教
                                        <option value="伊斯蘭教">伊斯蘭教
                                        <option value="猶太教">猶太教
                                        <option value="軒轅教">軒轅教
                                        <option value="一貫道">一貫道
                                        <option value="東正教">東正教
                                        <option value="摩門教">摩門教
                                        <option value="其他">其他
                                        <option value="無">無
                                    </select>
                                    <span style="color:red;">${errors.ereligion }</span>
                                </td>
                            </tr>
                            <tr>
                                <td>星座:</td>
                                <td align="left">
                                    <select name="star_sign" id="star_sign">
                                        <option value="">請選擇星座</option>
                                        <option value="牡羊座">牡羊座</option>
                                        <option value="金牛座">金牛座</option>
                                        <option value="雙子座">雙子座</option>
                                        <option value="巨蟹座">巨蟹座</option>
                                        <option value="獅子座">獅子座</option>
                                        <option value="處女座">處女座</option>
                                        <option value="天秤座">天秤座</option>
                                        <option value="天蠍座">天蠍座</option>
                                        <option value="射手座">射手座</option>
                                        <option value="摩羯座">摩羯座</option>
                                        <option value="水瓶座">水瓶座</option>
                                        <option value="雙魚座">雙魚座</option>
                                    </select>
                                    <span style="color:red;">${errors.estarsign }</span>
                                </td>
                            </tr>
                            <tr>
                                <td>血型:</td>
                                <td align="left">
                                    <select name="blood_type" id="blood_type">
                                        <option value="">請選擇血型</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="AB">AB</option>
                                        <option value="O">O</option>
                                    </select>
                                    <span style="color:red;">${errors.ebloodtype }</span>
                                </td>
                            </tr>
                            <tr>
                                <td>圖片:</td>
                                <td>
                                    <img id="preImg" height='80' width='80'><input id="uploadImg" type='file'
                                        name='photo' accept='.png,.jpg' />
                                </td>
                            </tr>
                            <tr>
                                <td>個人line QRcode:</td>
                                <td>
                                    <input type="file" name="line_qrcode" id="" accept='.png,.jpg'><span
                                        style="color:red;">${errors.eqrcode }</span>
                                </td>
                                                            </tr>
                            <tr>
                                <td>簡介:</td>
                                <td><textarea name="emotion" id="" cols="30" rows="10"
                                        placeholder="寫點東西讓別人能夠認識你，或者是告訴其他人你想認識甚麼樣的人，預設為\想認識同宗教的人\"></textarea></td>
                            </tr>
                            <!-- <tr>
                            <td>功能</td>
                            <td>
                                <div class="onoffswitch">
                                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox"
                                        id="myonoffswitch" tabindex="0" checked>
                                    <label class="onoffswitch-label" for="myonoffswitch"></label>
                                    <input type="hidden" name="checkboxStatus" value="on">
                                </div>
                            </td>
                        </tr> -->
                            <tr>
                                <td height="50" colspan="2" align="center">
                                    <input type="submit" value="送出">
                                    <input type="reset" value="清除">
                                    <input type="button" value="取消" onclick="">
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </form>
            </div>
            <jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script>
                $("#uploadImg").change(function () {
                    readURL(this);
                });

                function readURL(input) {

                    if (input.files && input.files[0]) {
                        //建立FileReader物件
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $("#preImg").attr('src', e.target.result);
                        }
                        //以.readAsDataURL將上傳檔案轉換為base64字串
                        reader.readAsDataURL(input.files[0]);
                    }
                }

                $(function () {
                    const checkbox = $('input[name="onoffswitch"]');
                    const checkboxStatus = $('input[name="checkboxStatus"]');

                    checkbox.change(function () {
                        if (checkbox.is(':checked')) {
                            // Checkbox is checked (ON)
                            checkboxStatus.val('on');
                        } else {
                            // Checkbox is not checked (OFF)
                            checkboxStatus.val('off');
                        }
                    });

                    // const checkbox = $('input[type="checkbox"]');

                    // checkbox.change(function () {
                    //     if (checkbox.is(':checked')) {
                    //         // Checkbox is checked (ON)
                    //         checkbox.val('on');
                    //     } else {
                    //         // Checkbox is not checked (OFF)
                    //         checkbox.val('off');
                    //     }
                    // });

                })
            </script>
            <script>
                            county = new Array();
                county[0] = [];
                county[1] = ["中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區"];
                county[2] = ["仁愛區", "信義區", "中正區", "中山區", "安樂區", "暖暖區", "七堵區"];
                county[3] = ["萬里區", "金山區", "板橋區", "汐止區", "深坑區", "石碇區", "瑞芳區", "平溪區", "雙溪區", "貢寮區", "新店區", "坪林區", "烏來區", "永和區", "中和區", "土城區", "三峽區", "樹林區", "鶯歌區", "三重區", "新莊區", "泰山區", "林口區", "蘆洲區", "五股區", "八里區", "淡水區", "三芝區", "石門區"];
                county[4] = ["宜蘭市", "頭城鎮", "礁溪鄉", "壯圍鄉", "員山鄉", "羅東鎮", "三星鄉", "大同鄉", "五結鄉", "冬山鄉", "蘇澳鎮", "南澳鄉", "釣魚台列嶼"];
                county[5] = ["中壢區", "平鎮區", "龍潭區", "楊梅區", "新屋區", "觀音區", "桃園區", "龜山區", "八德區", "大溪區", "復興區", "大園區", "蘆竹區"];
                county[6] = ["東區", "北區", "香山區"];
                county[7] = ["竹北市", "湖口鄉", "新豐鄉", "新埔鎮", "關西鎮", "芎林鄉", "寶山鄉", "竹東鎮", "五峰鄉", "橫山鄉", "尖石鄉", "北埔鄉", "峨眉鄉"];
                county[8] = ["竹南鎮", "頭份市", "三灣鄉", "南庄鄉", "獅潭鄉", "後龍鎮", "通霄鎮", "苑裡鎮", "苗栗市", "造橋鄉", "頭屋鄉", "公館鄉", "大湖鄉", "泰安鄉", "銅鑼鄉", "三義鄉", "西湖鄉", "卓蘭鎮"];
                county[9] = ["中區", "東區", "南區", "西區", "北區", "北屯區", "西屯區", "南屯區", "太平區", "大里區", "霧峰區", "烏日區", "豐原區", "后里區", "石岡區", "東勢區", "和平區", "新社區", "潭子區", "大雅區", "神岡區", "大肚區", "沙鹿區", "龍井區", "梧棲區", "清水區", "大甲區", "外埔區", "大安區"];
                county[10] = ["彰化市", "芬園鄉", "花壇鄉", "秀水鄉", "鹿港鎮", "福興鄉", "線西鄉", "和美鎮", "伸港鄉", "員林市", "社頭鄉", "永靖鄉", "埔心鄉", "溪湖鎮", "大村鄉", "埔鹽鄉", "田中鎮", "北斗鎮", "田尾鄉", "埤頭鄉", "溪州鄉", "竹塘鄉", "二林鎮", "大城鄉", "芳苑鄉", "二水鄉"];
                county[11] = ["南投市", "中寮鄉", "草屯鎮", "國姓鄉", "埔里鎮", "仁愛鄉", "名間鄉", "集集鎮", "水里鄉", "魚池鄉", "信義鄉", "竹山鎮", "鹿谷鄉"];
                county[12] = ["東區", "西區"];
                county[13] = ["番路鄉", "梅山鄉", "竹崎鄉", "阿里山", "中埔鄉", "大埔鄉", "水上鄉", "鹿草鄉", "太保市", "朴子市", "東石鄉", "六腳鄉", "新港鄉", "民雄鄉", "大林鎮", "溪口鄉", "義竹鄉", "布袋鎮"];
                county[14] = ["斗南鎮", "大埤鄉", "虎尾鎮", "土庫鎮", "褒忠鄉", "東勢鄉", "台西鄉", "崙背鄉", "麥寮鄉", "斗六市", "林內鄉", "古坑鄉", "莿桐鄉", "西螺鎮", "二崙鄉", "北港鎮", "水林鄉", "口湖鄉", "四湖鄉", "元長鄉"];
                county[15] = ["中西區", "東區", "南區", "北區", "安平區", "安南區", "永康區", "歸仁區", "新化區", "左鎮區", "玉井區", "楠西區", "南化區", "仁德區", "關廟區", "龍崎區", "官田區", "麻豆區", "佳里區", "西港區", "七股區", "將軍區", "學甲區", "北門區", "新營區", "後壁區", "白河區", "東山區", "六甲區", "下營區", "柳營區", "鹽水區", "善化區", "大內區", "山上區", "新市區", "安定區"];
                county[16] = ["新興區", "前金區", "苓雅區", "鹽埕區", "鼓山區", "旗津區", "前鎮區", "三民區", "楠梓區", "小港區", "左營區", "仁武區", "大社區", "東沙群島", "南沙群島", "岡山區", "路竹區", "阿蓮區", "田寮區", "燕巢區", "橋頭區", "梓官區", "彌陀區", "永安區", "湖內區", "鳳山區", "大寮區", "林園區", "鳥松區", "大樹區", "旗山區", "美濃區", "六龜區", "內門區", "杉林區", "甲仙區", "桃源區", "那瑪夏區", "茂林區", "茄萣區"];
                county[17] = ["馬公市", "西嶼鄉", "望安鄉", "七美鄉", "白沙鄉", "湖西鄉"];
                county[18] = ["金沙鎮", "金湖鎮", "金寧鄉", "金城鎮", "烈嶼鄉", "烏坵鄉"];
                county[19] = ["屏東市", "三地門鄉", "霧台鄉", "瑪家鄉", "九如鄉", "里港鄉", "高樹鄉", "鹽埔鄉", "長治鄉", "麟洛鄉", "竹田鄉", "內埔鄉", "萬丹鄉", "潮州鎮", "泰武鄉", "來義鄉", "萬巒鄉", "崁頂鄉", "新埤鄉", "南州鄉", "林邊鄉", "東港鎮", "琉球鄉", "佳冬鄉", "新園鄉", "枋寮鄉", "枋山鄉", "春日鄉", "獅子鄉", "車城鄉", "牡丹鄉", "恆春鎮", "滿州鄉"];
                county[20] = ["台東市", "綠島鄉", "蘭嶼鄉", "延平鄉", "卑南鄉", "鹿野鄉", "關山鎮", "海端鄉", "池上鄉", "東河鄉", "成功鎮", "長濱鄉", "太麻里", "金峰鄉", "大武鄉", "達仁鄉"];
                county[21] = ["花蓮市", "新城鄉", "秀林鄉", "吉安鄉", "壽豐鄉", "鳳林鎮", "光復鄉", "豐濱鄉", "瑞穗鄉", "萬榮鄉", "玉里鎮", "卓溪鄉", "富里鄉"];
                county[22] = ["南竿鄉", "北竿鄉", "莒光鄉", "東引鄉"];

                function changeCity(index) {
                    for (var i = 0; i < county[index].length; i++)
                        document.MatchFormA.place.options[i] = new Option(county[index][i], county[index][i]); // 設定新選項
                    document.MatchFormA.place.length = county[index].length; // 刪除多餘的選項
                }

                department = new Array();
                department[0] = [];
                department[1] = ["道教", "佛教", "三一教", "理教", "軒轅教", "天帝教", "一貫道", "天德聖教", "彌勒大道", "天道", "先天救教", '其他', '無'];
                department[2] = ['猶太教', '天主教', '基督教', '伊斯蘭教', '東正教', '天理教', '巴哈尹教', '真光教團', '山達基', '統一教', '摩門教', '其他', '無'];

                function renew(index) {
                    for (var i = 0; i < department[index].length; i++)
                        document.MatchFormA.religion.options[i] = new Option(department[index][i], department[index][i]); // 設定新選項
                    document.MatchFormA.religion.length = department[index].length; // 刪除多餘的選項
                    console.log($('#dept').val());
                }
            </script>



        </body>

        </html>