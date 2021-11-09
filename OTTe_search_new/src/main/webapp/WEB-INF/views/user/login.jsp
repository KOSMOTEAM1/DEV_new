<%@ include file="../include/header.jspf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<body>
	<!-- Page Preloder. -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="../resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>로그인이 필요합니다.</h2>
                        <p>우리 사이트에 오신것을 환영합니다!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>로그인</h3>
                        <form action="/user/loginPost" method="post">
                            <div class="input__item">
                                <input type="email" name="useremail" placeholder="ID(email type)">
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="userpassword" placeholder="password">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">로그인 하기</button>
                        </form>
                        <a href="../mail/mailForm" class="forget_pass">패스워드를 잊으셨나요?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 아직 없으신가요?</h3>
                        <a href="../member/register" class="primary-btn">지금 가입하기</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                   <!--    <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                                </li>
                            </ul>
                        </div> -->  
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

	
<%@ include file="../include/footer.jspf" %>