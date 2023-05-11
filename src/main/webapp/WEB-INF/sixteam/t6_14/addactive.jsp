<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>後臺管理系統</title>
<link
	href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/background_index/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- 	sweet -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- ck -->
<link rel="stylesheet" href="../ck/css/ck.css" />
</head>

<body class="sb-nav-fixed">
	<div>

		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">活動總覽</h1>
				<ol class="breadcrumb mb-4">
					<!--                             <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
					<!--                             <li class="breadcrumb-item active">Tables</li> -->
				</ol>
				<!--                         <div class="card mb-4"> -->
				<!--                             <div class="card-body"> -->
				<!--                                 DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the -->
				<!--                                 <a target="_blank" href="https://datatables.net/">official DataTables documentation</a> -->
				<!--                                 . -->
				<!--                             </div> -->
				<!--                         </div> -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>
					<div class="card-body">
						<form id="myForm" action="<c:url value='/actives'/>" method="post"
							enctype="multipart/form-data">


							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動名稱</label>
								<div class="col-sm-10">
									<input type="text" name="name" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動圖片</label>
								<div class="col-sm-10">
									<input type="file" name="img" required="required" />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動開始時間</label>
								<div class="col-sm-10">
									<input type="date" name="start" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動結束時間</label>
								<div class="col-sm-10">
									<input type="date" name="end" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動地點</label>
								<div class="col-sm-10">
									<input type="text" name="location" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動主辦單位</label>
								<div class="col-sm-10">
									<input type="text" name="host" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">人數上限</label>
								<div class="col-sm-10">
									<input type="number" name="num" required="required" pattern="^[1-9]\d*$" />
								</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">報名人數</label>
								<div class="col-sm-10">
									<input type="number" name="signUpNum" required="required" pattern="^[1-9]\d*$" min="0" />
								</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動價格</label>
								<div class="col-sm-10">
									<input type="number" name="price" required="required" pattern="^[1-9]\d*$" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動描述</label>
								<div class="col-sm-10">
									<textarea cols="20" rows="10" name="description" id="editor" contenteditable="true"></textarea>
								</div>
							</div>
							 <div>
											<button class="btn btn-success" id="fillBtn">一鍵完成</button>
  <button type="submit" class="btn btn-success">
												確認<i class="fa-solid fa-circle-check"></i>
											</button>
  </div>
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/background_index/js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>

	<!-- CK -->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>
	<script src="../ck/js/ck.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>



  document.querySelector('#fillBtn').addEventListener('click', function(e) {
	  e.preventDefault();
    document.querySelector('input[name="name"]').value = "【美好的一天】公益走讀～木柵指南宮";
    document.querySelector('input[name="start"]').value = "2023-05-05";
    document.querySelector('input[name="end"]').value = "2023-05-06";
    document.querySelector('input[name="location"]').value = "貓纜指南宮站";
    document.querySelector('input[name="host"]').value = "指南宮";
    document.querySelector('input[name="signUpNum"]').value = 0;
    document.querySelector('input[name="num"]').value = 45;
    document.querySelector('input[name="price"]').value = 2500;


    YourEditor.setData('<div class="style-08a13ad7-event-detail" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(117, 117, 117);display:flex;font-family:;" noto="" jhenghei=""><main class="style-5a46efb2-event-detail-content" style="border-radius:16px;box-sizing:border-box;display:block;flex:1 1 0%;font-size:16px;max-width:calc(100% - 300px);word-break:break-word;" role="main"><section class="style-906f804a-event-content-container" style="box-sizing:border-box;display:block;padding:15.5938px 48px;"><div class="style-ed4696a1-event-content-section-title" style="border-bottom:1px solid rgb(245, 245, 245);box-sizing:border-box;color:rgb(38, 38, 38);font-size:24px;margin-bottom:2rem;padding-bottom:10px;"><strong>【美好的一天】公益走讀～木柵指南宮</strong></div><div class="style-ed4696a1-event-content-section-title" style="border-bottom:1px solid rgb(245, 245, 245);box-sizing:border-box;color:rgb(38, 38, 38);font-size:24px;margin-bottom:2rem;padding-bottom:10px;"><strong>活動資訊</strong></div><article class="style-225f7a48-event-content" style="box-sizing:border-box;color:rgb(0, 0, 0);display:block;overflow-wrap:break-word;position:relative;"><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">安排一趟朝聖之旅，不僅可以欣賞建築藝術，豐富生活美感，了解祝福情意，還可以學習古聖先賢「凝神調息、安頓身心」的方法，加上台灣的廟宇不只是祈福信仰的中心，也是蘊含文化的藝術殿堂，往往隱身在名山美景當中，或是發展為市街的起點，或是成為美食的所在，<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">規劃以廟宇為主軸的小旅行，搭配周遭景點，能夠兼具藝術、歷史、美食、心靈等目的，並且在旅行的當下同時滿足知性、娛樂與健康的需求</strong>。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動規劃</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📅<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">活動時間</strong>：2023年2月20日(一)上午10:00-11:30（請提前10分鐘報到）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📌<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">集合地點</strong>：貓纜指南宮站（準時出發，逾時不候）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">🚩<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">路線安排：</strong>貓纜指南宮站(集合)→凌霄寶殿→祈夢房→純陽寶殿（解散）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📢<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">主辦單位</strong>：美遊記</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📢<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">活動費用</strong>：800</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉景點介紹</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">【木柵指南宮】</strong>指南宮之名是取「呂恩主在天庭居於南宮」、「濟世度人必須要指南針」之意，主要侍奉呂洞賓（呂恩主），俗稱「仙公廟」，目前已成為儒道釋三教同體的廟宇，被認為是臺灣道教聖地之一，也是指南地區主要的信仰。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">指南宮主祀神純陽祖師呂洞賓，正式名稱是「孚佑帝君」，但民間習稱仙公或呂祖。呂祖是唐朝時人，飽讀詩書，曾考中進士，做過縣令，因為虔心慕道，得遇正陽祖師鍾離權仙師，以黃粱大夢點化，點石成金試測，傳授心法，終成大道，位列仙班。但因立有「度盡世人」的宏願，所以經常顯化民間「濟世度人，解難救厄」，留下了許多民間親和的神跡佳話，是我國民眾最親近和熟悉的道教神仙。</span></span><br><br><span style="font-size:20px;"><span style="box-sizing:border-box;">宮殿園區佔地廣，古木參天，濃蔭蔽日。全宮共有純陽寶殿、凌霄寶殿、大雄寶殿及大成寶殿等殿宇。主殿均是依山而建，宏偉莊嚴，建築多採堅固青斗石，部分殿宇並用銅瓦覆蓋，可歷千年。純陽與凌霄兩殿間有長廊相連，亭池台榭，四時花開，空氣清新，可以一覽臺北市遠近景觀，被譽為「天下第一靈山」。更經常辦理各項大型宗教活動，參與國際弘道事務，聲名遠播。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:411px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110448461232051326.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:510px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110449366704605200.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:906px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110450311452241230.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動特色</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅透過五感仔細觀察「廟宇裝飾」，欣賞「吉祥圖案」寓意及美的的事物。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅學習運用圖騰符號，表達祝福情意，豐富生活美感。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅在有「天下第一靈山」美名之處俯瞰臺北市遠近景觀。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅輕鬆學習可以改變身心狀態的簡單動作，讓自己保持身心均安。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動流程</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:573px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110519049417569360.jpg" alt=""></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉注意事項</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅如遇人力不可抗力之天災或天候不佳等因素，主辦單位得考量安全等因素取消活動以確保參加者安全。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅本活動之錄影、相片等，為主辦單位版權所有，主辦單位將用於活動紀錄，新聞發布及後續行銷之用，如不同意可隨時告知，已發布者亦可撤除。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅主辦單位保有更動、暫停或取消活動內容之權利，若有任何關於活動的最新消息，將於相關平台更新，以上活動事項如有未盡事宜，主辦單位得隨時修正公布之，恕不另行通知。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅無故未到者，於活動中途脫隊、脫隊者，均視為自願放棄，亦不接受中途加入行程。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請參加人員視身體狀況，自行斟酌：準備穿戴輕便服裝、防滑鞋子、遮陽帽子、防曬防蚊蟲準備、雨具、個人藥品、飲用水瓶、協助支撐手杖。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請於規定報到時間說明準時抵達，以免影響活動參與品質與自身權益。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅本次活動為免費報名參加，請勿重複報名，如報名者無故遲到、未到或故意、惡意干擾報名者，以致影響其他人的權益，往後不得再參與美遊記主辦的相關活動。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請確實填寫「真實中文姓名」「電話」「電子郵件」資料，以利寄送相關活動內容和通知。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉推薦活動</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:24px;"><span style="box-sizing:border-box;">📣</span></span><a style="background-color:transparent;box-sizing:border-box;color:rgb(46, 163, 242);text-decoration:none;transition:all 0.2s ease 0s;" href="https://www.accupass.com/event/2301201208321805327511" target="_blank"><span style="font-size:24px;"><span style="box-sizing:border-box;">松山迎財神｜十大財神x推薦美食x體驗活動</span></span></a></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;">&nbsp;</p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉聯絡資訊：</strong></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">請於週一～週五上班時間（10:00~17:00），透過電話 666-666 或 透過信件 god@666.com 聯絡大中天先生，謝謝您。</span></span></p></article></section></main></div><section class="style-3e1ff301-event-map-container" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-radius:0px 0px 16px 16px;box-sizing:border-box;color:rgb(117, 117, 117);display:block;font-family:;" noto="" jhenghei=""><div class="style-1e60ef33-event-address-container" style="align-items:center;box-sizing:border-box;display:flex;flex-direction:column;margin-top:25px;"><p class="style-21c33753-event-address" style="box-sizing:border-box;color:rgb(149, 155, 161);margin:0px;padding:0px;text-align:center;"><strong>台灣台北市集合地點：貓纜指南宮站</strong></p></div></section>');
    
  });
  
  
  

  $(function () {
	  const form = document.querySelector("#myForm");
  let price = document.querySelector('input[name="price"]').value;
  let start = document.querySelector('input[name="start"]').value;
  let end = document.querySelector('input[name="end"]').value;
  let location = document.querySelector('input[name="location"]').value;
  let host = document.querySelector('input[name="host"]').value;
  let signUpNum = document.querySelector('input[name="signUpNum"]').value;
  let num = document.querySelector('input[name="num"]').value;
  let name = document.querySelector('input[name="name"]').value;
  
  
  
  
  
  })
  
</script>


</body>
</html>