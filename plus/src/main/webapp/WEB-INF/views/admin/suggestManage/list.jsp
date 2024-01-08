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
.body-container{
	width: 1100px;
	height: 100%;
	margin-top: 150px;
	margin-left: 480px;
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
		let url = "${pageContext.request.contextPath}/admin/suggestManage/hide";
		let query;
		
		var param = [];
		var classDec = [];
	
		 if (cnt === 0) {
        	 alert("숨길 게시물을 먼저 선택 하세요.");
             return false;
         } else{        	 
        	 $("input[name=declarats]:checked").each(function(idx){
        		 let sugNum = $(this).val();

        		 classDec = {
     	        	sugNum : $("#sugNum" + sugNum).val(),
     	        	userId : $("#userId" + sugNum).val(),
     	        	userName : $("#userName" + sugNum).val(),
     	        	classNum : $("#classNum" + sugNum).val(),
     	        	className : $("#className" + sugNum).val(),
     	        	content : $("#content" + sugNum).val(),
     	        	rehDate : $("#regDate" + sugNum).val(),
     	        	//result : $("#result" + rNum).val()
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
     					url="${pageContext.request.contextPath}/admin/suggestManage/list";
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

</head>
<body>

<div class="body-container">
<div class="body-title">
	<h3><i class="bi bi-exclamation-diamond-fill" style="margin-left: 2px;"></i> 제안 문의</h3>
</div>
	<table class="table-border table">
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
							<input type="checkbox" name="declarats" value="${dto.sugNum}" style="margin-left: 15px;">
						</td>			
						<td class="userId">${dto.userId}(${dto.userName})</td>
						<td class="className">${dto.className}</td>
						<td class="content">${dto.content}</td>
						<td class="regDate">${dto.regDate}</td>
						<td style="text-align: center;">
							
						<input type="hidden" name="sugNum${dto.sugNum}" id="sugNum${dto.sugNum}" value="${dto.sugNum}">
						<input type="hidden" name="userId${dto.sugNum}" id="userId${dto.sugNum}" value="${dto.userId}"/>
						<input type="hidden" name="userName${dto.sugNum}" id="userName${dto.sugNum}" value="${dto.userName}">
						<input type="hidden" name="className${dto.sugNum}" id="className${dto.sugNum}" value="${dto.className}">
						<input type="hidden" name="classNum${dto.sugNum}" id="classNum${dto.sugNum}" value="${dto.classNum}"/>
						<input type="hidden" name="content${dto.sugNum}" id="content${dto.sugNum}" value="${dto.content}">
						<input type="hidden" name="regDate${dto.sugNum}" id="regDate${dto.sugNum}" value="${dto.regDate}"/>
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<input type="hidden" name="page" value="${page}">
	</form>	
	
	<div class="page-navigation" style="opacity: 0.7;">
		${dataCount==0?"등록된 게시물이 없습니다.":paging}
	</div>
	
</div>

</body>
</html>