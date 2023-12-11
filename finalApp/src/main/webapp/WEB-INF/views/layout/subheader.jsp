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
                                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/#">홈</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    메뉴1
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">서브메뉴</a></li>
                                </ul>
                            </li>
            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    메뉴2
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">방명록</a></li>
                                    <li><a class="dropdown-item" href="#">게시판</a></li>
                                    <li><a class="dropdown-item" href="#">답변형 게시판</a></li>
                                    <li><a class="dropdown-item" href="#">포토갤러리</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">채팅</a></li>
                                </ul>
                            </li>
            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    메뉴3
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">프로그래밍</a></li>
                                    <li><a class="dropdown-item" href="#">데이터베이스</a></li>
                                    <li><a class="dropdown-item" href="#">웹 프로그래밍</a></li>
                                    <li><a class="dropdown-item" href="#">데이터분석 및 AI</a></li>
                                    <li><a class="dropdown-item" href="#">클라우드 및 기타</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">질문과 답변</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    메뉴4
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">자주하는질문</a></li>
                                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                                    <li><a class="dropdown-item" href="#">1:1문의</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">이벤트</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    마이페이지
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">일정관리</a></li>
                                    <li><a class="dropdown-item" href="#">사진첩</a></li>
                                    <li><a class="dropdown-item" href="#">쪽지함</a></li>
                                    <li><a class="dropdown-item" href="#">친구관리</a></li>
                                    <li><a class="dropdown-item" href="#">메일</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">정보수정</a></li>
                                </ul>
                            </li>
                    </ul>
                </div>
            </div>
        </nav>