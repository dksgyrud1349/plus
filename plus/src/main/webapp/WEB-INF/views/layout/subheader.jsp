<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	a, .nav-item{
		font-weight: bold;
	}
</style>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">원데이 플러스 + </a>
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
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    클래스등록
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">클래스 등록</a></li>
                                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                                    <li><a class="dropdown-item" href="#">이용안내</a></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                </ul>
                            </li>
            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                   	위시리스트
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">위시리스트</a></li>
                                    <li><a class="dropdown-item" href="#">최근 본 클래스</a></li>
                                    <li><a class="dropdown-item" href="#">답변형 게시판</a></li>
                                    <li><a class="dropdown-item" href="#">포토갤러리</a></li>
                                    <li><hr class="dropdown-divider"></li>
                  
                                </ul>
                            </li>
            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                   알림
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">보낸 쪽지</a></li>
                                    <li><a class="dropdown-item" href="#">받은 쪽지</a></li>
                                    
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">질문과 답변</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    클래스
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">베스트 클래스이벤트</a></li>
                                    <li><a class="dropdown-item" href="#">신규 클래스</a></li>
                                    <li><a class="dropdown-item" href="#">이벤트 클래스</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">모든 클래스</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    마이페이지
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">정보수정</a></li>
                                    <li><a class="dropdown-item" href="#">예약확인</a></li>
                                    <li><a class="dropdown-item" href="#">쪽지함</a></li>
                                    <li><a class="dropdown-item" href="#">내가 쓴 리뷰</a></li>
                                    <li><a class="dropdown-item" href="#">적립금</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">정보수정</a></li>
                                </ul>
                            </li>
                    </ul>
                </div>
            </div>
        </nav>