<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: black;">
            <a class="navbar-brand ps-3" href="#">원데이 플러스 +</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
            </button>
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input type="hidden">
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a href="${pageContext.request.contextPath}/member/logout" class="nav-link">
                            <i class="fas fa-user fa-fw"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">pluszone</div>
                                <a class="nav-link" href="${pageContext.request.contextPath}/pluszone">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    플러스 페이지
                                </a>
                                <div class="sb-sidenav-menu-heading">main</div>
	                                <a class="nav-link" href="${pageContext.request.contextPath}/">
	                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
	                                    사용자 페이지
	                                </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#MemberLayout" aria-expanded="false" aria-controls="MemberLayout">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                원데이 클래스
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="MemberLayout" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">클래스 관리</a>
                                    <a class="nav-link" href="${pageContext.request.contextPath}/pluszone/booking/lessonList">예약 현황</a>
                                    <a class="nav-link" href="<c:url value='/pluszone/referManage/list'/>">자료실</a>
                                    <a class="nav-link" href="${pageContext.request.contextPath}/pluszone/plusInq/inqList">클래스 문의내역</a>
                                </nav>
                            </div>
                            
                            
                            
                            <a class="nav-link" href="${pageContext.request.contextPath}/pluszone/schedule/main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                일정 관리
                            </a>
                            
                            <a class="nav-link" href="<c:url value='/pluszone/noticePlus/list'/>">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                공지사항
                            </a>
                            
                            <a class="nav-link" href="${pageContext.request.contextPath}/pluszone/salesStatus/main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                매출 현황
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#onedayPages" aria-expanded="false" aria-controls="onedayPages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                고객센터
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="onedayPages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        채팅(1:1문의)
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="#">사용자 채팅</a>
                                            <a class="nav-link" href="#">관리자 채팅</a>
                                        </nav>
                                    </div>
                                        <a class="nav-link" href="${pageContext.request.contextPath}/pluszone/lessonPlus/main">클래스 등록신청</a>
                                    	<a class="nav-link" href="#">정산</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <i class="fas fa-user fa-fw"></i>&nbsp;&nbsp;
                         <a href="#" style="text-decoration: none; color: white;">${dto.userName} 플러스님</a>
                    </div>
                </nav>
            </div>
            

