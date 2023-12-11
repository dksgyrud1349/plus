<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<a href="${pageContext.request.contextPath}/WEB-INF/views/service/service.jsp" 
		style="line-height: 300px; font-size:25px; color:black;">
</a>
<style>
@charset "utf-8";
.text{ font-size: x-small; margin-bottom: 8px;}
.center{margin: 0 auto;}
.category{
	padding: 24px 24px;
}

* {
    margin: 0;
    padding: 0;
    text-decoration: none;
    color: #333;
    box-sizing: border-box;
}
.ul,li{list-style: none;}
.footer {
	display: flex;
	justify-content: flex-start;
	align-items: baseline;
}
.footer-center {
	display: flex;
	justify-content: center;
	align-items: center;
	border-bottom: 1px solid black;
	padding-left: 100px;
}
.border-end{
	height:10px;
	text-align: center;
}
.open-padding {
	margin-bottom: 30px;
	width: 100%;
}
.toggle{
margin-left: 80px;
}
.left-toggle{
margin-right: 30px;
}
</style>
<nav class="footer-container">
	<div class="footer container-row container">
		<div class="col-3 left ps-5 ">
		    <p class="contact" style="font-size: x-large;">원데이 플러스</p>        
		    <div class="text contact">일상의 따듯한 휴식과 새로운 경험, 원데이 플러스</div>        
		    <div class="text contact">Let’s make more chance with Oneday Plus</div>        

			<p class="text middle" style="font-size: x-large; color: green;">1588-6535</p>        
			<div class="text middle">평일 10:00 ~ 18:00</div>        
			<div class="text middle">(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</div>        
		</div>
		
		<div class="col-6 center">
			<ul class="content-list footer-center">
				<div class="open-padding">
					<span><a href="#" class="text-middle category">소개&nbsp;</a></span>
					<span class="border-end"></span>
					<span><a href="#" class="text-middle category">1:1문의&nbsp;</a></span>
					<span class="border-end"></span>
					<span><a href="#" class="text-middle category">커뮤니티&nbsp;</a></span>
					<span class="border-end"></span>
					<span><a href="#" class="text-middle category">공지사항&nbsp;</a></span>
				</div>
			</ul>
			<ul>
				<div>
					<div class="text">주식회사 레디킨즈 | 대표 정종학 | 사업자등록번호 : 285-81-02364 | 통신판매번호 : 2021-부산금정-0652</div>
				</div>
				<div>
					<div class="text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</div>
				</div>
				<div>
					<div class="text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</div>
				</div>
				<div>
					<div class="text">Copyright ©Brave Mobile Inc. All Rights Reserved.</div>
				</div>
			</ul>
		</div>
		
		<div class="col-3 right toggle">
		<span>
        	<li class="dropdown">
            	<a class="dropdown-toggle left-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                	고객센터
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                	<li><a class="dropdown-item" href="#">자주하는 질문</a></li>
                	<li><a class="dropdown-item" href="#">문의하기</a></li>
				</ul>
			
            	<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                	내정보
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                	<li><a class="dropdown-item" href="#">마이페이지</a></li>
                	<li><a class="dropdown-item" href="#">로그아웃</a></li>
                	<li><a class="dropdown-item" href="#">회원탈퇴</a></li>
				</ul>
			</li>
			</span>
		</div>
	</div>
</nav>
