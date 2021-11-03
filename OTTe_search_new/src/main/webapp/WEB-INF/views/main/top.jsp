<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%-- <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime | Template</title>

<!-- Google Font -->
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

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top_contents">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>인기 있는 콘텐츠</h4>
								</div>
							</div>
							<div class="col-lg-3 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="./top" class="primary-btn">View All <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
						<c:forEach var="top" items="${top}">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="../../../../resources/img/trending/trend-1.jpg">

										<div class="comment">
											<i class="fa fa-comments"></i> 11
										</div>
										<div class="view">
											<i class="fa fa-eye"></i> 9141
										</div>
									</div>
									<div class="product__item__text">
										<ul>
											<li>${top.gradeid}</li>
											<li>${top.classid}</li>
										</ul>
										<h5>
											<a href="#">${top.contentstitle}</a>
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
							
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- Product Section End -->


	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/player.js"></script>
	<script src="../resources/js/jquery.nice-select.min.js"></script>
	<script src="../resources/js/mixitup.min.js"></script>
	<script src="../resources/js/jquery.slicknav.js"></script>
	<script src="../resources/js/owl.carousel.min.js"></script>
	<script src="../resources/js/main.js"></script>


</body>

</html>
<%@ include file="../include/footer.jspf"%>