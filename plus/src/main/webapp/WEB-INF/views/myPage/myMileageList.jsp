<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table td {
	height: 60px;
	line-height: 60px;
}
.modal-backdrop{
	background-color: transparent;
	zindex: 9999;
	width: 0px;
	height: 0px;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
  .modal:before {
          display: inline-block;
          vertical-align: middle;
          content: " ";
          height: 100%;
  }
}
 
.modal-dialog {
        display: inline-block;
        text-align: center;
        vertical-align: middle;
}
</style>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
			<div class="body-container" style="width: 90%; margin: 10% auto;">
				<div class="body-main">

					<h3 class="mb-3 p-2" style="border-bottom: 2px solid #32B0E4;">
						<i class="bi bi-piggy-bank-fill"></i> 적립금 사용/적립 내역

						<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/myPage/mileage/list';" title="새로고침" style="float: right; background: #46AA46;">
							<i class="bi bi-arrow-counterclockwise"></i>
						</button>
					</h3>

						<div>
							총 적립금 : <span class="fw-semibold" style="color: #32B0E4;"><fmt:formatNumber value="${totalMileage}" pattern="#,###원" /></span>, 총 <span class="fw-semibold">${dataCount}</span>개의 내역 (<span class="fw-semibold">${page}</span>/<span class="fw-semibold">${total_page}</span> 페이지)
						</div>
						<div class="card mb-5 mt-4"
							style="margin: 0 auto; border: none;">
							<table class="table table-border table-list table-hover">
								<thead>
									<tr style="border-top: 1px solid #d8d8d8;" class="text-center">
										<th width="10">번호</th>
										<th width="80">클래스</th>
										<th width="40">포인트</th>
										<th width="50">사용일/적립일</th>
										<th width="30">사용/적립</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr class="MileageDetail text-center">
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="text-start">${dto.className}</td>
											<c:if test="${dto.mState == 0}">
												<td style="color: #32B0E4;">${dto.point}</td>
											</c:if>
											<c:if test="${dto.mState == 1}">
												<td style="color: red;">${dto.point}</td>
											</c:if>
											<c:if test="${dto.mState == 2}">
												<td style="color: green;">${dto.point}</td>
											</c:if>
											<td>${dto.mDate}</td>
											<c:if test="${dto.mState == 0}">
												<td style="color: #32B0E4;">적립</td>
											</c:if>
											<c:if test="${dto.mState == 1}">
												<td style="color: red;">사용</td>
											</c:if>
											<c:if test="${dto.mState == 2}">
												<td style="color: green;">환불</td>
											</c:if>
											<input type="hidden" name="mNum" value="${dto.mNum}">
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
<!--
							<table class="table">
								<tr>
									<td align="center">
										<form name="searchForm"
											action="${pageContext.request.contextPath}/myPage/mileage/list"
											style="width: 300px; margin-left: 100px">
											<div class="input-group mb-1">
												<select name="schType" class="form-select">
													<option value="all" ${schType=="all"?"selected":""}>클래스</option>
													<option value="mDate" ${schType=="mDate"?"selected":""}>사용일</option>
												</select> <input type="text" name="kwd" value="${kwd}"
													class="form-control">
												<button type="button" class="btn btn-success"
													onclick="searchList()">
													<i class="bi bi-search"></i>
												</button>
											</div>
										</form>
									</td>
									<td align="right" width="120"></td>
								</tr>
							</table>
 -->

							<div class="modal fade" id="MileageDetailModal" tabindex="-2" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">적립금 상세 내역</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">...</div>
									</div>
								</div>
							</div>

							<div class="page-navigation text-center mb-3">${dataCount == 0 ? "적립금 내역이 존재하지 않습니다." : paging}
							</div>
						</div>
					</div>
				</div>
			</div>
</main>

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
	$(function(){
		$(".MileageDetail").click(function(){
			
			let mNum = $(this).find("input[name='mNum']").val();
			let url = '${pageContext.request.contextPath}/myPage/mileage/mileageDetail';
			let query = 'mNum=' + mNum;
			
			const fn = function(data){
				var className = data.className;
				var classDate = data.classDate;
				var point = data.point;
				var classTime = data.classTime;
				var mDate = data.mDate;
				var mState = data.mState;
				var state = data.state;
				
				var html;
				html = '<div class="modal-body">';
				html += '	<table style="width: 100%; border: 1px solid black; border-collapse: collapse; text-align: center;">'
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">클래스</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + className + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">수업날짜</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + classDate + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">적립금</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + point + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">수업시간</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + classTime + '시간' + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">사용/적립일</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + mDate + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black; padding: 5px;">상태</td>';
				html += '			<td style="border: 1px solid black; padding: 5px;">' + state + '</td>';
				html += '		</tr>';
				html += '	</table>';
				html += '</div>';
				
				$("#MileageDetailModal .modal-body").html(html);
				$("#MileageDetailModal").modal("show");
			};
			
			ajaxFun(url, 'get', query, 'json', fn);
		});
	});
</script>