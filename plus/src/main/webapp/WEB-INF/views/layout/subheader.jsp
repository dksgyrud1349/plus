<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	a, .nav-item{
		font-weight: bold;
	}
</style>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" style="background-color:white;">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">원데이 플러스 + </a>
                <!-- 작은 사이즈 시  버튼 부트스트랩 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                                aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                        
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">홈</a>
                            </li>
                            <!--
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    원데이 클래스
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">전체 클래스</a></li>
                                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                                    <li><a class="dropdown-item" href="#">이용안내</a></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                </ul>
                            </li>
                            -->
            				<li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/lesson/main" class="nav-link" >
                                   	원데이클래스
                                </a>
                            </li>
            				
                            <li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/onedayplus/onedayplus" class="nav-link" >
                                   	원데이플러스
                                </a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/event/progress/list" class="nav-link" >
                                   	이벤트
                                </a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/faq/main" class="nav-link" >
                                   	고객센터
                                </a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/bbs/list" class="nav-link" >
                                   	커뮤니티
                                </a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a href="${pageContext.request.contextPath}/sitemap/sitemap" class="nav-link" >
                                   	사이트맵
                                </a>
                            </li>
                    </ul>
                </div>
            </div>
        </nav>