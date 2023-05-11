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

#post-label {
	font-size: 25px;
	font-weight: bold;
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

					<form id="form1" name="form1" method="post"
						action="t6_27add.controller" enctype="multipart/form-data">
						<div class="card-body">

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

							<div class="form-group row">
								<label for="inputPassword" class="col-sm-2 col-form-label"
									id="post-label">文章內容</label>
								<textarea name="content" id="editor">${bean.content}</textarea>
							</div>
							<div>
								<button type="submit" class="btn btn-success">
									確認<i class="fa-solid fa-circle-check"></i>
								</button>
								<input type="button" value='一鍵輸入' class="btn btn-info"
									id="inputform">
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

	<script type="text/javascript">
	let editorData;
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
	            }).then(editor => {
	                window.editor = editor;
	                editorData = editor;
	            })      


	<!-- 一鍵輸入 -->

    $(function () {

        var quickcontent='<p class="has-text-align-center" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="color:rgb(205,7,173);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">巨蟹座</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">首先登場的是「人間空調」巨蟹座，典型的春風吹滿地，對誰都好，就算有女朋友也不會停止對別的妹子噓寒問暖。他們是辦公室裡最體貼的乖乖男，沒事就幫女同事搬搬箱子，買買下午茶；逢年過節也不忘在社群裡給學妹學姐發發溫馨的祝福。<br><br>巨蟹座受到月亮這顆散發著母性光輝的行星守護，會習慣性地對女性特別關注，自然會更有女人緣，也比別的星座更懂怎麼體貼、照顧女性。從小到大，他們都很樂意對周遭女性大獻殷勤，如果對方恰好願意接受、並有正面回應，對他而言就會為自信加分，因而更加享受這個過程。這樣的他，並不會在有了女朋友之後就性情大變，自動跟所有女性保持距離。<br><a style="background-color:transparent;box-sizing:border-box;color:rgb(247, 142, 113);pointer-events:auto;text-decoration:none;" href="https://www.click108.com.tw/unit001/item00238/input.php?Vender=NEWS_promote"><span style="color:rgb(0,176,240);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">&gt;&gt;算前世今生，破解兩人的苦戀因果</strong></span></span></a></p><p class="has-text-align-center" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="color:rgb(205,7,173);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">天秤座</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">天秤男很愛揣著明白裝糊塗。當然了，他們跟那種滿口謊話的偷腥男不一樣。他們在跟別的女生互動的時候，會主動說明「我有女朋友了」，但你可別以為這樣就叫做「守男德」，以為對方會嚴以律己。恭喜你啊，你遇到的是不主動、不拒絕、不負責的男人。<br><br>其實上面那句台詞是在告訴你，「我反正告訴你我有女友了，後面會發生什麼你自己要負責哦」。不僅把責任成功轉嫁到協力廠商，還能完美為自己的罪惡感開脫。天秤男在勾搭別人的時候，不覺得自己是出軌或劈腿，只是風流的調個情。他們特別會美化自己，甚至覺得是對方在勾搭自己，自己只是個善解人意又不懂拒絕的好男人罷了。</p><p class="has-text-align-center" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="color:rgb(205,7,173);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">雙子座</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">到處撩妹的雙子座不僅很快樂，還會跟身邊的朋友吹噓自己多厲害，「看見了吧，別看我家裡有個正牌女友，外面的紅顏知己還是一大堆，是不是很羡慕？」許多雙子男，要不是很愛到處認乾妹妹，要不就是很愛打著當哥兒們的幌子，跟不同的妹子適當曖昧，但又保持距離。他們很享受這種感覺。<br><br>作為風象星座裡的變動星座，雙子座的男人註定很難長時間在一個地方落腳，好像必須要找點新的東西，生活才有意思，也才不會感到孤獨。哪怕已經有女朋友，哪怕兩人明明很恩愛，新鮮的人，總是更能吸引他們的目光。<br><a style="background-color:transparent;box-sizing:border-box;color:rgb(247, 142, 113);pointer-events:auto;text-decoration:none;" href="https://jpfate.click108.com.tw/J0809/index.html?Vender=NEWS_promote"><span style="color:rgb(0,176,240);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">&gt;&gt;【日本命理】他對我比較不一樣？</strong></span></span></a></p><p class="has-text-align-center" style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;"><span style="color:rgb(205,7,173);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">雙魚座</strong></span></span></p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">雙魚男在這方面就厲害了，他們是那種跟女朋友吵架了，會跑去別的女生那裡求安慰的人。除了控訴女朋友的缺點，他還會繪聲繪影地把自己描述得多麼深情、孤獨、無人理解。<br><br>不要覺得好笑，還真有不少傻女生，被雙魚座這招賣慘求憐給騙了。女生多少都有點聖母心，遇到可憐男人，就散發出母性的本能。不然怎麼會有句名言說：「心疼男人，就是倒楣的開始」。大部分女人，就是很難克制自己不去心疼男人。<br><br>雙魚男非常知道怎麼利用女性的心理特質來獲得憐愛，而且是越多越好。如果在女朋友身上得不到滿足，他一定會從別的女生那裡找到代償。</p><p style="-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(34, 34, 34);font-family:TaipeiSansTCBeta-Regular;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px auto 26px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;">談感情找對象絕對要睜大眼睛！如果你談感情只追求輕鬆有趣，那麼風趣幽默、會耍浪漫的人選，絕對會讓你時時處於羅曼蒂克的氛圍裡。但如果你想要的是一份穩定的感情，那麼推薦你來批算<a style="background-color:transparent;box-sizing:border-box;color:rgb(247, 142, 113);pointer-events:auto;text-decoration:none;" href="https://www.click108.com.tw/unit001/item00235/input.php?Vender=NEWS_promote"><span style="color:rgb(255,0,0);"><span class="has-inline-color" style="box-sizing:border-box;"><strong style="box-sizing:border-box;">【張盛舒-姓名合盤結緣鑑定】</strong></span></span></a>，張老師將告訴你兩人的價值觀是否接近、適合的相處模式，以及兩人能否長長久久一輩子！</p><figure class="image"><img src="https://gimgs.click108.com.tw/pub/pml/article/love/640x425_22.jpg" alt="愛很難唯一！容易成為劈腿慣犯的4個星座"></figure>'
    	
        $(document).ready(function () {
            $('#inputform').on('click', function () {
                $('#postboard').attr('value', '星座運勢')
                $('#posttitle').attr('value', '愛很難唯一！容易成為劈腿慣犯的4個星座')
            	editorData.setData(quickcontent)
            })


        })
    });

</script>




</body>
</html>