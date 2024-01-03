<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/lessonPlus/main">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}" />
		<c:param name="kwd" value="${kwd}" />
	</c:if>
	<c:if test="${not empty mainNum}">
		<c:param name="mainNum" value="${mainNum}"/>
	</c:if>
	<c:if test="${not empty subNum}">
		<c:param name="subNum" value="${subNum}"/>
	</c:if>
	<c:if test="${not empty tagNum}">
		<c:param name="tagNum" value="${tagNum}"/>
	</c:if>
</c:url>

<script type="text/javascript">
	window.addEventListener('load', function() {
		let page = ${page};
		let pageSize = ${size};
		let dataCount = ${dataCount};
		let url = '${listUrl}';

		let total_page = pageCount(dataCount, pageSize);
		let paging = pagingUrl(page, total_page, url);

		document.querySelector('.dataCount').innerHTML = dataCount + '개 (' + page + '/' + total_page + '페이지)';

		document.querySelector('.page-navigation').innerHTML = dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
	});
	
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
	
	$(function(){
		$("form select[name=mainNum]").change(function(){
			let mainNum = $(this).val();
			
			$("form select[name=subNum]").find('option').remove().end()
				.append("<option value=''>서브 카테고리</option>");	
			
			if(! mainNum) {
				return false;
			}
			
			let url = "${pageContext.request.contextPath}/lesson/listSubCategory";
			let query = "mainNum="+mainNum;
			
			const fn = function(data) {
				$.each(data.listSubCategory, function(index, item){
					let subNum = item.subNum;
					let subName = item.subName;
					let s = "<option value='"+subNum+"'>"+subName+"</option>";
					$("form select[name=subNum]").append(s);
				});
			};
			ajaxFun(url, "get", query, "json", fn);
			
		});
	});	
</script>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 5% auto;">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-app"></i> 클래스 등록
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/lessonPlus/main';"
							title="새로고침" style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
						
							<button type="button" class="btn btn-success me-3" onclick="location.href='${pageContext.request.contextPath}/lessonPlus/write';" style="float: right;">등록하기</button>
					</h3>
				
					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">총 <font style="color: green; font-weight: bold; text-decoration: underline">${dataCount}개</font>
									(${page}/${total_page} 페이지)
								</td>
								<td align="right">&nbsp;</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 " style="margin: 0 auto">
							<table class="table table-hover table-list">
								<thead>
									<tr style="text-align: center">
										<th width="60">번호</th>
										<th>클래스</th>
										<th width="150">시작일</th>
										<th width="150">종료일</th>
										<th width="150">등록일</th>
										<th width="100">가격</th>
										<th width="100">메인카테고리</th>
										<th width="100">서브카테고리</th>
										<th width="100">해시태그</th>
										<th width="90">승인상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr style="text-align: center">
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<c:url var="updateUrl" value="/lessonPlus/update">
													<c:param name="classNum" value="${dto.classNum}" />
													<c:param name="page" value="${page}" />
												</c:url> 
												<a href="${updateUrl}" class="text-reset">${dto.className}</a></td>
											<td>${dto.startDate}</td>
											<td>${dto.endDate}</td>
											<td>${dto.regDate}</td>
											<td>${dto.price}</td>
											<td>${dto.mainName}</td>
											<td>${dto.subName}</td>
											<td>${dto.tagName}</td>
											<td>${dto.memo}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<table class="table">
								<tr>
									<td align="center">
										<form class="row" name="searchForm" action="${pageContext.request.contextPath}/lessonPlus/main" method="post" style="width:600px;">
											<div class="input-group mb-3">
												<select name="mainNum" class="form-select">
													<option value="0">메인카테고리</option>
													<c:forEach var="vo" items="${listMainCategory}">
														<option value="${vo.mainNum}" ${mainNum == vo.mainNum ? "selected" : ""}>${vo.mainName}</option>
													</c:forEach>
												</select>
												<select name="subNum" class="form-select">
													<option value="0">서브카테고리</option>
													<c:forEach var="vo" items="${listSubCategory}">
														<option value="${vo.subNum}" ${subNum == vo.subNum ? "selected" : ""}>${vo.subName}</option>
													</c:forEach>
												</select>
											
												<select name="schType" class="form-select">
													<option value="className" ${schType=="className"?"selected":""}>클래스이름</option>
													<option value="regDate" ${schType=="regDate"?"selected":""}>등록일</option>
													<option value="memo" ${schType=="memo"?"selected":""}>승인상태</option>
													<option value="highPrice" ${schType=="highPrice"?"selected":""}>높은가격순</option>
													<option value="lowPrice" ${schType=="lowPrice"?"selected":""}>낮은가격순</option>
												</select> 
												<input type="text" name="kwd" value="${kwd}" class="form-control">
												<button type="button" class="btn btn-success" onclick="searchList()">
													<i class="bi bi-search"></i>
												</button>
											</div>
										</form>
									</td>
								</tr>
							</table>
							
							<div class="page-navigation dataCount text-center mb-3">
								${dataCount == 0 ? "등록된 클래스가 없습니다." : paging}
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>