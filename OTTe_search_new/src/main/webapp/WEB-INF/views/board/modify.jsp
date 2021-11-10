<%@ include file="../include/header.jspf"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Home</title>

<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/plyr.css" type="text/css">
<link rel="stylesheet" href="../resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css">

<link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />

<link href="../resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="../resources/js/jquery-3.3.1.min.js"></script>


<body>
	<!-- Page Preloder -->
	<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
	
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to the official Animeï¿½ï¿½blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<div class="row text-center" style="width: 100%">

		<div style="width: 70%; float: none; margin: 0 auto">
			<tr>
				<form action="/board/modify" method="post">
					<div class="card border-primary mb-3"
						style="max-width: 80rem; margin: auto;">
						<div class="card-header">
							<input name="num" value="${board.num}" style="display: none;" readonly>
							<input type="text" name="title" class="form-control" value="${board.title}" placeholder="${board.title}" readonly>
							<input type="text" name="name" value="${user.userid}" style="display: none;" readonly>
						</div>
						<div class="card-body">
							<h4 class="card-title"></h4>
							<p class="card-text">
								<textarea class="form-control" name="content" id="exampleTextarea" rows="20" placeholder="${board.content}" value="${board.content}" ></textarea><!-- ìë³¸ë¶ë¬ì¤ê¸° -->
							</p>
							<div class="box-body">
								<div class="form-group" id="filedropHere">
									<label for="exampleInputEmail1">File DROP Here</label>
									<div class="fileDrop" ></div>
								</div>
								<div class="box-footer">
									<div>
										<hr>
									</div>
									<ul class="mailbox-attachments clearfix uploadedList">
									</ul>
								</div>
							</div>
							<p>
								<button class="btn btn-secondary my-2 my-sm-0" type="submit">수정하기</button>
							</p>
						</div>
					</div>
				</form>
			</tr>
		</div>
		<!-- /.box-body -->

	</div>
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<input type="text" name="filename" value="{{fullName}}" style="display: none;" readonly>
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>              
</script>

<script>
	var template = Handlebars.compile($("#template").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		S
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		var formData = new FormData();
		formData.append("file", file);
		$("#filedropHere").hide();
		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});
	
	$(".uploadedList").on("click", "small", function(event){
		
		 var that = $(this);
	
	   $.ajax({
		   url:"deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("data-src")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.parent("div").remove();
			   }
		   }
	   });
}); 
</script>

<%@ include file="../include/footer.jspf"%>