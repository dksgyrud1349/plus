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

.sitemapnav ul ul li a { border-top-color: #3498db; width: auto; }
.sitemapnav ul ul li a:before, .sitemapnav ul ul li .fa { color: #3498db; }

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

.sitemapnav ul ul ul li a { border-top-color: #2ecc71; width: auto; }
.sitemapnav ul ul ul li a:before, .sitemapnav ul ul ul li .fa { color: #2ecc71; }

/* --- Level 3 --- */
.sitemapnav ul ul ul ul li a { border-top-color: #e67e22; }
.sitemapnav ul ul ul ul li a:before, .sitemapnav ul ul ul ul li .fa { color: #e67e22; }

/* --- Level 4 --- */
.sitemapnav ul ul ul ul ul li a { border-top-color: #9b59b6; }
.sitemapnav ul ul ul ul ul li a:before, .sitemapnav ul ul ul ul ul li .fa { color: #9b59b6; }

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
</style>
<main class="wrapper" style="width:100%; margin:10% auto">
	<div id="layoutSidenav_content">
		 	<div class="container-fluid">
				<div class="body-container">
    				<div class="body-main">

				    <h1 style="border-bottom:3px solid #cccccc; margin-bottom:3%">모든 서비스</h1>
				
				    <nav class="sitemapnav">
				        <ul>
				           <li>
				              <a href="${pageContext.request.contextPath}/">
				                  <i class="fa-home"></i> Home 
				              </a>
				              <ul>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/lesson/main"><i class="bi bi-dice-1"></i> 전체 원데이클래스 </a>
				                    <!-- 
				                    <ul>
				                       <li><a href="${pageContext.request.contextPath}/">들여쓰기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">들여쓰기</a></li>
				                    </ul>
				                     -->
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/onedayplus/onedayplus"><i class="fa-building"></i> 원데이플러스+</a>
				                    <!--  
				                    <ul>
				                       <li>
				                           <a href="${pageContext.request.contextPath}/">2</a>
				                           <ul>
				                               <li><a href="${pageContext.request.contextPath}/" class="multi">3</a></li>
				                           </ul>
				                       </li>
				                    </ul>
				                    -->
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/event/progress/list"><i class="fa fa-building"></i> 이벤트 </a>
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/"><i class="fa fa-rss"></i> 고객센터 </a>
				                    <ul>
				                       <li><a href="${pageContext.request.contextPath}/">자주묻는질문</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">공지사항</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">신고하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">제안하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">문의하기</a></li>
				                       <li><a href="${pageContext.request.contextPath}/">연락처 / 위치안내</a></li>
				                    </ul>
				                 </li>
				                 <li>
				                    <a href="${pageContext.request.contextPath}/bbs/list"><i class="fa fa-info-circle"></i> 커뮤니티 </a>
				                 </li>
				              </ul>
				           </li>
				        </ul>
				    </nav>
				
				    <nav class="secondary">
				        <ul>
				           <li><a href="${pageContext.request.contextPath}/company/introduction">회사소개</a></li>
				           <li><a href="${pageContext.request.contextPath}/faq/main">자주묻는 질문</a></li>
				           <li><a href="${pageContext.request.contextPath}/">1:1문의</a></li>
				           <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
				           <li><a href="${pageContext.request.contextPath}/terms/list">서비스이용약관</a></li>
				        </ul>
				    </nav>
				
				</div>
			</div>
		</div>
	</div>
</main>