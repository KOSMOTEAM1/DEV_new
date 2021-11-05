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
	<section class="normal-breadcrumb set-bg">
		<div class="container">
			<div class="row">

				<%-- 				<div class="col-lg-12 text-center">
				<div class="product__item__pic"
				data-setbg="../../../../resources/img/trending/${view.imgname}.jpg">
				</div>
					<div class="normal__breadcrumb__text">
						<h2>${view.contentstitle}</h2>
						<p>${view.contentssummary} </p>
					</div>
				</div> --%>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<form name="form" method="post">
	<div class="row" style="width: 100%">
		<div style="width: 70%; float: none; margin: 0 auto">
			<div class="col-lg-12 text-center">
				<div class="card-body">
					<div class="product__item__pic"
						data-setbg="../../../../resources/img/trending/${view.imgname}.jpg">
					</div>
					<div class="normal__breadcrumb__text">
						<h2>${view.contentstitle}</h2>
						<p>${view.contentssummary}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>


</html>



<%@ include file="../include/footer.jspf"%>
