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
</style>

<script type="text/javascript">
	function searchList() {
		const f = document.searchForm;
		f.submit();
	}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 10% auto;">
				<div class="body-main">

					<h3 class="mb-3 p-2" style="border-bottom: 3px solid black;">
						<i class="bi bi-question-circle"></i> 적립금 사용/적립 내역

						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/mileage/myMileageList';"
							title="새로고침" style="float: right;">
							<i class="bi bi-arrow-counterclockwise"></i>
						</button>
					</h3>

					<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">총 적립금 : ${totalMileage}, <font
									style="color: green; font-weight: bold; text-decoration: underline"></font>총
									${dataCount}개의 내역 (${page}/${total_page} 페이지)
								</td>
								<td align="right">&nbsp;</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 text-center"
							style="margin: 0 auto; border: none;">
							<table class="table table-border table-list table-hover">
								<thead>
									<tr>
										<th width="60">번호</th>
										<th>클래스</th>
										<th width="90">포인트</th>
										<th width="150">사용일/적립일</th>
										<th width="90">사용/적립</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr class="MileageDetail">
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">${dto.className}</td>
											<td>${dto.point}</td>
											<td>${dto.mDate}</td>
											<td>${dto.mState == 0 ? "적립" : "사용"}</td>
											<input type="hidden" name="mNum" value="${dto.mNum}">
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<table class="table">
								<tr>
									<td align="center">
										<form name="searchForm"
											action="${pageContext.request.contextPath}/mileage/myMileageList"
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

							<div class="modal fade" id="MileageDetailModal" tabindex="-2"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel"><i class="bi bi-wallet2"></i> 적립금</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">...</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>

							<div class="page-navigation text-center mb-3">${dataCount == 0 ? "적립금 내역이 존재하지 않습니다." : paging}
							</div>
						</div>
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
			let url = '${pageContext.request.contextPath}/mileage/mileageDetail';
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
				html += '	<table style="width: 100%; border: 1px solid black; border-collapse: collapse;">'
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">클래스</td>';
				html += '			<td style="border: 1px solid black">' + className + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">수업날짜</td>';
				html += '			<td style="border: 1px solid black">' + classDate + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">적립금</td>';
				html += '			<td style="border: 1px solid black; color: red;">' + point + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">수업시간</td>';
				html += '			<td style="border: 1px solid black">' + classTime + '시간' + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">사용/적립일</td>';
				html += '			<td style="border: 1px solid black">' + mDate + '</td>';
				html += '		</tr>';
				html += '		<tr style="border: 1px solid black">';
				html += '			<td style="border: 1px solid black">상태</td>';
				html += '			<td style="border: 1px solid black; color: red;">' + state + '</td>';
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