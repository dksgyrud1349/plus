<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

.text{ 
	font-size: 12.5px;
}

.center{margin: 0 auto;}

.footer {
	display: flex;
	justify-content: flex-start;
	align-items: baseline;
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
.hr-1{
	width: 1296px;
	margin: 0 auto;
}
</style>
<hr class="mt-4 hr-1">
<nav class="footer-container">
	<div class="footer container-row container mt-4">
		<div class="col-3 left ps-5 me-5">
		    <p style="font-size: x-large; color: blue;"><i class="bi bi-calendar-plus-fill" style="color: blue;"></i>&nbsp;원데이 플러스</p>        
		    <p class="text">일상의 따듯한 휴식과 새로운 경험, 원데이 플러스<br>
		    	Let’s make more chance with Oneday Plus</p>        

			<p style="font-size: x-large; color: green;"><i class="bi bi-telephone-plus-fill" style="color: green"></i>&nbsp;1588-6535</p>
			<p class="text">	평일 10:00 ~ 18:00<br>
				(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)      
			</p>
		</div>
		
		<div class="col-6 center">
			<div class="text">&nbsp;</div>
			<div class="text">&nbsp;</div>
			<div class="text">&nbsp;</div>
			<hr>
			<div class="text">주식회사 원데이플러스 | 대표자명: 김정균 | 이메일: flarkr8852@gmail.com</div>
			<div class="text">주소: 충청남도 천안시 서북구 남부순환로339길 세종빌딩 109동 1003호 | 전화번호: 010-4666-0455</div>
			<div class="text">팩스번호 : 02-555-1121 | 사업자등록번호 : 05-555-41121 | 직업정보제공사업 신고번호:서울청 제 2019-21호</div>
			<div class="text">(주)원데이플러스는 클래스수업중개자로서 개별 판매자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</div>
		</div>
		
		<div class="col-3 right toggle">
        	<div class="dropdown">
            	<button class="btn btn-outline-secondary dropdown-toggle left-toggle" 
            		id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"
            		style="width:150px;">
            		
                	고객서비스
                </button>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/company/introduction">회사소개</a></li>
                	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/faq/main">자주하는 질문</a></li>
                	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiryAd/list">1:1문의</a></li>
                	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
                	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/terms/list">서비스 이용약관</a></li>
				</ul>            	
			</div>
		</div>
		
	</div>
</nav>