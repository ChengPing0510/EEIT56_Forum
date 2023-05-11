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

			<form id="userform">
				<table border="1">
					<thead>
						<tr bgcolor='tan'>
							<th height="60" colspan="2" align="center">
								<h2>新增會員資料</h2>
							</th>
						</tr>
					</thead>
					<tbody>

						<tr bgcolor='tan'>
							<td width="120" height="40">暱稱:</td>
							<td width="600" height="40" align="left"><input id="uid" name="name" value='${bean.name}'
									type="text" size="20">${errors.ename}</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">年齡:</td>
							<td width="600" height="40" align="left"><input name="age" id="age" type="text"
									value='${bean.age}' size="20" id="userage">${errors.eage }</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">性別:</td>
							<td width="600" height="40" align="left"><input id="gender" type="radio" name="gender"
									value="男" id="m1" required> <label for="m1">男</label> <label> <input type="radio"
										name="gender" value="女" id="">女
								</label>${errors.egender }</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">地址:</td>
							<td width="600" height="40" align="left"><input name="address" id="address"
									value='${bean.address }' type="text" size="20">${errors.eaddress }</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">照騙:</td>
							<td width="600" height="40" align="left"><input type="file" name="photo" size="20"
									accept=".jpg,.png" multiple>
							</td>
						</tr>
						<tr bgcolor='tan'>
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
						<tr bgcolor='tan'>
							<td width="120" height="40">職業:</td>
							<td width="600" height="40" align="left"><input name="profession" type="text" size="20"
									value='${bean.profession }'>
							</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">宗教:</td>
							<td width="600" height="40" align="left"><input name="religion" type="text" size="20"
									value='${bean.religion }'></td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">收入:</td>
							<td width="600" height="40" align="left"><input name="income" type="text" size="20"
									value='${bean.income }'>${errors.eincome}</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">性取向:</td>
							<td width="600" height="40" align="left"><label for=""><input type="radio" name="sex_in"
										value="male" id="">男</label> <label>
									<input type="radio" name="sex_in" value="female" id="">女
								</label></td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">興趣:</td>
							<td width="600" height="40" align="left"><input name="hobby" type="text" size="20"
									value='${bean.hobby }'>
							</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">夢想:</td>
							<td width="600" height="40" align="left"><input name="dream" type="text" size="20"
									value='${bean.dream }'></td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">個性:</td>
							<td width="600" height="40" align="left"><input name="personality" type="text" size="20"
									value='${bean.personality }'>
							</td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">感情狀況:</td>
							<td width="600" height="40" align="left"><input name="emotion" type="text" size="20"
									value='${bean.emotion }'></td>
						</tr>
						<tr bgcolor='tan'>
							<td width="120" height="40">自介:</td>
							<td width="600" height="40" align="left"><textarea name="introduction" id="comment1"
									cols="40" rows="5">${bean.introduction }</textarea></td>
						</tr>


						<tr bgcolor='tan'>
							<td height="50" colspan="2" align="center"><button id="submit" type="button" value="送出"
									onclick="sendPeople()"></button> <input type="reset" value="清除"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div style="color: #FF0000; display: inline">${ErrorMsg.exception}</div>


			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
			<script>
				function getNameId() {

					if (isNaN(document.getElementById("userage").value)) {
						alert("請輸入年齡")
					}

				}

			</script>
			<script src="../t6_23/js/insertPeople.js"></script>

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