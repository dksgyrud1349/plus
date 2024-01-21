<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
li a,
li a.multi:after {
    position: relative;
	display: block;
	margin: 0;
	padding: 10px;
	font-size: 14px;
	font-weight: bold;
	line-height: 15px;
	white-space: normal;
	color: #333;
	background-color: white;
	border: 1px solid #f5f5f5;
	border-top: 4px solid #95a5a6;
    z-index: 1;
}

li a.multi:after {
	content: " ";
	position: absolute;
	left: 6px;
	top: 6px;
	width: 100%;
	height: 100%;
	border-width: 2px;
	border-color: #eee;
	border-top-width: 0 !important;
	border-left-width: 0 !important;
	z-index: -1;
}

li a:before {
	content: " "attr(href)" ";
	display: block;
	text-transform: uppercase;
	font-size: 10px;
	font-weight: bold;
	word-wrap: break-word;
	color: #95a5a6;
}

li a small {
	display: block;
	font-size: 10px;
	margin-top: 7px;
}

ul, li {
	position: relative;
	display: inline-block;
}

.sitemapnav ul li:before,
.sitemapnav ul li:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	border-color: #ddd;
	border-width: 1px;
	z-index: 0;
}

.sitemapnav ul li a { border-top-color: #e74c3c; width: auto; }
.sitemapnav ul li a:before, .sitemapnav ul li .fa { color: #e74c3c; }

.sitemapnav ul ul {
	white-space: nowrap;
}

.sitemapnav ul ul li {
	position: relative;
	vertical-align: top;
	padding-top: 15px;
	margin-right: 15px;
	white-space: normal;
	width: 100%;
}

.sitemapnav ul ul li:last-child {
	padding-right: 0;
}

.sitemapnav ul ul li:before {
	border-top-style: solid;
	width: 25px;
	top: 50px;
	margin: 0 0 0 -20px;
}

.sitemapnav ul ul li:first-child:before {
	border-top-style: none;
	border-left-style: solid;
	width: 0;
	height: 20px;
	top: 0;
	left: 45px;
	margin: 0 0 0 -20px;
}

.sitemapnav ul ul li a { border-top-color: #47a3da; width: auto; }
.sitemapnav ul ul li a:before, .sitemapnav ul ul li .fa { color: #47a3da; }

/* --- Level 2 --- */
.sitemapnav ul ul ul {
	display: block;
	white-space: normal;
}

.sitemapnav ul ul ul li {
	display: block;
	position: relative;
	width: 100%;
	padding-left: 30px;
	margin-right: 0;
}

.sitemapnav ul ul ul li:before,
.sitemapnav ul ul ul li:first-child:before  {
	border-top-style: none;
	border-left-style: solid;
	height: 100%;
	top: 0;
	left: 45px;
}

.sitemapnav ul ul ul li:last-child:before  {
	height: 20px;
}

.sitemapnav ul ul ul li:after  {
	border-top-style: solid;
	top: 45px;
	left: 25px;
	width: 20px;
}

.sitemapnav ul ul ul li a { border-top-color: #005C00; width: auto; }
.sitemapnav ul ul ul li a:before, .sitemapnav ul ul ul li .fa { color: #005C00; }


/* --- Secondary --- */
.secondary {
	display: block;
	margin-top: 20px;
	padding-top: 20px;
	border-top: dotted 2px #eee;
}

.secondary ul {
	white-space: nowrap;
}

.secondary ul li {
	display: inline-block;
	white-space: normal;
	padding: 0 10px 0 0;
}

.secondary ul li:before,
.secondary ul li:after {
	display: none;
}

.secondary ul li:last-child {
	padding: 0;
}

.sitemapnav > ul > li > a,
.sitemapnav > ul > li > ul > li,
.secondary li a {
	width: 220px;
}

.colortext div {
	border:1px solid #black;
	width:60px;
	height:60px;
	line-height:60px;
	text-align:center;
	border-radius:25px;
	float:left;
	font-weight:bold;
	font-size:23px;
}
</style>
<main class="wrapper" style="width:100%; margin:10% auto">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid">
				<div class="body-container">
    				<div class="body-main">
					    <div class="colortext">
							 <div style="background-color: #ff99cc;">모</div>
							 <div style="background-color: #66ccff;">든</div>
							 <div style="background-color: #99cc00;">서</div>
							 <div style="background-color: #ffcc00;">비</div>
							 <div style="background-color: #FF9966;">스</div>
						</div>

				    <nav class="sitemapnav">
				        <ul class="mt-5">
				           <li>
				              <a href="${pageContext.request.contextPath}/">
				                  <i class="bi bi-dice-1"></i> Home 
				              </a>
				              <ul>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/lesson/main"><i class="bi bi-dice-2"></i> 원데이클래스 </a>
				                    <!-- 
				                    <ul>
				                       <li><a href="${pageContext.request.contextPath}/">들여쓰기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">들여쓰기</a></li>
				                    </ul>
				                     -->
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/onedayplus/onedayplus"><i class="bi bi-dice-3"></i> 원데이플러스+</a>
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/event/progress/list"><i class="bi bi-dice-4"></i> 이벤트 </a>
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/faq/main"><i class="bi bi-dice-5"></i> 고객센터(자주묻는질문) </a>
				                    <ul>
				                       <li><a href="${pageContext.request.contextPath}/chatting/main">실시간 채팅</a></li>
				                       <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
				                       <li><a href="${pageContext.request.contextPath}/declaration/article">신고하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/proposal/list">제안하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/inquiryAd/write">1:1문의하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/etc/list">연락처 / 위치안내</a></li>
				                    </ul>
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/bbs/list"><i class="bi bi-dice-6"></i> 커뮤니티 </a>
				                 </li>
				              </ul>
				           </li>
				        </ul>
				    </nav>
				
				    <nav class="secondary">
				        <ul>
				           <li><a href="${pageContext.request.contextPath}/company/introduction">회사소개</a></li>
				           <li><a href="${pageContext.request.contextPath}/terms/list">서비스이용약관</a></li>
				           <li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
				           <li><a href="${pageContext.request.contextPath}/member/member">사용자 회원가입</a></li>
				           <li><a href="${pageContext.request.contextPath}/pluszone/member/member">플러스 회원가입</a></li>
				        </ul>
				    </nav>
				
				</div>
			</div>
		</div>
	</div>
</main>