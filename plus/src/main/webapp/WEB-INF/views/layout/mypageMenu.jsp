<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@media (min-width: 992px) {
  body {
    padding-top: 0;
    padding-left: 12rem;
  }
}

#sideNav {
  padding-left: 1rem;
  padding-right: 1rem;
}
#sideNav .navbar-nav .nav-item .nav-link {
  font-weight: 800;
  letter-spacing: 0.05rem;
  text-transform: uppercase;
}
#sideNav .navbar-toggler:focus {
  outline-color: #d48a6e;
}

@media (min-width: 992px) {
  #sideNav {
    padding-left: 0;
    padding-right: 0;
    position: fixed;
    display: flex;
    flex-direction: column;
    width: 13rem;
    height: 100vh;
    z-index:0;
  }
  #sideNav .navbar-brand {
    display: flex;
    margin: auto auto 0;
    padding: 0.5rem;
  }
  #sideNav .navbar-brand .img-profile {
    max-width: 10rem;
    max-height: 10rem;
    border: 0.5rem solid rgba(255, 255, 255, 0.2);
  }
  #sideNav .navbar-collapse {
    display: flex;
    align-items: flex-start;
    flex-grow: 0;
    width: 100%;
    margin-bottom: auto;
  }
  #sideNav .navbar-collapse .navbar-nav {
    flex-direction: column;
    width: 100%;
  }
  
  #sideNav .navbar-collapse .navbar-nav .nav-item {
    display: block;
  }
  #sideNav .navbar-collapse .navbar-nav .nav-item .nav-link {
    display: block;
  }
}
</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypagemenu.css" />

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-light fixed-top" id="sideNav">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/myPage/main">
        <span class="d-none d-lg-block">
            <img class="img-fluid img-profile mx-auto mb-1" src="${pageContext.request.contextPath}/resources/images/main/mypagePerson.png"/>
        </span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav menu-4">
          	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/main" data-hover="마이페이지" style="border-bottom: 3px solid orange !important;">마이페이지</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/wishList/mylist" data-hover="위시리스트">위시리스트</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/booking/list" data-hover="예약내역">예약내역</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/mileage/list" data-hover="적립금내역">적립금내역</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/onedayplus" data-hover="원데이 플러스 결과">원데이 플러스 결과</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/note/receive/list" data-hover="쪽지 내역" target="_blank;">쪽지 내역</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/mybbs" data-hover="내가 작성한 커뮤니티">내가작성한 커뮤니티</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage/review" data-hover="내가 작성한 리뷰">내가 작성한 리뷰</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/inquiryAd/list" data-hover="1:1 문의내역" target="_blank;">1:1 문의내역</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/classInq/myInqList" data-hover="클래스 문의내역">클래스 문의내역</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/pwd" data-hover="내정보 및 수정">내정보 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/pwd?dropout" data-hover="탈퇴">탈퇴</a></li>
        </ul>
    </div>
</nav>