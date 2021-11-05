<%@ include file="../include/header.jspf"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";

		})

		$("#submit").on("click", function() {
			if ($("#userpassword").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userpassword").focus();
				return false;
			}
			if ($("#repassword").val() == "") {
				alert("변경할 패스워드를 입력하세요.");
				$("#repassword").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dateType : "json",
				data : $("#updateForm").serializeArray(),
				success : function(data) {

					if (data == true) {
						if (confirm("회원수정하시겠습니까?")) {
							$("#updateForm").submit();
						}

					} else {
						alert("패스워드가 틀렸습니다.");
						return;

					}
				}
			})
		});
	})
</script>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="../resources/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>회원 정보.</h2>
						<p>회원 정보를 수정합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
	<section class="login spad" id="container">
		<div class="container-fulid">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>비밀번호 수정</h3>
						<section id="container">
							<form id="updateForm" action="/member/profile" method="post">
								<div class="input__item">
									<input class="form-control" type="text" id="useremail"
										name="useremail" value="${USER_T.useremail}" /> <span
										class="icon_mail"></span>
								</div>
								<div class="input__item">
									<input class="form-control" type="password" id="userpassword"
										name="userpassword" /> <span class="icon_lock"></span>
								</div>
								<div class="input__item">
									<input class="form-control" type="password" id="repassword"
										name="repassword" /> <span class="icon_lock"></span>
								</div>
							</form>
							<div class="form-group has-feedback">
								<button class="btn btn-success" type="button" id="submit">회원정보수정</button>
								<button class="btn btn-success" type="button">취소</button>
							</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__register">
						<h3>비밀번호를 잊으셨나요 ?</h3>
						<a href="#" class="primary-btn">비밀번호 찾기</a>
					</div>
				</div>
			</div>

		</div>

	</section>
	<!-- Login Section End -->


	<%@ include file="../include/footer.jspf"%>