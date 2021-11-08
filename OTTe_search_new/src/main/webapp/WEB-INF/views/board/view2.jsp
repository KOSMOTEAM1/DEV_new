<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page import="org.zerock.domain.BoardVO"%>
<%@ page import="org.zerock.domain.UserVO"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Home</title>


<link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
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
</head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>




	<!-- Breadcrumb Begin / 최상단 Home->자유게시판 -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <span>자유게시판</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<div class="product-page spad">
		<div class="container">
			<div class="col-lg-12">
				<div class="product__page__content">
					<!-- 페이지 제목+검색기능 시작-->
					<div class="product__page__title">
						<div class="row">
							<div class="col-md-6">
								<div class="section-title">
									<h4>자유게시판</h4>
								</div>
								<br></br>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="row" style="width: 100%">
		<div style="width: 70%; float: none; margin: 0 auto">
			<tr>
				<div class="card border-primary mb-3"
					style="max-width: 80rem; margin: auto;">
					<div class="card-header">${RT.num}</div>
					<div class="card-body">
						<h4 class="card-title">${boardVO.title}</h4>
						<img src="../../resources/img/board${boardVO.filename}"
							style="max-width: 100%; height: auto" alt="Attachment"
							id="thumbnail${item.num}">
						<p class="card-text">작성자 = ${boardVO.num}</p>
						<p class="card-text">작성자 = ${boardVO.name}</p>
						<p class="card-text">${boardVO.content}</p>
						<p>
							<c:set var="I1" value="${login.userid}" />
							<c:set var="I2" value="${boardVO.name}" />
							<c:if test="${I1 eq I2}">
								<form action="/board/modify" method="Get">
									<input type="text" name="num" value="${boardVO.num}"
										style="display: none;" readonly>
									<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
								</form>
								<form action="/board/delete" method="post">
									<input type="text" name="num" value="${boardVO.num}"
										style="display: none;" readonly> <input type="text"
										name="originnum" value="${boardVO.num}" style="display: none;"
										readonly>
									<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
								</form>
							</c:if>
						<form action="/board/list2" method="Get">
							<button type="submit" class="btn btn-primary" id="goListBtn">GO
								LIST</button>
						</form>


						</p>
					</div>
					<div class="card-footer">
						<a>테스트 구간입니다.</a>
					</div>

					<div class="col-md-12">
						<c:set var="I1" value="${login.userid}" />
						<c:if test="${I1 != null }">
							<div class="box box-success">
								<div class="box-header">
									<h3 class="box-title">ADD NEW REPLY</h3>
								</div>
								<div class="box-body">
									<label for="exampleInputEmail1">Writer</label> <input
										class="form-control" type="text" id="newReplyWriter"
										value="${login.userid}" style="display: none;" readonly>
									<input class="form-control" type="text"
										placeholder="${login.userid}" readonly> <label
										for="exampleInputEmail1">Reply Text</label> <input
										class="form-control" type="text" placeholder="REPLY TEXT"
										id="newcomemnttext">
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
										REPLY</button>
								</div>
							</div>
						</c:if>
						<ul class="timeline">
							<button type="button" class="btn btn-primary" id="repliesDiv">RepliesList</button>
							<!-- <li class="time-label" id="repliesDiv"><span class="bg-green">RepliesList</span></li> -->
						</ul>
						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">
							</ul>
						</div>
					</div>
			</tr>
			<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="comemnttext" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
							<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-comemntnum={{comemntnum}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time"><i class="fa fa-clock-o"></i>{{comemntdate}}</span>
  <h3 class="timeline-header"><strong>{{comemntnum}}</strong> -{{comemntuser}}</h3>
	<input class="form-control" type="text" id="intimeuser" value="${login.userid}" style="display: none;" readonly>
	<input class="form-control" type="text" id="disReplyWriter" value="{{comemntuser}}" style="display: none;" readonly>
	<div class="timeline-body">{{comemnttext}}</div>
	<div class="timeline-footer">
        <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("comemntdate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var originnum = $
	{
		boardVO.num
	};
	var template = Handlebars.compile($("#templateAttach").html());
	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			/* $("#modifyModal").modal('hide'); */

		});
	}

	$("#modifyModal").on("click", function() {
		$("#modifyModal").modal('show');
	});

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		/* if ($(".timeline li"). length() > 1) {
			return;
		} */
		getPage("/replies/" + originnum + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {

		event.preventDefault();

		replyPage = $(this).attr("href");

		getPage("/replies/" + originnum + "/" + replyPage);

	});

	$("#replyAddBtn").on("click", function() {
		alert("기능을 실행합니다.");
		var replyerObj = $("#newReplyWriter");
		var comemnttextObj = $("#newcomemnttext");
		var comemntuser = replyerObj.val();
		var comemnttext = comemnttextObj.val();
		if (comemntuser != "") {
			if (comemnttext != "") {
				$.ajax({
					type : 'post',
					url : '/replies/insert',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						originnum : originnum,
						comemntuser : comemntuser,
						comemnttext : comemnttext
					}),
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다.");
							replyPage = 1;
							getPage("/replies/" + originnum + "/" + replyPage);
							replyerObj.val("");
							comemnttextObj.val("");
						}
					}
				});
			} else {
				alert("내용을 입력해 주세요");
			}
		} else {
			alert("다시 로그인 해주세요");
		}

	});

	$(".timeline").on("click", ".replyLi", function(event) {

		var reply = $(this);

		$("#comemnttext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-comemntnum"));

	});

	$("#replyModBtn").on("click", function() {

		var comemntnum = $(".modal-title").html();
		var comemnttext = $("#comemnttext").val();

		var userObj = $("#intimeuser");
		var comemntuserObj = $("#disReplyWriter ");
		var originuser = userObj.val();
		var comemntuser = comemntuserObj.val();
		if (originuser != comemntuser) {
			alert("권한이 없는 사용자 입니다.");
		} else {
			$.ajax({
				type : 'put',
				url : '/replies/' + comemntnum,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					comemnttext : comemnttext
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						getPage("/replies/" + originnum + "/" + replyPage);
					}
				}
			});
		}

	});

	$("#replyDelBtn").on("click", function() {
		alert("시작되었습니다.");
		var comemntnum = $(".modal-title").html();
		var comemnttext = $("#comemnttext").val();

		var userObj = $("#intimeuser");
		var comemntuserObj = $("#disReplyWriter ");
		var originuser = userObj.val();
		var comemntuser = comemntuserObj.val();
		if (originuser != comemntuser) {
			alert("권한이 없는 사용자 입니다.");
		}

		$.ajax({
			type : 'delete',
			url : '/replies/' + comemntnum,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("삭제 되었습니다.");
					getPage("/replies/" + num + "/" + replyPage);
				}
			}
		});
	});
</script>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			alert("게시글을 수정합니다.");
		});

		$("#removeBtn").on("click", function() {
			alert("목록으로 돌아갑니다.");
		});

		$("#goListBtn ").on("click", function() {
			alert("목록으로 돌아갑니다.");
		});

	});
</script>

<%@ include file="../include/footer.jspf"%>