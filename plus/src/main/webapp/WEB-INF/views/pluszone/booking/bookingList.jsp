<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">

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
		$("#tab-0").addClass("active");

		$("ul.tabs li").click(function() {
			let tab = $(this).attr("data-tab");

			$("ul.tabs li").each(function() {
				$(this).removeClass("active");
			});

			$("#tab-" + tab).addClass("active");

			let url = "${pageContext.request.contextPath}/pluszone/booking/bookingOk?detailNum=${detailNum}";
			location.href = url;
		});
	});

	function login() {
		location.href = '${pageContext.request.contextPath}/member/login';
	}
	
	function checkAll(checkAll){
		const checkboxes = document.querySelectorAll('input[name=book]');
		checkboxes.forEach((checkbox) => {
			checkbox.checked = checkAll.checked
		})
	}
	$(function(){
		$('.btnSend').click(function(){
			var arrayValue = [];
			$('input:checkbox[name=book]').each(function(index){
				if($(this).is(":checked") == true){
					arrayValue.push($(this).val());
				}
			});
			let url = "${pageContext.request.contextPath}/pluszone/booking/update";
			let query = "arrayValue=" + arrayValue;
			
			const fn = function(data){
				let state = data.state;
				if(state === "true"){
					location.href = location.href;
				} else if(state === "false"){
					alert('예약 상태 처리를 실패하였습니다.');
				}
			};
			ajaxFun(url, 'post', query, 'json', fn);
		});
	});
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 5% auto;">
				<div class="body-main">

					<h3 class="mb-3 p-2" style="border-bottom: 3px solid black;">
						<i class="fa-solid fa-user-group"></i> 예약관리
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/pluszone/booking/bookList?detailNum=${detailNum}';"
							style="float: right;">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</button>
					</h3>

					<div>
						<ul class="tabs">
							<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;예약대기
								리스트</li>
							<li id="tab-1" data-tab="1"><i
								class="fa-solid fa-chart-column"></i>&nbsp;예약확정 리스트</li>
						</ul>
					</div>

					<div id="tab-content" style="padding: 20px 0px 0;">
						<table class="table">
							<tr>
								<td align="left" width="70%" style="font-weight: bold"> 예약대기 <font style="color: green; font-weight: bold; text-decoration: underline">${dataCount}명</font>
									(${page}/${total_page} 페이지)
								</td>
							</tr>
						</table>

						<div class="card mb-5 w-80 text-center" style="margin: 0 auto">
							<div style="float: left; width: 13.33%;" class="mt-3 text-start ms-3">
								<button type="button" class="btn btn-outline-success btnSend"
									style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;">예약확정</button>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkAll" onclick="checkAll(this);"></th>
												<th>번호</th>
												<th>클래스</th>
												<th>아이디</th>
												<th>생년월일</th>
												<th>전화번호</th>
												<th>인원수</th>
												<th>상태</th>
												<th>예약일</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="dto" items="${list}" varStatus="status">
												<tr class="hover">
													<td><input type="checkbox" name="book" value="${dto.orderNum}"></td>
													<td>${dataCount - (page-1) * size - status.index}</td>
													<td>${dto.className}</td>
													<td>${dto.userId}</td>
													<td>${dto.birth}</td>
													<td>${dto.tel}</td>
													<td>${dto.orderCount}</td>
													<td>${dto.stateName}</td>
													<td>${dto.oDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="page-navigation">${dataCount == 0 ? "예약된 정보가 없습니다." : paging}
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<div id="member-dialog" style="display: none;"></div>
