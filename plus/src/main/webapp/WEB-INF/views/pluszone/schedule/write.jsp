<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function sendOk() {
    const f = document.scheduleForm;
	let str;
	
	if( ! f.subject.value.trim() ) {
		f.subject.focus();
		return;
	}
	
	if(! f.cNum.value ) {
		f.cNum.focus();
		return;
	}
	
	if( ! f.sDay.value ) {
		f.sDay.focus();
		return;
	}
	
	if( f.eDay.value ) {
		let s1 = f.sDay.value.replace(/-/g, "");
		let s2 = f.eDay.value.replace(/-/g, "");
		if(s1 > s2) {
			f.sDay.focus();
			return;
		}
	}

	if( f.eTime.value ) {
		let s1 = f.sTime.value.replace(/:/g, "");
		let s2 = f.eTime.value.replace(/:/g, "");
		if(s1 > s2) {
			f.sTime.focus();
			return;
		}
	}

	if($("#form-eDay").val() && $("#form-allDay").is(":checked")) {
		$("#form-eDay").val(daysLater($("#form-eDay").val(), 1));
	}
	
    f.action = "${pageContext.request.contextPath}/pluszone/schedule/${mode}";
    f.submit();
}

$(function(){
	$("#form-allDay").click(function(){
		if(this.checked === true) {
			$("#form-sTime").val("").hide();
			$("#form-eTime").val("").hide();
		} else if(this.checked === false ){
			$("#form-sTime").val("00:00").show();
			$("#form-eTime").val("00:00").show();
		}
	});

	$("#form-sDay").change(function(){
		$("#form-eDay").val($("#form-sDay").val());
	});
	
	
});

$(function(){
	$("#form-color").css("background-color", $("#form-color").val());
	$("#form-color").css("color", "#fff");
	$("#form-color").change(function(){
		$(this).css("background-color", $(this).val());
	});
});
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-calendar-event"></i> 일정관리 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="scheduleForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="bg-light col-2" scope="row">제 목</td>
						<td>
							<div class="row">
								<div class="col">
									<input type="text" name="subject" id="form-subject" class="form-control" value="${dto.subject}">
								</div>
							</div>
							<small class="form-control-plaintext">* 제목은 필수 입니다.</small>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-2" scope="row">일정분류</td>
						<td>
							<div class="row">
								<div class="col-5">
									<select name="cNum" id="form-cNum" class="form-select">
										<%-- <option value="0">설정하지 않음</option> --%>
										<c:forEach var="vo" items="${listCategory}">
											<option value="${vo.cNum}" ${dto.cNum == vo.cNum ? "selected":""}>${vo.cName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<small class="form-control-plaintext">* 카테고리는 일정 메인화면에서 설정합니다.</small>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-2" scope="row">색 상</td>
						<td>
							<div class="row">
								<div class="col-5">
									<select name="color" id="form-color" class="form-select">
										<option value="blue" style="background:blue;" ${dto.color=="blue"?"selected":""}>파랑</option>
										<option value="green" style="background:green;" ${dto.color=="green"?"selected":""}>녹색</option>
										<option value="red" style="background:red;" ${dto.color=="red"?"selected":""}>빨강</option>
										<option value="orange" style="background:orange;" ${dto.color=="orange"?"selected":""}>주황</option>
										<option value="tomato" style="background:tomato;" ${dto.color=="chartreuse"?"selected":""}>토마토</option>
										<option value="magenta" style="background:magenta;" ${dto.color=="cyan"?"selected":""}>마젠타</option>
										<option value="purple" style="background:purple;" ${dto.color=="purple"?"selected":""}>보라</option>
										<option value="brown" style="background:brown;" ${dto.color=="brown"?"selected":""}>갈색</option>
										<option value="navy" style="background:navy;" ${dto.color=="navy"?"selected":""}>남색</option>
										<option value="gray" style="background:gray;" ${dto.color=="gray"?"selected":""}>회색</option>
										<option value="black" style="background:black;" ${dto.color=="black"?"selected":""}>검정</option>
									</select>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="bg-light col-2" scope="row">종일일정</td>
						<td class="py-3">
							<div class="row">
								<div class="col">
									<input type="checkbox" name="allDay" id="form-allDay" class="form-check-input" 
										 value="1" ${dto.allDay == 1 ? "checked ":"" } >
									<label class="form-check-label" for="form-allDay"> 하루종일</label>
								</div>
							</div>
						</td>
					</tr>

 					<tr>
						<td class="bg-light col-2" scope="row">시작일자</td>
						<td>
							<div class="row">
								<div class="col-5 pe-0">
									<input type="date" name="sDay" id="form-sDay" class="form-control" value="${dto.sDay}">
								</div>
								<div class="col-3">
									<input type="time" name="sTime" id="form-sTime" class="form-control" value="${dto.sTime}"
										style="display: ${dto.allDay == 1 ? 'none;':'inline-block;'}">
								</div>
							</div>
							<small class="form-control-plaintext">* 시작날짜는 필수입니다.</small>
						</td>
					</tr>

 					<tr>
						<td class="bg-light col-2" scope="row">종료일자</td>
						<td>
							<div class="row">
								<div class="col-5 pe-0">
									<input type="date" name="eDay" id="form-eDay" class="form-control" value="${dto.eDay}">
								</div>
								<div class="col-3">
									<input type="time" name="eTime" id="form-eTime" class="form-control" value="${dto.eTime}"
										style="display: ${dto.allDay==1 ? 'none;':'inline-block;'}">
								</div>
							</div>
							<small class="form-control-plaintext">종료일자는 선택사항이며, 시작일자보다 작을 수 없습니다.</small>
						</td>
					</tr>
					<tr>
						<td class="bg-light col-2" scope="row">내 용</td>
						<td>
							<textarea name="sContent" id="form-sContent" class="form-control" style="height: 90px;">${dto.sContent}</textarea>
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'일정등록'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/pluszone/schedule/main';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="sNum" value="${dto.sNum}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>