<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>輸入資料</title>
			<style>
				form {
					margin: 0 auto;
					width: 600px;
				}
			</style>
			<link href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
				rel="stylesheet" />

			<link href="${pageContext.request.contextPath}/background_index/css/styles.css" rel="stylesheet" />
			<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
		</head>

		<body class="sb-nav-fixed">
			<div>

				<jsp:include page="/background_index/index-backToMVC.jsp" />
			</div>

			<form name="insertMemberFormA" action="<c:url value='/t6_23/processpeople.controller'  />" method="POST"
				enctype="multipart/form-data">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<th height="60" colspan="2" align="center">
								<h2>新增會員資料</h2>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="120" height="40">帳號:</td>
							<td width="600" height="40" align="left"><input id='Id' style="text-align: left"
									name="userId" type="text" size="14" onblur="getNameId()"
									value='${bean.userid}'><span style="color:red;">${errors.eid}</span></td>
						</tr>
						<tr>
							<td width="120" height="40">暱稱:</td>
							<td width="600" height="40" align="left"><input name="name" value='${bean.name}' type="text"
									size="20"><span style="color:red;">${errors.ename}</span></td>
						</tr>
						<tr>
							<td width="120" height="40">年齡:</td>
							<td width="600" height="40" align="left"><input name="age" type="text" value='${bean.age}'
									size="20" id="userage" onblur="getNameId()"><span style="color:red;">${errors.eage
									}</span></td>
						</tr>
						<tr>
							<td width="120" height="40">性別:</td>
							<td width="600" height="40" align="left"><input type="radio" name="gender" value="男" id="m1"
									required> <label for="m1">男</label> <label> <input type="radio" name="gender"
										value="女" id="">女
								</label><span style="color:red;">${errors.egender }</span></td>
						</tr>
						<tr>
							<td width="120" height="40">地址:</td>
							<td width="600" height="40" align="left"><select name="city" id="city"
									onchange="changeCity(this.selectedIndex);">
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
								<select name="place" id="place">
									<option value="">請選擇區域</option>
								</select>
								<span style="color:red;">${errors.eaddress }</span>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">照騙:</td>
							<td width="600" height="40" align="left"><input type="file" name="photo" size="20" multiple>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">星座:</td>
							<td width="600" height="40" align="left"><select name="star_sign" id="">
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
								</select></td>
						</tr>
						<tr>
							<td width="120" height="40">職業:</td>
							<td width="600" height="40" align="left"><input name="profession" type="text" size="20"
									value='${bean.profession }'>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">宗教:</td>
							<td width="600" height="40" align="left">類別:<select onChange="renew(this.selectedIndex);"
									id="dept">
									<option>請選擇類別
									<option value="東方宗教">東方宗教
									<option value="西方宗教">西方宗教
								</select>
								教別:<select name="religion" id="religion">
									<option value="">請由左方選取教別
								</select>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">收入:</td>
							<td width="600" height="40" align="left"><input name="income" type="text" size="20"
									value='${bean.income }'><span style="color:red;">${errors.eincome}</span></td>
						</tr>
						<tr>
							<td width="120" height="40">性取向:</td>
							<td width="600" height="40" align="left"><label for=""><input type="radio" name="sex_in"
										value="male" id="">男</label> <label>
									<input type="radio" name="sex_in" value="female" id="">女
								</label></td>
						</tr>
						<tr>
							<td width="120" height="40">興趣:</td>
							<td width="600" height="40" align="left"><input name="hobby" type="text" size="20"
									value='${bean.hobby }'>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">夢想:</td>
							<td width="600" height="40" align="left"><input name="dream" type="text" size="20"
									value='${bean.dream }'></td>
						</tr>
						<tr>
							<td width="120" height="40">個性:</td>
							<td width="600" height="40" align="left"><input name="personality" type="text" size="20"
									value='${bean.personality }'>
							</td>
						</tr>
						<tr>
							<td width="120" height="40">感情狀況:</td>
							<td width="600" height="40" align="left"><input name="emotion" type="text" size="20"
									value='${bean.emotion }'></td>
						</tr>
						<tr>
							<td width="120" height="40">自介:</td>
							<td width="600" height="40" align="left"><textarea name="introduction" id="comment1"
									cols="40" rows="5">${bean.introduction }</textarea></td>
						</tr>


						<tr>
							<td height="50" colspan="2" align="center"><input type="submit" value="送出"> <input
									type="reset" value="清除"></td>
						</tr>
					</tbody>
				</table>
				<div style="color: #FF0000; display: inline">${ErrorMsg.exception}</div>
			</form>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
			<script>
				// function getNameId() {
				// 	if (isNaN(document.getElementById("Id").value)) {
				// 		alert("請輸入數字")
				// 	}
				// 	if (isNaN(document.getElementById("userage").value)) {
				// 		alert("請輸入年齡")
				// 	}

				// }

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



				department = new Array();
				department[0] = [];
				department[1] = ["道教", "佛教", "三一教", "理教", "軒轅教", "天帝教", "一貫道", "天德聖教", "彌勒大道", "天道", "先天救教", '其他'];
				department[2] = ['猶太教', '天主教', '基督教', '伊斯蘭教', '東正教', '天理教', '巴哈尹教', '真光教團', '山達基', '統一教', '摩門教', '其他'];

				function changeCity(index) {
					for (var i = 0; i < county[index].length; i++)
						document.insertMemberFormA.place.options[i] = new Option(county[index][i], county[index][i]);	// 設定新選項
					document.insertMemberFormA.place.length = county[index].length;	// 刪除多餘的選項
				}

				function renew(index) {
					for (var i = 0; i < department[index].length; i++)
						document.insertMemberFormA.religion.options[i] = new Option(department[index][i], department[index][i]);	// 設定新選項
					document.insertMemberFormA.religion.length = department[index].length;	// 刪除多餘的選項
					console.log($('#dept').val());
				}
			</script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				crossorigin="anonymous"></script>
			<script src="../background_index/js/scripts.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
				crossorigin="anonymous"></script>
			<script src="../background_index/assets/demo/chart-area-demo.js"></script>
			<script src="../background_index/assets/demo/chart-bar-demo.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
			<script src="../background_index/js/datatables-simple-demo.js"></script>
		</body>

		</html>