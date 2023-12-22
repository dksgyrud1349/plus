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
    <a class="navbar-brand" href="#page-top">
        <span class="d-none d-lg-block">
            <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg"/>
        </span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav menu-4">
          <li class="nav-item"><a class="nav-link" href="#" data-hover="마이페이지" style="border-bottom: 3px solid orange !important;">마이페이지</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="내정보 및 수정">내정보 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="알림 / 쪽지 내역">알림 / 쪽지 내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="예약내역">예약내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="위시리스트">위시리스트</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="리뷰">리뷰</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="문의내역">문의내역</a></li>
            <li class="nav-item"><a class="nav-link" href="#" data-hover="탈퇴">탈퇴</a></li>
        </ul>
    </div>
</nav>