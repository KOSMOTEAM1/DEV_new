<%@ include file="../include/header.jspf" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="../resources/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>선호하는 컨텐츠</h2>
                        <p>선호하는 컨텐츠를 선택해주세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="blog__details__title">
          <h2>좋아하는 장르를 선택해주세요. </h2>
          <h4> <font color="white">
          <input type="checkbox">&nbsp&nbsp 액션</br>
          <input type="checkbox">&nbsp&nbsp 로맨스</br>  
          <input type="checkbox">&nbsp&nbsp 코미디</br>
          <input type="checkbox">&nbsp&nbsp 드라마</br>
          <input type="checkbox">&nbsp&nbsp 범죄</br>
          <input type="checkbox">&nbsp&nbsp 판타지</br>
          <input type="checkbox">&nbsp&nbsp 다큐멘터리</br>
          <input type="checkbox">&nbsp&nbsp 애니메이션</br>
          </font></h4>
         </div>
    
        <div class="blog__details__title">
          <h2>가장 좋아하는 분류를 선택해주세요. </h2>
           <h4> <font color="white">
          <input type="checkbox">&nbsp&nbsp 영화</br>
          <input type="checkbox">&nbsp&nbsp 드라마</br>  
          <input type="checkbox">&nbsp&nbsp 티비 시리즈</br>
          <input type="checkbox">&nbsp&nbsp 다큐멘터리</br>
          <input type="checkbox">&nbsp&nbsp 애니메이션</br>
          <input type="checkbox">&nbsp&nbsp 키즈</br>
            </font></h4>
         </div>
          <div class="blog__details__title">
          <h2>좋아하는 감독을 입력해주세요. </h2>
           <h5> <font color="white">
          <input type="text" placeholder="director name. using comma(,)" size="50">
            </font></h5>
         </div>
         <div class="blog__details__title">
          <h2>좋아하는 배우를 입력해주세요. </h2>
           <h5> <font color="white">
          <input type="text" placeholder="actor name. using comma(,)" size="50">
            </font></h5>
            </br>
            </br>
                <button type="submit" class="site-btn">가입 완료하기!</button>
         </div>
         
    </section>
    <!-- Signup Section End -->
<%@ include file="../include/footer.jspf" %>