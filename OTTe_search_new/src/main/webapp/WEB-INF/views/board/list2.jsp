<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- Page Preloder -->
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
						<p>Welcome to the official AnimeÂ blog.</p>
					</div>
								<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>

			</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<h1>Board List</h1>


	<table style="width: 60%; heigth: 100px; margin: auto;">
	
	
		<tbody>
			<%
			//로그인 여부 확인 방법 
			//(session 유무 확인 + 로그인 시 할당한 attribute 존재 확인)

			HttpSession session = request.getSession(false);
			if (session != null && session.getAttribute("login") != null) {
			%>
			<button type="submit" class="site-btn" method="get" onclick="location.href='/board/write' ">Login Now</button>
			<%
			}
			%>
			
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<!-- <tr>
							<th style="width: 10px">num</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>
 -->
						<c:forEach items="${list}" var="item">
						<div class="row text-center" style="width: 100%">
						<div style="width: 30%; float: none; margin: 0 auto">
							<tr>
								<a href='/board/view2${pageMaker.makeSearch(pageMaker.cri.page) }&num=${item.num}' >
								<div class="card border-primary mb-3"
									style="max-width: 80rem; margin: auto;">
									<div class="card-header">${item.num}</div>
									<div class="card-body">
										<h4 class="card-title">${item.title}</h4>
										<p class="card-text"><img src="../../resources/img/board${item.filename}" width="200" alt="Attachment" id="thumbnail${item.num}">${item.content}</p>
										<p><fmt:formatDate value="${item.writeDate}" pattern="yy-MM-dd" /></p>
									</div>
								</div>
								</a>
							</tr>
						</div>
						</div>
						</c:forEach>
							<%-- <tr>
								<td>${item.num}</td>
								<td><a
									href='/board/view2${pageMaker.makeSearch(pageMaker.cri.page) }&num=${item.num}'>
										${item.title} </a></td>
								<td>${item.num}</td>
								
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${item.writeDate}" /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
							</tr> --%>



					</table>
				</div>
				<!-- /.box-body -->
				<div class="col-md-12">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
										<div class="box-footer">
						<div class="text-center">
							<ul class="pagination" stlye="text-aling:center;">
								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					</div>
					<div class="col-md-4">
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</tbody>
	</table>
</body>

<%@ include file="../include/footer.jspf"%>