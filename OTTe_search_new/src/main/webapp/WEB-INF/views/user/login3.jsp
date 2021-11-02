<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<head>
<title>로그인 페이지</title>
</head>
<body>
	<form action="/user/login" method="post">
		<input type="text" name="userid" placeholder="아이디" />
		<input type="password" name="userpw" placeholder="비밀번호" />
		<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
	</form>
</body>
</html>
