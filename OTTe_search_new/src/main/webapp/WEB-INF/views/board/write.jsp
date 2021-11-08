<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<%
	HttpSession httpSession = request.getSession(false);
	if (httpSession != null && httpSession.getAttribute("login") != null) {
	%>
	"세션이 있습니다."
	<%
	} else {
	%>
	"세션이 없습니다."
	<%
	}
	%>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="./index.html"> </a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li><a href="./index.html">Homepage</a></li>
								<li><a href="./categories.html">Categories <span
										class="arrow_carrot-down"></span></a>
									<ul class="dropdown">
										<li><a href="./categories.html">Categories</a></li>
										<li><a href="./anime-details.html">Anime Details</a></li>
										<li><a href="./anime-watching.html">Anime Watching</a></li>
										<li><a href="./blog-details.html">Blog Details</a></li>
										<li><a href="./signup.html">Sign Up</a></li>
										<li><a href="./login.html">Login</a></li>
									</ul></li>
								<li><a href="./blog.html">Our Blog</a></li>
								<li><a href="#">Contacts</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="header__right">
						<a href="#" class="search-switch"><span class="icon_search"></span></a>
						<a href="./login.html"><span class="icon_profile"></span></a>
					</div>
				</div>
			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to the official Anime��blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<div class="row text-center" style="width: 100%">

		<div style="width: 70%; float: none; margin: 0 auto">
			<tr>
				<form action="/board/write" method="post">
					<div class="card border-primary mb-3"
						style="max-width: 80rem; margin: auto;">
						<div class="card-header">
							<input type="text" name="title" class="form-control" placeholder="제목을 입력해 주세요">
							<input type="text" name="name" value="${login.userid}" style="display: none;" readonly>
						</div>
						<div class="card-body">
							<h4 class="card-title"></h4>
							<p class="card-text">
								<textarea class="form-control" name="content" id="exampleTextarea" rows="20"></textarea>
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
								<button class="btn btn-secondary my-2 my-sm-0" type="submit">등록</button>
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