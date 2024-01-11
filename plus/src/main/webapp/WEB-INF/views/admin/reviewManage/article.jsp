<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

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
function hideOrShowOk(){
	let category = "${category}";
	let query = "page=${page}&reviewNum=${dto.reviewNum}";
	let url = "${pageContext.request.contextPath}/admin/reviewManage/"+category+"/change?"+query;
	
	let s = "";
	if(category === "all"){
		s = "위의 자료를 숨기시겠습니까?";
	} else {
		s = "위의 자료를 공개하시겠습니까?";
	}
	
	if( ! confirm(s) ) {
		return;
	}
	
	const fn = function(data){
		let state = data.state;
		let category = data.category;
		let page = data.page;
		
		query = "page="+page;
		url = "${pageContext.request.contextPath}/admin/reviewManage/"+category+"/list";
		
		location.href = url;
	};
	ajaxFun(url, "get", query, "json", fn);
}
</script>
<div class="container" style="margin-top: 70px;">
	<div class="body-container">	
		
		<div class="body-main">

			<table class="table mt-5 mb-0 board-article" style="margin-left: 80px;">
				<thead>
					<tr>
						<td colspan="2" align="center" style="border-top: 1px solid black;">
							제목: ${dto.reviewSubject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 : ${dto.userName}(${dto.userId})						
						</td>
						<td align="right">
							클래스명 : ${dto.className}
							<span style="color: gray;">(수강일: ${dto.cDate}, 작성일: ${dto.reviewDate})</span>
						</td>
					</tr>

					<tr>
						<td colspan="2" style="border-bottom: none;">
							<img src="${pageContext.request.contextPath}/uploads/review/${dto.filename}"
								class="img-fluid img-thumbnail w-100 h-auto">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							${dto.reviewContent}
						</td>
					</tr>
					<tr>
						<td width="50%">
							평점 : <span style="color: blue;">${dto.reviewScore}</span> / 5점
						</td>
						<td align="right">
							숨김여부: <span style="color: red;">${showResult}</span>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless" style="margin-left: 80px;">
				<tr>
					<td width="50%">
						<input type="hidden" name="category" value = "${category}">
				    	<button type="button" class="btn btn-light" onclick="hideOrShowOk();">${mode}</button>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/reviewManage/${category}/list?page=${page}';">돌아가기</button>
					</td>
				</tr>
			</table>

		</div>
	</div>
</div>