<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="org.zerock.domain.ContentsVO"%>
<%@ page session="false"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
</head>


<body>

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

	<!-- Productino Section Begin -->
	<section class="product-page spad">
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
							<!-- 검색기능 적용(진행중) -->
							<div class="col-md-6" style="text-align: right;">
							
									<button type="submit" class="site-btn" id='newBtn' method="get" onclick="location.href='/board/write'">글쓰기</button>

								<button id='newBtn'>New Board</button>
							</div>
							<!-- 검색기능 적용 -->
						</div>
					</div>
					<!-- 페이지 제목+검색기능 끝 -->
					<!-- 게시물 목록 보기 시작 -->

					<!-- 불러온 게시물 하나씩 보기  -->
					<div class="anime__details__review">
						<div style="width: 90%; float: none; margin: 0 auto">
							<div class="anime__review__item">
								<c:forEach items="${list}" var="item">
									<tr>
										<a
											href='/board/view2${pageMaker.makeSearch(pageMaker.cri.page) }&num=${item.num}'>
											<div class="card border-primary mb-3"
												style="max-width: 80rem; margin: auto;">
												<div class="card-header"><!-- 게시물 번호 / 제목 / 작성일 -->
													<div class="row">
														<div class="col-md-10" style="vertical-align:center;">
															<h5>${item.num}/${item.title}</h5>
														</div>
														<div class="col-md-2" style="vertical-align:center; text-align: right;">
															<p>
																<fmt:formatDate value="${item.writeDate}"
																	pattern="yy-MM-dd" />
															</p>
														</div>
													</div>
												</div>
												<div class="card-body"><!-- 게시물 요약  -->
													<div class="row">
														<div class="col-md-4"><!-- 게시물 대표 이미지 -->
															<img src="../../resources/img/board${item.filename}"
																width="200" alt="Attachment" id="thumbnail${item.num}">
														</div>
														<div class="col-md-8" style="text-align: left"><!-- 게시물 내용 -->
															<p class="card-text">${item.content}</p>
														</div>
													</div>
												</div>
											</div>
										</a>
									</tr>
								</c:forEach>
							</div>
					</div>
				</div>
				<!--  불러온 게시물 하나씩 보기 -->
				<!-- 게시물 목록 보기 끝 -->
				<!-- 페이징 처리 시작 -->
				<div class="product__pagination">
					

						<c:if test="${pageMaker.prev}">
							<ul class="fa fa-angle-double-left"><a
								href="list2${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></ul>
						</c:if>


						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<ul>
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>
								<a href="list2${pageMaker.makeSearch(idx)}" class="current-page">${idx}</a>

							</ul>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<ul class="fa fa-angle-double-right"><a
								href="list2${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></ul>
						</c:if>
					
				</div>
			</div>
		</div>
		</div>

	</section>
	<!-- Normal Breadcrumb End -->

</body>

<%@ include file="../include/footer.jspf"%>