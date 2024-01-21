<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
@font-face {
	font-family: 'JalnanGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
    font-family: 'EASTARJET-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/EASTARJET-Medium.woff2') format('woff2');
    font-weight: 500;
    font-style: normal;
}
.body-title{
	font-family: 'JalnanGothic';
}
.table-border{
	border-bottom: 2px solid black;
	padding: 0px;
	margin: 0px;
}
.eventHide{
	border: 1px solid black;
	margin-bottom: 5px;
}
.eventHide:hover{
	border: 2px solid black;
}
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				<h3 class="p-2 mb-3" style="border-bottom:3px solid #cccccc;">
					<i class="bi bi-front"></i> 제안 문의
				</h3>
				<table class="table-border table mt-4">
					<tr>
						<td align="left" width="50%" style="margin-top: 20px;">
							<span style="margin-left: 5px; position: inherit;"><span style="color: #32B0E4;">${dataCount}개</span>(${page}/${total_page} 페이지)</span>
						</td>
					</tr>
				</table>
					
				<form name="listForm" method="post">
					<table class="table-list table">
						<thead>
							<tr style="font-family: 'EASTARJET-Medium';">
								<th style="text-align: center; width: 20px;">번호</th>
								<th style="text-align: center; width: 20px;">제안자</th>
								<th style="text-align: center; width: 120px;">클래스명</th>
								<th style="text-align: center; width: 120px;">제안 내용</th>
								<th style="text-align: center; width: 40px;">등록일</th>
							</tr>
						</thead>
				
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td style="text-align: center;">${dataCount - (page-1) * size - status.index}</td>			
									<td class="userId" style="text-align: center;">${dto.userName}</td>
									<td class="className" style="text-align: center;">${dto.className}</td>
									<td class="content" style="text-align: center;">${dto.content}</td>
									<td class="regDate" style="text-align: center;">${dto.regDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<input type="hidden" name="page" value="${page}">
				</form>	
				
				<div class="page-navigation">
					${dataCount==0?"등록된 게시물이 없습니다.":paging}
				</div>
				
			</div>
		</div>
	</div>
</div>
</main>
