<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#signup spad {
	background-color: #f1f1f1;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

/* 감독 선택 */
#myInput2 {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable2 {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable2 th, #myTable2 td {
	text-align: left;
	padding: 12px;
}

#myTable2 tr {
	border-bottom: 1px solid #ddd;
}

#myTable2 tr.header, #myTable2 tr:hover {
	background-color: #f1f1f1;
}
</style>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg"
	data-setbg="../resources/img/normal-breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="normal__breadcrumb__text">
					<h2>Favorite Contents</h2>
					<p>Select your favorite contents.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Normal Breadcrumb End -->

<!-- Signup Section Begin -->
<section class="signup spad">

	<font color="white">임시 id </font><input type="text" placeholder="id입력"
		id="insertid">
	<div class="blog__details__title">
		<h2>선호하는 장르를 선택하세요.</h2>
		<h4>
			<font color="white">
				<table>
					<tr>
						<c:forEach var="genreservice" items="${genreservice}"
							varStatus="status">
							<c:if test="${status.index%5==0}">
					</tr>
					<tr>
						</c:if>
						<td><font color="white"> <input type="checkbox"
								name="genre" id="${genreservice.genrename}">
								${genreservice.genrename}
						</font></td>
						</c:forEach>
					</tr>
				</table>


			</font>
		</h4>
	</div>
	<div class="blog__details__title">
		<h2>선호하는 배우를 선택하세요.</h2>
		<h5>
			<font color="white"> <input type="text" id="myInput"
				onkeyup="myFunction()" placeholder="배우를 검색하고 체크하세요."
				title="Type in a name">

				<button class="site-btn" id="hide" onclick="button1_click();">창
					닫기</button>
				<table id="myTable">
					<tr class="header">
						<th style="width: 60%;">Name</th>
						<th style="width: 40%;">Check</th>
					</tr>
					<c:forEach var="Favoriteservice" items="${Favoriteservice}">
						<tr>
							<td><font color="white">${Favoriteservice.actorname}</font></td>
							<td><input type="checkbox" id="${Favoriteservice.actorname}"
								name="actor"></td>
						</tr>
					</c:forEach>
				</table>

			</font>
		</h5>
	</div>



	<div class="blog__details__title">
		<h2>선호하는 감독을 선택하세요.</h2>
		<h5>
			<font color="white"> <input type="text" id="myInput2"
				onkeyup="myFunction2()" placeholder="감독을 검색하고 체크하세요."
				title="Type in a name">

				<button class="site-btn" id="hide2" onclick="button2_click();">창
					닫기</button>
				<table id="myTable2">
					<tr class="header">
						<th style="width: 60%;">Name</th>
						<th style="width: 40%;">Check</th>
					</tr>
					<c:forEach var="directorservice" items="${directorservice}">
						<tr>
							<td><font color="white">${directorservice.directorname}</font></td>
							<td><input type="checkbox"
								id="${directorservice.directorname}" name="director"></td>
						</tr>
					</c:forEach>
				</table>

			</font>
		</h5>
		</br> </br>
		<button type="submit" class="site-btn">회원가입 정말 완료</button>
	</div>

</section>

<script>
	var x = document.getElementById("myInput");
	var y = document.getElementById("myTable");
	var z = document.getElementById("hide");

	y.style.display = 'none';
	z.style.display = 'none';

	x.addEventListener("focus", myFocusFunction, true);

	function myFocusFunction() {
		y.style.display = 'block';
		z.style.display = 'block';
	}
	function button1_click() {
		y.style.display = 'none';
		z.style.display = 'none';
	}

	function myFunction() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	///감독 조회 시작

	var q = document.getElementById("myInput2");
	var w = document.getElementById("myTable2");
	var e = document.getElementById("hide2");

	w.style.display = 'none';
	e.style.display = 'none';

	q.addEventListener("focus", myFocusFunction2, true);

	function myFocusFunction2() {
		w.style.display = 'block';
		e.style.display = 'block';
	}
	function button2_click() {
		w.style.display = 'none';
		e.style.display = 'none';
	}

	function myFunction2() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput2");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable2");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}

	//체크박스 3개 초과시 알러트
	/* function count_ck(obj) {

		var chkbox = document.getElementsByName("chk");

		var chkCnt = 0;

		for (var i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked) {

				chkCnt++;

			}

		}

		if (chkCnt > 3) {

			alert("최대 3명까지 가능합니다.");

			obj.checked = false;

			return false;
	
		}
		
		 
		
		
	}*/
</script>
<!-- Signup Section End -->
<%@ include file="../include/footer.jspf"%>