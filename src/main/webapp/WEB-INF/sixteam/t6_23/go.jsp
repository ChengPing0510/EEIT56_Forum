<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="/front_index/css/bootstrap.css" />
			<link rel="stylesheet" href="/front_index/css/flaticon.css" />
			<link rel="stylesheet" href="/front_index/css/themify-icons.css" />
			<link rel="stylesheet" href="/front_index/vendors/owl-carousel/owl.carousel.min.css" />
			<link rel="stylesheet" href="/front_index/vendors/nice-select/css/nice-select.css" />
			<!-- main css -->
			<link rel="stylesheet" href="/front_index/css/style.css" />


			<script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-WC6KH98"></script>
			<script async="" src="https://www.google-analytics.com/analytics.js"></script>
			<link href="//fonts.googleapis.com/earlyaccess/notosanstc.css" rel="stylesheet" type="text/css">
			<link href="https://www.meettheone.com.tw/css/mto.static.compiled.css?v=287" type="text/css"
				rel="stylesheet">
			<link href="https://www.meettheone.com.tw/css/mto.compiled.css?v=287" rel="stylesheet" type="text/css">

			<style data-emotion="css 1dlcyqs" data-s="">
				.css-1dlcyqs {
					display: -webkit-box;
					display: -webkit-flex;
					display: -ms-flexbox;
					display: flex;
					-webkit-box-pack: center;
					-ms-flex-pack: center;
					-webkit-justify-content: center;
					justify-content: center;
					-webkit-box-flex-wrap: wrap;
					-webkit-flex-wrap: wrap;
					-ms-flex-wrap: wrap;
					flex-wrap: wrap;
				}
			</style>
			<style data-emotion="css hzn4bd" data-s="">
				.css-hzn4bd {
					-webkit-flex: 1 1 100%;
					-ms-flex: 1 1 100%;
					flex: 1 1 100%;
					max-width: 332px;
					margin-bottom: 40px;
					cursor: pointer;
					margin-left: 580px;
				}

				@media screen and (min-width: 48em) {
					.css-hzn4bd {
						margin-right: 30px;
					}
				}
			</style>
			<style data-emotion="css 1p6ljdv" data-s="">
				.css-1p6ljdv {
					width: 100%;
					position: relative;
					font-size: 0px;
					-webkit-transition: 0.3s ease;
					transition: 0.3s ease;


				}

				.css-1p6ljdv:hover,
				.css-1p6ljdv[data-hover] {
					-webkit-transform: translateY(-10px);
					-moz-transform: translateY(-10px);
					-ms-transform: translateY(-10px);
					transform: translateY(-10px);
				}
			</style>
			<style data-emotion="css 13hqurm" data-s="">
				.css-13hqurm {
					width: 100%;
					position: absolute;
					-webkit-padding-start: 26px;
					padding-inline-start: 26px;
					-webkit-padding-end: 26px;
					padding-inline-end: 26px;
					bottom: 0px;
					left: 0px;
					padding-bottom: 22px;
				}
			</style>
			<style data-emotion="css y43a7m" data-s="">
				.css-y43a7m {
					font-size: 14px;
					color: var(--chakra-colors-gray-600);
					margin-bottom: 8px;
				}
			</style>
			<style data-emotion="css ydi96r" data-s="">
				.css-ydi96r {
					font-size: 24px;
					font-weight: 500;
					color: var(--chakra-colors-gray-900);
					margin-bottom: 24px;
				}
			</style>
			<style data-emotion="css 1e9qcwr" data-s="">
				.css-1e9qcwr {
					width: 100%;
					line-height: 34px;
					font-size: 14px;
					color: var(--chakra-colors-gray-900);
					border: 1px solid #C4C4C4;
					border-radius: 5px;
				}
			</style>
			<style data-emotion="css 27v5lt" data-s="">
				.css-27v5lt {
					font-size: 14px;
					margin-top: 18px;
					font-weight: 500;
				}
			</style>

			<style type="text/css">
				#appContainer[data-v-394ec870] {
					overflow: hidden
				}

				@media only screen and (min-width:769px) {
					#appContainer[data-v-394ec870] {
						min-height: 520px
					}
				}

				.loader_f[data-v-394ec870] {
					text-align: center;
					position: fixed;
					top: 50%;
					left: 50%;
					margin-top: -20px;
					margin-left: -20px;
					z-index: 50
				}

				.disableScroll[data-v-394ec870] {
					touch-action: none;
					-ms-touch-action: none
				}

				ul li.content[data-v-394ec870] {
					overflow-y: auto;
					text-align: left
				}

				@media screen and (min-height:768px) {
					ul[data-v-394ec870] {
						overflow-y: auto
					}
				}

				@media screen and (max-height:768px) {
					ul[data-v-394ec870] {
						overflow-y: auto
					}
				}

				@media screen and (max-height:568px) {
					ul[data-v-394ec870] {
						overflow-y: auto
					}
				}

				.div1 {
					margin-top: 70px;
					/* margin-bottom: 70px; */
				}
			</style>

		</head>

		<body>

			<jsp:include page="/front_index/index-FrontToTopMVC.jsp" />
			<div align="RIGHT">
				<a class="btn btn-primary goIndex" href='<c:url value="/t6_23/upDateMatchData.controller" />'><i
						class="fa-regular fa-pen-to-square"></i>修改配對資料</a>
			</div>
			<div class="css 1dlcyqs div1">
				<div class="css-hzn4bd" id="seMatch">
					<div class="css-1p6ljdv"><span
							style="box-sizing:border-box;display:inline-block;overflow:hidden;width:initial;height:initial;background:none;opacity:1;border:0;margin:0;padding:0;position:relative;max-width:100%"><span
								style="box-sizing:border-box;display:block;width:initial;height:initial;background:none;opacity:1;border:0;margin:0;padding:0;max-width:100%">
								<img style="display:block;max-width:100%;width:initial;height:initial;background:none;opacity:1;border:0;margin:0;padding:0"
									alt="" aria-hidden="true"
									src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%27644%27%20height=%27608%27/%3e"></span>
							<img alt="button"
								srcset="https://legere.com.tw/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftest-1.53cb8687.png&w=750&q=75 1x, https://legere.com.tw/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftest-1.53cb8687.png&w=750&q=75 2x"
								src="https://legere.com.tw/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftest-1.53cb8687.png&w=750&q=75"
								decoding="async" data-nimg="intrinsic"
								style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;"></span>
						<div class="css-13hqurm">
							<p class="chakra-text css-y43a7m">配對系統</p>
							<p class="chakra-text css-ydi96r">尋找適合你的人</p>
							<div class="css-1e9qcwr">我要配對</div>
						</div>
					</div>
					<p class="chakra-text css-27v5lt">已有20316人進行過配對
					</p>
				</div>
			</div>

			<section class="success_block">
				<div>
					<header class="header-sty2">
						<h2 class="title">參與配對的人</h2>
					</header>
				</div>
				<div class="pt-2 pb-3 sp-pt-0 sp-pb-2"></div>
				<div class="mobile-display-none">
					<div class="success_wrapper">
						<div class="success_laptop_block">
							<div id="success_laptop_Slider" class="success-slider slider-sty1 loaded">
								<div class="wrapper">
									<div id="success_laptop_Slides" class="slides" style="left: -2400px;">
										<span class="slide">
											<div class="lists">
												<ul>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/${bean.id}' />"
																	alt=""></div>
															<div class="text-box"><span class="up">Sophia (右):</span>
																很感謝讓我遇見老公，心理學分析讓我們可以避開對方的地雷，對往後的相處相當有幫助，真的很謝謝你們帶給我幸福！
																<span>阿同、Sophia (已結婚)</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</span>
										<span class="slide">
											<div class="lists">
												<ul>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/${bean.id}' />"
																	alt=""></div>
															<div class="text-box"><span class="up">嘉駿 (左):</span>
																我們有多重身分，不僅是男女朋友，還是最好的閨蜜，更是最支持彼此的家人，生活中充滿了無法套招的默契。
																<span>嘉駿、湘羽 (交往中)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/${bean.id}' />"
																	alt=""></div>
															<div class="text-box"><span class="up">元朗 (右):</span>
																我遇到了soulmate，身心靈都很合，我們之間的分享很細膩而且通透，兩個人在感受力、智商、價值觀都很接近
																<span>聖果、元朗 (準備結婚)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/${bean.id}' />"
																	alt=""></div>
															<div class="text-box"><span class="up">佳儒 (左):</span>
																我找到心靈上能互相扶持的伴侶，我們的個性互補，興趣、價值觀相仿，一切都在相處中越來越好。
																<span>佳儒、彥志 (已結婚)</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</span> <span class="slide">
											<div class="lists">
												<ul>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/1020' />"
																	style="height: 350px;width: 365px;" alt=""></div>
															<div class="text-box"><span class="up">Albert: </span>
																用過超多軟體...聊過及見過超多的約會對象，但結果都不盡人意，感謝這裡的專業心理學配對，讓我們相遇，她是真正適合我的人。
																<span></span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/1011' />"
																	style="height: 350px;width: 365px;" alt=""></div>
															<div class="text-box"><span class="up">Evelyn:</span>
																覺得很神奇，像認識很久一般的自然，已推薦給三四個朋友，朋友也在這裡認識現在的老婆。
																<span></span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="<c:url value='/t6_23/getImages.controller/1017' />"
																	style="height: 350px;width: 365px;" alt=""></div>
															<div class="text-box"><span class="up">Lorna:</span>
																我找到能一起分享喜悅與煩惱，彼此相似又互補，。
																<span></span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</span><span class="slide">
											<div class="lists">
												<ul>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img src="/images/index6/success-8.jpg"
																	alt=""></div>
															<div class="text-box"><span class="up">家玉 (左):</span>
																非常契合的心靈夥伴，不只三觀合，很好聊天，彼此的想法都能理解和同理，喜歡吃相似的食物，還有很多很多...
																<span>子堯、家玉 (準備結婚)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img src="/images/index6/success-9.jpg"
																	alt=""></div>
															<div class="text-box"><span class="up">彩玲 (左):</span>
																單身20多年，第一次約會就遇見我先生，當天我們聊了一個下午，交往1年、結婚2年，很幸福、很喜樂。
																<span>彩玲、英華 (已結婚)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="/images/index6/success-11.jpg" alt=""></div>
															<div class="text-box"><span class="up">星帆 (右):</span>
																感到非常幸福，過去在各種交友管道都無法順利找到契合的對象，在這裡不到半年內就找到生命中的那個人。
																<span>星帆、蓮如 (已結婚)</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</span><span class="slide">
											<div class="lists">
												<ul>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="/images/index6/success-15.jpg" alt=""></div>
															<div class="text-box"><span class="up">彥漢 (左):</span>
																我們在信仰與價值觀念很合，個性都很隨和，相處上沒有過多的眉眉角角，還好有這個交友平台，結婚一年多，很幸福。
																<span>彥漢、恩琦 (已結婚)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="/images/index6/success-16.jpg" alt=""></div>
															<div class="text-box"><span class="up">佳琳 (右):</span>
																我們想法很接近，常常在想同一件事，甚至同時說出來，永遠抓的到對方的tone，他懂我知道我需要什麼，也很主動為我分擔。
																<span>定廉、佳琳 (已結婚)</span>
															</div>
														</div>
													</li>
													<li>
														<div class="card-sty8">
															<div class="img-box"><img
																	src="/images/index6/success-17.jpg" alt=""></div>
															<div class="text-box"><span class="up">秀昌 (右):</span>
																我們都是第一次約會就遇到對方，興趣很像，喜歡吃吃喝喝，還有一起看動畫、玩遊戲，很接近我理想中的關係。
																<span>秀昌、佑甄 (準備結婚)</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</span>
									</div>
								</div> <a id="success_laptop_prev" class="control prev"></a> <a id="success_laptop_next"
									class="control next"></a>
								<ul class="dotsList">
									<li class=""><i></i></li>
									<li class=""><i></i></li>
									<li class=""><i></i></li>
									<li class="active"><i></i></li>
									<li class="active"><i></i></li>
									<li class="active"><i></i></li>
									<li class=""><i></i></li>
									<li class=""><i></i></li>
									<li class=""><i></i></li>
									<li><i></i></li>
									<li><i></i></li>
									<li><i></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="mobile-display-block">
					<div class="success_mobile_block">
						<div class="success-slider slider-sty1">
							<div class="wrapper">
								<div class="slides"><span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-1.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">嘉駿 (左):</span>
															我們有多重身分，不僅是男女朋友，還是最好的閨蜜，更是最支持彼此的家人，生活中充滿了無法套招的默契。
															<span>嘉駿、湘羽 (交往中)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/feedback-17.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">元朗 (右):</span>
															我遇到了soulmate，身心靈都很合，我們之間的分享很細膩而且通透，兩個人在感受力、智商、價值觀都很接近
															<span>聖果、元朗 (準備結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-2.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">佳儒 (左):</span>
															我找到心靈上能互相扶持的伴侶，我們的個性互補，興趣、價值觀相仿，一切都在相處中越來越好。
															<span>佳儒、彥志 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-3.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">阿仁 (左): </span>
															用過超多軟體...聊過及見過超多的約會對象，但結果都不盡人意，感謝這裡的專業心理學配對，讓我們相遇，她是真正適合我的人。
															<span>阿仁、莊敏 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-4.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">郁富 (左):</span>
															我們是彼此的靈魂伴侶，價值觀相近，有共同的未來藍圖，很有默契，還生了一對可愛的雙胞胎
															<span>郁富、昀祁 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-5.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">庭君 (左):</span>
															覺得很神奇，像認識很久一般的自然，個性、價值觀都很合，已推薦給三四個朋友，因為老公的朋友也在這裡認識現在的老婆。
															<span>濠隆、庭君 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-6.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">伯彥 (右):</span>
															我找到能一起分享喜悅與煩惱，彼此相似又互補，將肩並肩走一輩子的愛情，不害怕揭露脆弱，低落時能夠陪伴和扶持。
															<span>伯彥、少培 (準備結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-11.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">星帆 (右):</span>
															感到非常幸福，過去在各種交友管道都無法順利找到契合的對象，在這裡不到半年內就找到生命中的那個人。
															<span>星帆、蓮如 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-12.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">曉萱 (左):</span>
															真的很感謝你們讓我們相遇，我在工作時遇到傷心難過的事情時，老公是我最大的心靈後盾，我真的很開心能跟他結婚。
															<span>珈榮、曉萱 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-14.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">雅如 (左):</span>
															第一次見面時，感覺話題都聊不完，結婚一年，遇到對的人、了解我的人，可以一起努力相伴一生，覺得幸福。
															<span>韋翔、雅如 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-15.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">彥漢 (左):</span>
															我們在信仰與價值觀念很合，個性都很隨和，相處上沒有過多的眉眉角角，還好有這個交友平台，結婚一年多，很幸福。
															<span>彥漢、恩琦 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-16.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">佳琳 (右):</span>
															我們想法很接近，常常在想同一件事，甚至同時說出來，永遠抓的到對方的tone，他懂我知道我需要什麼，也很主動為我分擔。
															<span>定廉、佳琳 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-17.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">秀昌 (右):</span>
															我們都是第一次約會就遇到對方，興趣很像，喜歡吃吃喝喝，還有一起看動畫、玩遊戲，很接近我理想中的關係。
															<span>秀昌、佑甄 (準備結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-18.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">柏伸 (右):</span>
															我們會很有默契地做出同樣決定，像是不約而同穿著同樣顏色的衣服，內在邏輯很類似，所以溝通也比較容易
															<span>柏伸、玖慧 (已結婚)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span> <span class="slide">
										<div class="lists">
											<ul>
												<li>
													<div class="card-sty8">
														<div class="img-box"><img src="/images/index6/success-20.jpg"
																alt=""></div>
														<div class="text-box"><span class="up">意然 (左):</span>
															我有主見，他很隨和，這點我們很合，他很體貼，是適合一起生活的人。
															<span>泰億、意然 (交往中)</span>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<!-- <a href='<c:url value="/t6_23/iWantMatch.controller" />'></a> -->
			<a href='<c:url value="/t6_23/upDateMatchData.controller" />'>修改配對資料</a>

			<jsp:include page="/front_index/index-FrontToButtonMVC.jsp" />


			<script>
				document.querySelector('#seMatch').addEventListener('click', function () {
					window.location.href = '<c:url value="/t6_23/iWantMatch.controller" />';
				});
			</script>
			<script src="https://www.meettheone.com.tw/js/compiled-287/manifest.js"></script>
		</body>

		</html>