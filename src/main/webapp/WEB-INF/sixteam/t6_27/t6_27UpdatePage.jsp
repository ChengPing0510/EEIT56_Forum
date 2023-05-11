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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front_index/css/bootstrap.css" />

<!-- main css -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/background_index/css/styles.css"
	rel="stylesheet" />

<link href="front_index/css/t6_27/editor.css" rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
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
	width: 35%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
	color: #003060;
	font-weight: bolder;
}

.post-select2 {
	font-size: 20px;
	width: 35%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #99FFFF;
	color: #003060;
	font-weight: bolder;
}

#post-label {
	font-size: 25px;
	font-weight: bold;
}

#myPostTextarea {
	display: none;
}
</style>

</head>

<body class="sb-nav-fixed">
	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>

	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">討論區</h1>
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

					<Form action="<c:url value='/t6_27show.controller'/>" method="GET"
						name="loginForm">
						<input type="submit" value="回文章列表">
					</Form>

					<form action="<c:url value='/t6_27update.controller'/>"
						method="post" enctype="multipart/form-data">
						<div class="card-body">

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">文章編號</label>
								<div class="col-sm-11">
									<input type="text" name="postid" readonly="readonly"
										class="post-select" value="${bean.postid}" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">使用者編號</label>
								<div class="col-sm-11">
									<input type="text" name="usersid" readonly="readonly"
										class="post-select" value="${bean.usersid}" />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">看板</label>
								<div class="col-sm-11">
									<select id="board-list" name="board" class="post-select"
										disabled>
										<option value="紫微斗數" ${bean.board == '紫微斗數' ? 'selected' : ''}>紫微斗數</option>
										<option value="星座運勢" ${bean.board == '星座運勢' ? 'selected' : ''}>星座運勢</option>
										<option value="塔羅愛情" ${bean.board == '塔羅愛情' ? 'selected' : ''}>塔羅愛情</option>
										<option value="十二生肖" ${bean.board == '十二生肖' ? 'selected' : ''}>十二生肖</option>
										<option value="九星命卦" ${bean.board == '九星命卦' ? 'selected' : ''}>九星命卦</option>
										<option value="心理測驗" ${bean.board == '心理測驗' ? 'selected' : ''}>心理測驗</option>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">狀態</label>
								<div class="col-sm-11">
									<select id="board-list" name="status" class="post-select2"
										required="required">
										<c:choose>
											<c:when test="${bean.status == '檢舉'}">
												<option selected>檢舉</option>
												<option>公開</option>
												<option>封鎖</option>
											</c:when>
											<c:when test="${bean.status == '封鎖'}">
												<option selected>封鎖</option>
												<option>公開</option>
												<option>檢舉</option>
											</c:when>
											<c:otherwise>
												<option selected>公開</option>
												<option>檢舉</option>
												<option>封鎖</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">標題</label>
								<div class="col-sm-11">
									<input type="text" name="title" class="post-select"
										readonly="readonly" required="required" value="${bean.title}" />
								</div>
							</div>


							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">推</label>
								<div class="col-sm-11">
									<input type="text" name="good" class="post-select"
										readonly="readonly" required="required" value="${bean.good}" />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">噓</label>
								<div class="col-sm-11">
									<input type="text" name="bad" class="post-select"
										readonly="readonly" required="required" value="${bean.bad}" />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">瀏覽數</label>
								<div class="col-sm-11">
									<input type="text" name="viewcount" class="post-select"
										readonly="readonly" required="required"
										value="${bean.viewcount}" />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-1 col-form-label"
									id="post-label">封面圖</label>
								<div class="col-sm-10">
									<img name="postimg" height='120' width='150'
										src="<c:url value='../t6_27img.controller/${bean.postid}' />">
								</div>
							</div>

							<input type="hidden" name="board">
							<input type="hidden" name="postimg">

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label"
									id="post-label">文章內容</label>
								<p class="excert">${bean.content}</p>
							</div>
							<textarea id="myPostTextarea" name="content"></textarea>
							<div>
								<button type="submit" class="btn btn-success">
									確認<i class="fa-solid fa-circle-check"></i>
								</button>
							</div>
						</div>
					</form>
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

	<!-- 下拉式選單接收board值 -->
	<script>
	document.getElementById("board-list").value = "${bean.board}";
	</script>

	<!-- 下拉式選單接收sort值 -->
	<%--    document.getElementById("sort-list").value = "${bean.sort}"; --%>

	<!-- 下拉式選單接收status值 -->
	<script>
	document.getElementById("status-list").value = "${bean.status}";
	</script>

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