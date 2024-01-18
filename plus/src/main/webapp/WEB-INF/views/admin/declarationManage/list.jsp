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
<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}
$(function() {
    $(".chkAll").click(function() {
		let b = $(this).is(":checked");
	    $("form input[name=declarats]").prop("checked", b);
    });
 
    $(".btnHideList").click(function(){

		// let cnt = $("input[name=haks]:checkbox:checked").length;
		let cnt = $("form input[name=declarats]:checked").length;
		let url = "${pageContext.request.contextPath}/admin/declarationManage/hide";
		let query;
		
		var param = [];
		var classDec = [];

		 if (cnt === 0) {
        	 alert("숨길 게시물을 먼저 선택 하세요.");
             return false;
         } else{        	 
        	 $("input[name=declarats]:checked").each(function(idx){
        		 let rNum = $(this).val();

        		 classDec = {
     	        	rNum : $("#rNum" + rNum).val(),
     	        	userId : $("#userId" + rNum).val(),
     	        	userName : $("#userName" + rNum).val(),
     	        	classNum : $("#classNum" + rNum).val(),
     	        	className : $("#className" + rNum).val(),
     	        	rContent : $("#rContent" + rNum).val(),
     	        	reportDate : $("#reportDate" + rNum).val(),
     	        	result : $("#result" + rNum).val()
     	         };
            	 
    	        param.push(classDec);
        	 });
 
        	 query = JSON.stringify(param);
        	 
        	 $.ajax({
     			type: "POST",
     			url: url,
     			headers: {"content-type":"application/json"},
     			data: JSON.stringify(param),
     			dataType: "json",
     		    success: function(data) {
     				if(data.state=="success") {
     					url="${pageContext.request.contextPath}/admin/declarationManage/list";
     					location.href=url;
     				}
     			},
     			error: function(xhr) {
     				alert("에러코드 = "+xhr.status)
     			}
     		    
     		});
        	 
         }
         
    });
	
}); 
</script>




<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
				<h3 class="p-2 mb-3" style="border-bottom:3px solid black;">
					<i class="bi bi-exclamation-diamond-fill" style="margin-left: 2px;"></i> 신고 관리
				</h3>
				
				<table class="table-border table mt-4">
					<tr>
						<td align="left" width="50%" style="margin-top: 20px;">
							<button type="button" class="btn btnHideList eventHide">공개/비공개</button>
							<span style="margin-left: 5px; position: inherit;">${dataCount}개(${page}/${total_page} 페이지)</span>
						</td>
					</tr>
				</table>
					
				<form name="listForm" method="post">
					<table class="table-list table">
						<thead>
							<tr style="font-family: 'EASTARJET-Medium';">
								<th style="width: 20px; height: 20px;">
									<input type="checkbox" name="chkAll" class="chkAll" value="all" style="margin-left: 15px;">
								</th>		
								<th style="text-align: left; width: 20px;">신고자</th>
								<th style="text-align: left; width: 120px;">클래스명</th>
								<th style="text-align: left; width: 120px;">신고 내용</th>
								<th style="text-align: left; width: 40px;">신고일</th>
								<th style="text-align: left; width: 40px;">공개여부</th>
								
							</tr>
						</thead>
				
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>
										<input type="checkbox" name="declarats" value="${dto.rNum}" style="margin-left: 15px;">
									</td>			
									<td class="userId">${dto.userName}</td>
									<td class="className">${dto.className}</td>
									<td class="rContent">${dto.rContent}</td>
									<td class="reportDate">${dto.reportDate}</td>
									<td style="text-align: left">
										<c:if test="${dto.result eq '0'}">
											<span class="fw-bold"><i class="bi bi-eye"></i>&nbsp;공개</span>
										</c:if>
										<c:if test="${dto.result eq '1'}">
											<span class="fw-bold"><i class="bi bi-incognito"></i>&nbsp;비공개</span>
										</c:if>
									</td>
									<input type="hidden" name="rNum${dto.rNum}" id="rNum${dto.rNum}" value="${dto.rNum}">
									<input type="hidden" name="userId${dto.rNum}" id="userId${dto.rNum}" value="${dto.userId}"/>
									<input type="hidden" name="userName${dto.rNum}" id="userName${dto.rNum}" value="${dto.userName}">
									<input type="hidden" name="className${dto.rNum}" id="className${dto.rNum}" value="${dto.className}">
									<input type="hidden" name="classNum${dto.rNum}" id="classNum${dto.rNum}" value="${dto.classNum}"/>
									<input type="hidden" name="rContent${dto.rNum}" id="rContent${dto.rNum}" value="${dto.rContent}">
									<input type="hidden" name="reportDate${dto.rNum}" id="reportDate${dto.rNum}" value="${dto.reportDate}"/>
									<input type="hidden" name="result${dto.rNum}" id="result${dto.rNum}" value="${dto.result}"/>
									
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