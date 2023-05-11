<%@page import="sixteam.t6_21.model.*"%>
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
<link href="../background_index/css/index_backgroundOnly.css"
	rel="stylesheet" />

<link href="../background_index/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${pageContext.request.contextPath}/ck/js/ck.js"></script>
<link rel="stylesheet" href="../ck/css/ck.css" />
<script type="text/javascript">
	function openFile1(event) {
		var input = event.target; //取得上傳檔案
		var reader = new FileReader(); //建立FileReader物件
		reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串
		reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
			var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
			$('#output1').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
		};
	}

	function openFile2(event) {
		var input = event.target; //取得上傳檔案
		var reader = new FileReader(); //建立FileReader物件
		reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串
		reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
			var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
			$('#output2').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
		};
	}
</script>
</head>

<body class="sb-nav-fixed">

	<div>
		<jsp:include page="/background_index/index-backToMVC.jsp" /></div>


	<div id="layoutSidenav_content" style="margin-left: 250px">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4" style="text-align: center">課程總覽</h1>
				<ol class="breadcrumb mb-4">
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<!--                                 DataTable Example -->
					</div>
					<div class="card-body">
						<form id="form1" name="form1" method="post"
							action="insertClass.controller" enctype="multipart/form-data">

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程名稱</label>
								<div class="col-sm-10">
									<input type="text" name="name" required="required" id="name" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程老師</label>
								<div class="col-sm-10">
									<input type="text" name="teacher" id="teacher"
										required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程價錢</label>
								<div class="col-sm-10">
									<input type="number" name="price" id="price" min="0"
										max="10000" required="required" />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程圖片</label>
								<div class="col-sm-10">
									<img id="output1" height='100' width='80' style="display: none">
									<input type="file" name="classFile" onchange="openFile1(event)"
										accept=".jpg,.png" required />
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">老師照片</label>
								<div class="col-sm-10">
									<img id="output2" height='100' width='80' style="display: none">
									<input type="file" name="teacherFile"
										onchange="openFile2(event)" accept=".jpg,.png" required />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程分類</label>
								<div class="col-sm-10">
									<select name="classtype" id="classtype" required>
										<option value="西方宗教">西方宗教</option>
										<option value="東方占卜">東方占卜</option>
										<option value="星座運勢">星座運勢</option>
										<option value="道教">道教</option>
										<option value="佛教">佛教</option>
										<option value="本土宗教">本土宗教</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程位置</label>
								<div class="col-sm-10">
									<select name="classaddress" id="classaddress" required>
										<option value="桃園市中壢區新生路二段421號聖德學院201教室">桃園市中壢區新生路二段421號聖德學院201教室</option>
										<option value="台北市中正區貴陽街一段56號東吳大學城中校區教室">台北市中正區貴陽街一段56號東吳大學城中校區教室</option>
										<option value="台北市北投區大業路65巷89號(農禪寺)">台北市北投區大業路65巷89號(農禪寺)</option>
										<option value="輔仁大學宗教學系201教室(新北市新莊區中正路510號)">輔仁大學(新北市新莊區中正路510號)</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">課程日期</label>
								<div class="col-sm-10">
									<input type="date" name="classdate" id="classdate" required />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">人數上限</label>
								<div class="col-sm-10">
									<input type="number" min="1" max="30" name="classpeople"
										id="classpeople" required />
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label">活動資訊</label>
								<div class="col-sm-10">
									<textarea cols="20" rows="10" name="classInformation"
										id="editor"></textarea>
								</div>
							</div>
							<div>
								<input type="button" value='一鍵輸入'
									class="btn btn-info btn-user btn-block" id="inputform">
								<input type="submit" class="btn btn-success"
									style="margin-left: 550px">

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
	<script src="../background_index/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="../background_index/assets/demo/chart-area-demo.js"></script>
	<script src="../background_index/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="../background_index/js/datatables-simple-demo.js"></script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/36.0.0/super-build/ckeditor.js"></script>

	<script>
	let YourEditor1;
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
    }).then(editor => {
window.editor = editor;
YourEditor1 = editor;
})
        
        $(function () {
            
          $('#inputform').on('click',function(){
                    $('#name').val('塔羅牌占卜師培訓班，完整教學免費複訓，打造第二收入，開始斜槓人生')
                    $('#teacher').attr('value','陳寬泰')
                    $('#price').attr('value','3000')
                    $('#classtype').attr('value','星座運勢')
                    $('#classaddress').attr('value','台北市中正區貴陽街一段56號東吳大學城中校區教室')
                    $('#classdate').attr('value','2023-03-20')
                    $('#classpeople').attr('value','20')
                    YourEditor1.setData('<p><span style="color:rgb(26,188,156);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; </span></span><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">講師簡介</span></span></p><p>&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">陳寬泰</span></span>&nbsp; &nbsp; 專研領域:</p><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>Milton米爾頓語言模式</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>NLP神經語言學</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>NGH 催眠調整</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>合一祝福傳導師</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>般尼克療癒法</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>西瓦心靈術</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>銷售心理學</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>&nbsp;</p></address><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; 什麼是塔羅牌？</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">是一套從15世紀中期於歐洲各地流傳的占卜卡片，例如：義大利塔羅牌、法國塔羅牌及奧地利Königrufen，許多至今仍然在使用。在18世紀後期，一些塔羅牌開始透過閱讀塔羅牌和紙牌卜卦的占卜而導致發展以此類為目的之神秘學說。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; 學會占卜可以做什麼？</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">1. 替自己找到人生解答，更可以協助他人跳脫困境，開啟第二收入。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">2. 透過直播或活動舉辦連結更多人脈。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">3. 身心靈工作者可以結合專長結合課程。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">4.&nbsp;藉由占卜前的靜心冥想，連結內在力量，提升直覺力，可以替精神和身體「減輕壓力」、「釋放情緒」。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">5. 占卜時，能跳脫慣性思考，進行潛能探索，喚醒內在力量，達成目標。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">6. 藉由潛意識的力量，探索內在，認識自己，達到「平衡身心」、「知行合一」、促進健康增強活力。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(26,188,156);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; </span></span><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">哪些人適合學習占卜？</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨身心靈工作者：命理諮詢老師、牌卡占卜師、神秘學相關老師、心理輔導諮詢師</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨企業主管：組織輔導工作、業務銷售工作者。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨服務業：服務門市工作者、需要大量與人動溝通工作者。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">🌸 本班特色</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨4-8人迷你小班制，額滿即止。‼️早鳥優惠NT$ 8500元‼️</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ 完整</span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">兩個全天</strong></span></span><span style="font-size:18px;"><span style="box-sizing:border-box;">，深度了解、密集訓練，業界少有的占卜師保證班</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ </span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">附贈</strong></span></span><span style="font-size:18px;"><span style="box-sizing:border-box;">價值$1930的</span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">塔羅占卜師必備魔法包</strong></span></span><span style="font-size:18px;"><span style="box-sizing:border-box;">。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">&nbsp; &nbsp;&nbsp;含：專業塔羅牌 1 副、高品質占卜布 1 條、曼陀羅禪卡 1 套。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ 分析個案問題諮詢應用，100%解決客人的大小問題。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨&nbsp;塔羅牌意深度解讀乾貨。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ 贈獨家曼陀羅禪卡簡易應用。</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(211,84,0);font-size:18px;"><span style="box-sizing:border-box;">✨ 另外加贈12堂課(學員限定），完整學習，立刻上手。</span></span></p><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 潛意識對話引導</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 腦空間核心清理程式</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 潛意識解析語言結構</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 深層放鬆舒壓三步驟</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 轉換心情的情緒工具</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><p>✅ 改變人生的關鍵思維</p></address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</address><address style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</address><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(26,188,156);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; </span></span><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">課程地點</span></span>&nbsp;<br><br><span style="font-size:18px;"><span style="box-sizing:border-box;">教室地址:</span></span>&nbsp;<br><span style="font-size:18px;">台北市中正區貴陽街一段56號東吳大學城中校區教室</span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(26,188,156);font-size:24px;"><span style="box-sizing:border-box;">🌸&nbsp; </span></span><span style="color:rgb(41,128,185);font-size:24px;"><span style="box-sizing:border-box;">費用及開班日期</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">占卜師完整培訓</span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">早鳥價 $3000</strong></span></span><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ 附贈</span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">塔羅占卜師必備魔法</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">✨ 假日班(六)。</span></span><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;">剩餘3位</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">3/20六 10:00-19:00 (有時會晚半小時下課)&nbsp;<br>&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">✨階可免費複訓</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="font-size:18px;"><span style="box-sizing:border-box;">小班制座位有限敬請把握機會</span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><h2 style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">✨注意事項</strong></span></span></h2><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">◆ <span style="background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:;"><span style="-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;" noto="" jhenghei="">每堂課有最低開課名額，若未達門檻或其他因素無法開課將會於課程日三天前告知。</span></span>&nbsp;<br>◆ <span style="background-color:rgb(255,255,255);color:rgb(0,0,0);font-family:;"><span style="-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;" noto="" jhenghei="">如因天災等不可抗力之因素取消活動，我們將主動聯繫延期或退款。</span></span>&nbsp;<br>◆ 有任何疑問請寄信至teemin20230202@gmail.com，將有專人為您服務</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei="">&nbsp;</p><h2 style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(0, 0, 0);font-family:;" noto="" jhenghei=""><span style="color:rgb(192,57,43);font-size:18px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">✨活動地圖</strong></span></span></h2>');
                    		});	
                 })
                 
//                   document.querySelector('#inputform').addEventListener('click', function(e) {
// 	  e.preventDefault();
//     document.querySelector('input[name="name"]').value = "【美好的一天】公益走讀～木柵指南宮";
//     document.querySelector('input[name="teacher"]').value = "2023-05-05";
//     document.querySelector('input[name="end"]').value = "2023-05-06";
//     document.querySelector('input[name="location"]').value = "貓纜指南宮站";
//     document.querySelector('input[name="host"]').value = "指南宮";
//     document.querySelector('input[name="signUpNum"]').value = 0;
//     document.querySelector('input[name="num"]').value = 45;
//     document.querySelector('input[name="price"]').value = 2500;
//     YourEditor.setData('<div class="style-08a13ad7-event-detail" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(117, 117, 117);display:flex;font-family:;" noto="" jhenghei=""><main class="style-5a46efb2-event-detail-content" style="border-radius:16px;box-sizing:border-box;display:block;flex:1 1 0%;font-size:16px;max-width:calc(100% - 300px);word-break:break-word;" role="main"><section class="style-906f804a-event-content-container" style="box-sizing:border-box;display:block;padding:15.5938px 48px;"><div class="style-ed4696a1-event-content-section-title" style="border-bottom:1px solid rgb(245, 245, 245);box-sizing:border-box;color:rgb(38, 38, 38);font-size:24px;margin-bottom:2rem;padding-bottom:10px;"><strong>【美好的一天】公益走讀～木柵指南宮</strong></div><div class="style-ed4696a1-event-content-section-title" style="border-bottom:1px solid rgb(245, 245, 245);box-sizing:border-box;color:rgb(38, 38, 38);font-size:24px;margin-bottom:2rem;padding-bottom:10px;"><strong>活動資訊</strong></div><article class="style-225f7a48-event-content" style="box-sizing:border-box;color:rgb(0, 0, 0);display:block;overflow-wrap:break-word;position:relative;"><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">安排一趟朝聖之旅，不僅可以欣賞建築藝術，豐富生活美感，了解祝福情意，還可以學習古聖先賢「凝神調息、安頓身心」的方法，加上台灣的廟宇不只是祈福信仰的中心，也是蘊含文化的藝術殿堂，往往隱身在名山美景當中，或是發展為市街的起點，或是成為美食的所在，<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">規劃以廟宇為主軸的小旅行，搭配周遭景點，能夠兼具藝術、歷史、美食、心靈等目的，並且在旅行的當下同時滿足知性、娛樂與健康的需求</strong>。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動規劃</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📅<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">活動時間</strong>：2023年2月20日(一)上午10:00-11:30（請提前10分鐘報到）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📌<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">集合地點</strong>：貓纜指南宮站（準時出發，逾時不候）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">🚩<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">路線安排：</strong>貓纜指南宮站(集合)→凌霄寶殿→祈夢房→純陽寶殿（解散）</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📢<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">主辦單位</strong>：美遊記</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">📢<strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">活動費用</strong>：800</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉景點介紹</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">【木柵指南宮】</strong>指南宮之名是取「呂恩主在天庭居於南宮」、「濟世度人必須要指南針」之意，主要侍奉呂洞賓（呂恩主），俗稱「仙公廟」，目前已成為儒道釋三教同體的廟宇，被認為是臺灣道教聖地之一，也是指南地區主要的信仰。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">指南宮主祀神純陽祖師呂洞賓，正式名稱是「孚佑帝君」，但民間習稱仙公或呂祖。呂祖是唐朝時人，飽讀詩書，曾考中進士，做過縣令，因為虔心慕道，得遇正陽祖師鍾離權仙師，以黃粱大夢點化，點石成金試測，傳授心法，終成大道，位列仙班。但因立有「度盡世人」的宏願，所以經常顯化民間「濟世度人，解難救厄」，留下了許多民間親和的神跡佳話，是我國民眾最親近和熟悉的道教神仙。</span></span><br><br><span style="font-size:20px;"><span style="box-sizing:border-box;">宮殿園區佔地廣，古木參天，濃蔭蔽日。全宮共有純陽寶殿、凌霄寶殿、大雄寶殿及大成寶殿等殿宇。主殿均是依山而建，宏偉莊嚴，建築多採堅固青斗石，部分殿宇並用銅瓦覆蓋，可歷千年。純陽與凌霄兩殿間有長廊相連，亭池台榭，四時花開，空氣清新，可以一覽臺北市遠近景觀，被譽為「天下第一靈山」。更經常辦理各項大型宗教活動，參與國際弘道事務，聲名遠播。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:411px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110448461232051326.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:510px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110449366704605200.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:906px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110450311452241230.jpg" alt=""></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動特色</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅透過五感仔細觀察「廟宇裝飾」，欣賞「吉祥圖案」寓意及美的的事物。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅學習運用圖騰符號，表達祝福情意，豐富生活美感。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅在有「天下第一靈山」美名之處俯瞰臺北市遠近景觀。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅輕鬆學習可以改變身心狀態的簡單動作，讓自己保持身心均安。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉活動流程</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><img class="image_resized" style="border-style:none;box-sizing:border-box;height:573px;max-width:100%;width:680px;" src="https://static.accupass.com/eventintro/2302110519049417569360.jpg" alt=""></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉注意事項</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅如遇人力不可抗力之天災或天候不佳等因素，主辦單位得考量安全等因素取消活動以確保參加者安全。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅本活動之錄影、相片等，為主辦單位版權所有，主辦單位將用於活動紀錄，新聞發布及後續行銷之用，如不同意可隨時告知，已發布者亦可撤除。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅主辦單位保有更動、暫停或取消活動內容之權利，若有任何關於活動的最新消息，將於相關平台更新，以上活動事項如有未盡事宜，主辦單位得隨時修正公布之，恕不另行通知。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅無故未到者，於活動中途脫隊、脫隊者，均視為自願放棄，亦不接受中途加入行程。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請參加人員視身體狀況，自行斟酌：準備穿戴輕便服裝、防滑鞋子、遮陽帽子、防曬防蚊蟲準備、雨具、個人藥品、飲用水瓶、協助支撐手杖。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請於規定報到時間說明準時抵達，以免影響活動參與品質與自身權益。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅本次活動為免費報名參加，請勿重複報名，如報名者無故遲到、未到或故意、惡意干擾報名者，以致影響其他人的權益，往後不得再參與美遊記主辦的相關活動。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">✅請確實填寫「真實中文姓名」「電話」「電子郵件」資料，以利寄送相關活動內容和通知。</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉推薦活動</strong>：</span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:24px;"><span style="box-sizing:border-box;">📣</span></span><a style="background-color:transparent;box-sizing:border-box;color:rgb(46, 163, 242);text-decoration:none;transition:all 0.2s ease 0s;" href="https://www.accupass.com/event/2301201208321805327511" target="_blank"><span style="font-size:24px;"><span style="box-sizing:border-box;">松山迎財神｜十大財神x推薦美食x體驗活動</span></span></a></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;">&nbsp;</p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="background-color:rgb(192,57,43);color:rgb(255,255,255);font-size:24px;"><span style="box-sizing:border-box;"><strong style="box-sizing:border-box;color:inherit;font-weight:bolder;">👉聯絡資訊：</strong></span></span></p><p style="box-sizing:border-box;margin:0px 0px 20px;padding:0px;"><span style="font-size:20px;"><span style="box-sizing:border-box;">請於週一～週五上班時間（10:00~17:00），透過電話 666-666 或 透過信件 god@666.com 聯絡大中天先生，謝謝您。</span></span></p></article></section></main></div><section class="style-3e1ff301-event-map-container" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-radius:0px 0px 16px 16px;box-sizing:border-box;color:rgb(117, 117, 117);display:block;font-family:;" noto="" jhenghei=""><div class="style-1e60ef33-event-address-container" style="align-items:center;box-sizing:border-box;display:flex;flex-direction:column;margin-top:25px;"><p class="style-21c33753-event-address" style="box-sizing:border-box;color:rgb(149, 155, 161);margin:0px;padding:0px;text-align:center;"><strong>台灣台北市集合地點：貓纜指南宮站</strong></p></div></section>');
    
//   });
                 
           
    </script>
</body>

</html>

</body>
</html>