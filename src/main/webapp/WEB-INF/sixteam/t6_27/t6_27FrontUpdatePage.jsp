<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>

<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="icon" href="front_index/img/logo.png" type="image/png" />
<title>神明便利店</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/flaticon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/themify-icons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/vendors/nice-select/css/nice-select.css" />
<!-- main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/style.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<link href="front_index/css/t6_27/editor.css" rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!--    icon -->
<script src="https://kit.fontawesome.com/8bf3b6e829.js"
	crossorigin="anonymous"></script>
<!-- 	測試sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.x"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.post-h1 {
	text-align: center
}

.post-select {
	font-size: 20px;
	width: 25%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
	color: #003060;
	font-weight: bolder;
}

#post-label {
	font-size: 25px;
	font-weight: bold;
}
</style>

</head>

<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<div class="search_input" id="search_input_box">
				<div class="container">
					<form class="d-flex justify-content-between" method="" action="">
						<input type="text" class="form-control" id="search_input"
							placeholder="Search Here" />
						<button type="submit" class="btn"></button>
						<span class="ti-close" id="close_search" title="Close Search"></span>
					</form>
				</div>
			</div>

			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.html"><img
						src="front_index/img/logo.png" alt="" /></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><c:choose>
									<c:when test="${not empty LoginOK }">
										<a class="nav-link" href="../logout"
											style="font-size: 18px; font-weight: bold"> 登出 </a>
									</c:when>
									<c:otherwise>
										<a class="nav-link" href="../login"
											style="font-size: 18px; font-weight: bold"> 登入 </a>
									</c:otherwise>
								</c:choose></li>
							<c:choose>
								<c:when test="${ LoginOK.roles eq 'ROLE_USER,ROLE_ADMIN' }">
									<li class="nav-item active"><a class="nav-link"
										href="../toBackIndex"
										style="font-size: 18px; font-weight: bold"> 後台系統 </a></li>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"
								style="color: #fdc632; font-size: 18px; font-weight: bold">購物商城</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="../showAllClass.controller">改運課程</a></li>
									<li class="nav-item"><a class="nav-link"
										href="../courses.html">運勢小物</a></li>
									<!--                     <li class="nav-item"> -->
									<!--                       <a class="nav-link" href="elements.html">Elements</a> -->
									<!--                     </li> -->
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"
								style="color: #fdc632; font-size: 18px; font-weight: bold">功能導覽</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="blog.html"></a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">近期活動</a></li>
									<li class="nav-item"><a class="nav-link"
										href="../t6_27showFrontforumPage.controller">信徒論壇</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">姻緣配對</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">住宿訂房</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link" href="contact.html"
								style="color: #fdc632; font-size: 18px; font-weight: bold">聯絡我們</a></li>
							<li class="nav-item"><a href="#" class="nav-link search"
								id="search"> <i class="ti-search"></i>
							</a></li>
						</ul>
						<div class="col-lg-3 col-6 text-right">



							<!-- 						  <div class="rounded-circle border border-secondary" style="width: 50px; height: 50px; margin:10px;"> -->
							<!--        <a href="/profile">  -->
							<!--     <img src="/t6_10_showNowImg.controller" class="w-100 h-100" alt="找不到用戶圖"> -->
							<!--     	</a> -->
							<!--   </div> -->
							<!-- 							<a href="" class="btn border"> <i -->
							<!-- 								class="fas fa-heart text-primary" style="color: #fdc632"></i> <span -->
							<!-- 								class="badge">${shoppingCart.getItemNumber()}</span> -->
							<!-- 							</a>  -->
							<a href="../showshoppingcart.controller" class="btn border">
								<i class="fas fa-shopping-cart" style="color: #fdc632"></i> <c:choose>
									<c:when test="${ ! empty ShoppingCart }">
										<span class="badge" style="color: #fdc632">${ShoppingCart.getItemNumber()}</span>
									</c:when>
									<c:otherwise>
										<span class="badge" style="color: #fdc632">0</span>
									</c:otherwise>
								</c:choose>
							</a> <a href="../loginToProfile"> <img
								src="/t6_10_showNowImg.controller" class="rounded-circle"
								alt="找不到用戶圖" width="40px" height="40px"
								style="margin-left: 30px">
							</a>
						</div>

					</div>
				</div>
			</nav>
		</div>
		<!-- Alternate來回 slide進一次停 scroll重複 -->
		<!-- 		<marquee behavior="scroll" onMouseOver="this.stop()" -->
		<!-- 			onMouseOut="this.start()" height="100" direction="right" -->
		<!-- 			scrolldelay="4" scrollamount="12"> -->

		<!-- 			<img src='../front_index/img/announce.gif' width='50px' height='50px'> -->
		<!-- 			<span style='color: white; font-size: 24px'>快訊:巴拉巴拉</span> -->

		<!-- 		</marquee> -->

		<!-- 		<marquee direction="down" width="250" height="200" -->
		<!-- 			behavior="alternate" style="border:"> -->
		<!-- 			<marquee behavior="alternate"> -->
		<!-- 				<img src='../front_index/img/DVD.png' width='50px' height='50px'> -->
		<!-- 			</marquee> -->
		<!-- 		</marquee> -->

	</header>
	<!--================ End Header Menu Area =================-->
	<!--================ Start Home Banner Area =================-->
	<section class="home_banner_area">
		<div class="banner_inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="banner_content text-center">
							<p class="text-uppercase">
								<!--                   世界越快，心靈越慢 -->
							</p>
							<h2 class="text-uppercase mt-4 mb-5">
								<!--                   專為台灣信徒打造的網站 -->
							</h2>
							<!--                 <div> -->
							<!--                   <a href="#" class="primary-btn2 mb-3 mb-sm-0">點此進入</a> -->
							<!--                   <a href="#" class="primary-btn ml-sm-3 ml-0">點此進入</a> -->
							<!--                 </div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End Home Banner Area =================-->
	<div class="card mb-4">

		<div class="card-body">

			<Form action="<c:url value='../t6_27showFrontforumPage.controller'/>"
				method="GET" name="loginForm">
				<input type="submit" value="回論壇首頁">
			</Form>

			<h1 class="post-h1">
				<strong> 修改文章 </strong>
			</h1>

			<hr>

			<form action="<c:url value='/t6_27updatefront.controller'/>"
				method="post" enctype="multipart/form-data">



				<div class="form-group row">

					<label for="inputPassword" class="col-sm-1 col-form-label"
						id="post-label">看板</label>
					<div class="col-sm-11">
						<select id="board-list" name="board" class="post-select"
							required="required">
							<option>紫微斗數</option>
							<option>星座運勢</option>
							<option>塔羅愛情</option>
							<option>十二生肖</option>
							<option>九星命卦</option>
							<option>心理測驗</option>
						</select>
					</div>
				</div>


				<div class="form-group row">
					<label for="inputPassword" class="col-sm-1 col-form-label"
						id="post-label">標題</label>
					<div class="col-sm-11">
						<input type="text" name="title" class="post-select"
							required="required" value="${bean.title}" />
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-1 col-form-label"
						id="post-label">封面圖</label>
					<div class="col-sm-10">
						<input type="file" name="postimg" required="required" />
					</div>
				</div>

				<input type="hidden" name="good" readonly="readonly"
					value="${bean.good}" /> <input type="hidden" name="bad"
					readonly="readonly" value="${bean.bad}" /> <input type="hidden"
					name="postid" readonly="readonly" value="${bean.postid}" /><input
					type="hidden" name="status" readonly="readonly"
					value="${bean.status}" /><input type="hidden" name="viewcount"
					readonly="readonly" value="${bean.viewcount}" />



				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"
						id="post-label">文章內容</label>
					<textarea name="content" id="editor">${bean.content}</textarea>
				</div>
				<div>
					<button type="submit" class="btn btn-success">
						確認<i class="fa-solid fa-circle-check"></i>
					</button>

				</div>
			</form>
		</div>
	</div>

	<!--================ Start footer Area  =================-->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Top Products</h4>
					<ul>
						<li><a href="#">Managed Website</a></li>
						<li><a href="#">Manage Reputation</a></li>
						<li><a href="#">Power Tools</a></li>
						<li><a href="#">Marketing Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Quick Links</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Features</h4>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 single-footer-widget">
					<h4>Resources</h4>
					<ul>
						<li><a href="#">Guides</a></li>
						<li><a href="#">Research</a></li>
						<li><a href="#">Experts</a></li>
						<li><a href="#">Agencies</a></li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 single-footer-widget">
					<h4>Newsletter</h4>
					<p>You can trust us. we only send promo offers,</p>
					<div class="form-wrap" id="mc_embed_signup">
						<form target="_blank"
							action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							method="get" class="form-inline">
							<input class="form-control" name="EMAIL"
								placeholder="Your Email Address" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Your Email Address'" required=""
								type="email" />
							<button class="click-btn btn btn-default">
								<span>subscribe</span>
							</button>
							<div style="position: absolute; left: -5000px;">
								<input name="b_36c4fd991d266f23781ded980_aefe40901a"
									tabindex="-1" value="" type="text" />
							</div>

							<div class="info"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="ti-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
						class="ti-twitter"></i></a> <a href="#"><i class="ti-dribbble"></i></a>
					<a href="#"><i class="ti-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->


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



	<!-- 下拉式選單接收board值 -->
	<script>
	document.getElementById("board-list").value = "${bean.board}";
	</script>

	<!-- 下拉式選單接收sort值 -->
	<%--  document.getElementById("sort-list").value = "${bean.sort}"; --%>

	<!-- 下拉式選單接收status值 -->
	<script>
	document.getElementById("status-list").value = "${bean.status}";
	</script>


	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>

	<script type="text/javascript">
//		測試CK
	 // This sample still does not showcase all CKEditor 5 features (!)
	            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
	            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
	                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
	                toolbar: {
	                    items: [
	                        'exportPDF','exportWord', '|',
	                        'findAndReplace', 'selectAll', '|',
	                        'heading', '|',
	                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
	                        'bulletedList', 'numberedList', 'todoList', '|',
	                        'outdent', 'indent', '|',
	                        'undo', 'redo',
	                        '-',
	                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
	                        'alignment', '|',
	                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
	                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
	                        'textPartLanguage', '|',
	                        'sourceEditing'
	                    ],
	                    shouldNotGroupWhenFull: true
	                },
	                // Changing the language of the interface requires loading the language file using the <script> tag.
	                // language: 'es',
	                list: {
	                    properties: {
	                        styles: true,
	                        startIndex: true,
	                        reversed: true
	                    }
	                },
	                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
	                heading: {
	                    options: [
	                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
	                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
	                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
	                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
	                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
	                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
	                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
	                    ]
	                },
	                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
	                placeholder: 'Welcome to CKEditor 5!',
	                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
	                fontFamily: {
	                    options: [
	                        'default',
	                        'Arial, Helvetica, sans-serif',
	                        'Courier New, Courier, monospace',
	                        'Georgia, serif',
	                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
	                        'Tahoma, Geneva, sans-serif',
	                        'Times New Roman, Times, serif',
	                        'Trebuchet MS, Helvetica, sans-serif',
	                        'Verdana, Geneva, sans-serif'
	                    ],
	                    supportAllValues: true
	                },
	                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
	                fontSize: {
	                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
	                    supportAllValues: true
	                },
	                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
	                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
	                htmlSupport: {
	                    allow: [
	                        {
	                            name: /.*/,
	                            attributes: true,
	                            classes: true,
	                            styles: true
	                        }
	                    ]
	                },
	                // Be careful with enabling previews
	                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
	                htmlEmbed: {
	                    showPreviews: true
	                },
	                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
	                link: {
	                    decorators: {
	                        addTargetToExternalLinks: true,
	                        defaultProtocol: 'https://',
	                        toggleDownloadable: {
	                            mode: 'manual',
	                            label: 'Downloadable',
	                            attributes: {
	                                download: 'file'
	                            }
	                        }
	                    }
	                },
	                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
	                mention: {
	                    feeds: [
	                        {
	                            marker: '@',
	                            feed: [
	                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
	                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
	                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
	                                '@sugar', '@sweet', '@topping', '@wafer'
	                            ],
	                            minimumCharacters: 1
	                        }
	                    ]
	                },
	                // The "super-build" contains more premium features that require additional configuration, disable them below.
	                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
	                removePlugins: [
	                    // These two are commercial, but you can try them out without registering to a trial.
	                    // 'ExportPdf',
	                    // 'ExportWord',
	                    'CKBox',
	                    'CKFinder',
	                    'EasyImage',
	                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
	                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
	                    // Storing images as Base64 is usually a very bad idea.
	                    // Replace it on production website with other solutions:
	                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
	                    // 'Base64UploadAdapter',
	                    'RealTimeCollaborativeComments',
	                    'RealTimeCollaborativeTrackChanges',
	                    'RealTimeCollaborativeRevisionHistory',
	                    'PresenceList',
	                    'Comments',
	                    'TrackChanges',
	                    'TrackChangesData',
	                    'RevisionHistory',
	                    'Pagination',
	                    'WProofreader',
	                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
	                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
	                    'MathType'
	                ]
	            });
            
            
</script>



</body>
</html>