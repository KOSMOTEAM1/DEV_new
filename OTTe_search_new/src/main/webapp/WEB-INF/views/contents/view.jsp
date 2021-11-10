<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.zerock.domain.ContentsVO"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>OTTe</title>

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
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<input type='hidden' name='contentsid' value="${contentsid}">
	<!-- Normal Breadcrumb Begin -->
	<!-- <section class="normal-breadcrumb set-bg">
      <div class="container">
         <div class="row">

            <div class="col-lg-12 text-center">
            
         </div>
      </div>
   </section> -->


	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="../../"><i class="fa fa-home"></i> Home</a> <a
							href="./categories.html">Categories</a> <span>Romance</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-3">
						<div class="anime__details__pic set-bg"
							data-setbg="../../../../resources/img/poster/${view.imgname}.jpg">
							<div class="comment">
								<i class="fa fa-comments"></i> 11
							</div>
							<div class="view">
								<i class="fa fa-eye"></i> 9141
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3>${view.contentstitle }</h3>
								<span>감독</span>
							</div>
							<div class="anime__details__rating">
								<div class="rating">
									<c:forEach var="i" begin="1" end="${avgScore.avgScore}">
										<a href="#"><i class="fa fa-star"></i></a>
									</c:forEach>
									<c:if test="${avgScore.halfstar == 10}">
										<a href="#"><i class="fa fa-star-half-o"></i></a>
									</c:if>
								</div>
								<span>${reviewcnt.reviewcnt} Votes - ${avgScore.avgScore}
									/ 5.0</span>
							</div>
							<p>${view.contentssummary}</p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Type: </span> ${view.classname}</li>
											<li><span>Release Date: </span> ${view.contentsstart}</li>
											<li><span>Genre: </span> ${view.classname}</li>
											<%-- <li><span>Nation: </span> ${view.nationcode}</li> --%>
											<li><span>서비스중인 OTT: </span> ${view.ottname}</li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-8">
										<ul>

											<li><span>Scores: </span> ${view.contentsscore}</li>
											<li><span>Season: </span> ${view.contentsseason}</li>
											<li><span>Episode: </span> ${view.contentsepisode}</li>
											<li><span>Duration: </span> ${view.contentsduration}</li>
											<li><span>Views: </span> 추가예정</li>
										</ul>
									</div>
								</div>
							</div>
							
							
							
							
							<div class="anime__details__btn">
								<c:if test="${checkfollow.count == 0}">
									<a class="follow-btn" id="follow"><i class="fa fa-heart-o"></i>Follow</a> 
								</c:if>
								<c:if test="${checkfollow.count != 0}">
									<a class="follow-btn" id="follow"><i class="fa fa-heart"></i>Follow</a> 
								</c:if>
								<a href="#" target="_blank" class="watch-btn"><span>Watch
										Now</span> <i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>



						<!-- 댓글 시작 -->
						<c:forEach var="viewReply" items="${viewReply}">
							<div class="anime__review__item">
								<div class="anime__review__item__pic">
									<img src="img/anime/review-2.jpg" alt="">
								</div>
								<div class="anime__review__item__text">
									<h6>${viewReply.userid}</h6>
									<p>${viewReply.reviewnatter}</p>
								</div>
							</div>
						</c:forEach>
						<!-- 댓글 끝 -->
					</div>

					<!-- 리뷰남기는창 시작-->
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form>
							<textarea placeholder="Your Comment" id="reviewtext" ></textarea>
							<button type="submit" id="reviewAdd">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
					<!-- 리뷰남기는창 끝 -->
					
					
				</div>
			</div>
		</div>
	</section>
	<!-- Anime Section End -->

	<!-- Js Plugins -->
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script>



// 팔로우버튼
$("#follow").on("click", function(){
  	$.ajax({
		url: "/contents/follow",
		type: "POST",
		datatype:'text',
		data:{contentsid:'${view.contentsid}'},
		success: function() {
			alert("등록 되었습니다.");
			// recCount();
		},
	})   
});


// 리뷰제출버튼
$("#reviewAdd").on("click",function(){

	 var reviewtext = reviewtextObj.val();
	 
	  $.ajax({
			type:'post',
			url:'/contents/replies/',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({contentsid:contentsid, replytext:replytext}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage );
					replyerObj.val("");
					replytextObj.val("");
				}
		}});
});

</script>






<%@ include file="../include/footer.jspf"%>