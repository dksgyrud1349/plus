<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">

function payOk(){
	const f = document.paymentForm;
	const regex = /^\d+$/;
	let count = parseInt(f.count.value);
	let uMileage = parseInt(f.uMileage.value);
	let count1 = parseInt(f.count1.value);
	let totalMileage = parseInt(f.totalMileage.value);
	
	if(!regex.test(count)){
		alert("숫자만 입력하세요.");
		f.count.focus();
		return;
	}
	
	if(count > count1){
		alert("입력하신 인원수가 클래스의 최대 인원수를 초과하였습니다.");
		f.count.focus();
		return;
	}
	
	if(!regex.test(uMileage)){
		alert("숫자만 입력하세요.");
		f.uMileage.focus();
		return;
	}
	
	if(uMileage > totalMileage){
		alert("입력하신 마일리지가 고객님께서 보유하고 계신 마일리지를 초과하였습니다.");
		f.uMileage.focus();
		return;
	}

	
	if(!confirm("결제를 진행하시겠습니까?")){
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/order/insert";
    f.submit();
}
</script>

<style>
@import
	url("https://fonts.googleapis.com/css?family=Raleway:300,400,700");

#main {
	position: relative;
	width: 700px;
	height: 500px;
	margin: 10% auto;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	background-color: white;
}

#left {
	position: relative;
	background:
		url("${pageContext.request.contextPath}/resources/images/keyimage3.jpg");
	background-size: cover;
	background-position: center;
	height: calc(100% + 50px);
	width: 40%;
	top: -35px;
	left: -50px;
	padding: 10px 25px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	color: white;
	display: flex;
	flex-flow: column nowrap;
	justify-content: space-between;
}

#left #head {
	opacity: 0.95;
}

#right {
	position: absolute;
	width: calc(60% - 40px);
	height: 100%;
	top: 0;
	left: 40%;
	display: flex;
	flex-flow: column nowrap;
	padding-left: 20px;
}

#right form {
	display: flex;
	flex-flow: column nowrap;
	width: 100%;
}

#right form input, #right form select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	border: none;
	border-bottom: 1.5px solid #ccc;
	padding: 5px;
	margin-top: 2.5px;
	position: relative;
}

#right form .form-field {
	display: flex;
	flex-flow: column nowrap;
	justify-content: center;
	margin-bottom: 12.5px;
}

#right form #date-val {
	display: flex;
	justify-content: space-between;
}

#right form #date-val select {
	width: 45%;
}

#right form button[type="button"] {
	background: linear-gradient(135deg, #4183d7 0%, #66cc99 100%);
	padding: 5px;
	border: none;
	border-radius: 50px;
	color: white;
	font-weight: 400;
	font-size: 12pt;
	margin-top: 10px;
}

#right form button[type="button"]:hover {
	background: transparent;
	box-shadow: 0 0 0 3px #4183d7;
	color: #4183d7;
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

$(function(){
	$("form input[name=count]").change(function(){
		let count = $(this).val();
		if(! count){
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/order/cal1";
		let query = "count=" + count + "&price=" + ${lesson.price};
		
		const fn = function(data){
			let pay = data.pay;
			$("form input[name=pay]").attr('value', pay);
		};
		ajaxFun(url, "get", query, "json", fn);
	});
});

$(function(){
	$("form input[name=uMileage]").change(function(){
		let uMileage = $(this).val();
		if(! uMileage){
			return false;
		}
		
		var count = $("form input[name=count]").val();
		console.log(count);
		
		let url = "${pageContext.request.contextPath}/order/cal2";
		let query = "count=" + count + "&price=" + ${lesson.price} + "&uMileage=" + uMileage;
		
		const fn = function(data){
			let pay = data.pay;
			$("form input[name=pay]").attr('value', pay);
		};
		ajaxFun(url, "get", query, "json", fn);
	});
});
</script>

<main class="wrapper main" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 100%; margin: 5% auto;">
				<div class="body-main">
					<main id="main" style="width: 1000px; height: 1000px;">
						<section id="left">
							<div id="head">
								<p class="fs-3">${lesson.className}</p>
								<p>${lesson.userName}</p>
							</div>
							<h3><fmt:formatNumber value="${dto.price}" pattern="#,###" />${lesson.price}원</h3>
						</section>
						<section id="right">
							<h1 class="text-center">payment</h1>
							<form action="${pageContext.request.contextPath}/order/insert" method="post" name="paymentForm">
								<div id="form-card" class="form-field">
									<label for="userName">예약자명</label>
									<input type="text" name="userName" id="userName" value="${user.userName}" readonly>
								</div>

								<div id="form-card" class="form-field">
									<label for="birth">생년월일</label>
									<input type="text" name="birth" id="birth" value="${user.birth}" readonly>
								</div>

								<div id="form-date" class="form-field">
									<label for="classDate">예약날짜</label>
									<input type="text" name="classDate" id="classDate" value="${classDate1}" readonly>
								</div>
								
								<div id="form-date" class="form-field">
									<label for="startTime">시작시간</label>
									<input type="text" name="startTime" id="startTime" value="${startTime}" readonly>
								</div>
								
								<div id="form-date" class="form-field">
									<label for="endTime">종료시간</label>
									<input type="text" name="endTime" id="endTime" value="${endTime}" readonly>
								</div>

								<div id="form-card" class="form-field">
									<label for="count">인원수 (${lesson.count1}명 남았습니다.)</label>
									<input type="number" name="count" id="count" placeholder="인원수를 입력해주세요." min='1' max='${lesson.count1}' step='1' required>
								</div>

								<div id="form-sec-code" class="form-field">
									<label for="uMileage">적립금(사용) (${user.totalMileage}점 사용 가능합니다.)</label>
									<input type="number" name="uMileage" id="uMileage" placeholder="사용하실 적립금을 입력해주세요" min='0' max='${user.totalMileage}' step='1' value="0"> 
								</div>
								
								<div id="form-sec-code" class="form-field">
									<label for="mileage">적립금(적립)</label>
									<input type="number" name="mileage" id="mileage" value="${lesson.mileage}" readonly>
								</div>
								
								<div id="form-card" class="form-field">
									<label for="discountMoney">할인된 금액</label>
									<input type="number" name="discountMoney" id="discountMoney" value="${empty lesson.discountMoney ? 0 : lesson.discountMoney}" readonly>
								</div>
								
								<div id="form-card" class="form-field">
									<label for="discountPercent">할인 퍼센트</label>
									<input type="number" name="discountPercent" id="discountPercent" value="${lesson.discountPercent != null ? lesson.discountPercent : 0}" readonly>
								</div>
								<input type="hidden" name="classNum" value="${lesson.classNum}">
								<input type="hidden" name="detailNum" value="${lesson.detailNum}">
								<input type="hidden" name="pay1" id="pay1" value="${lesson.price}">
								<input type="hidden" name="count1" value="${lesson.count1}">
								<input type="hidden" name="totalMileage" value="${user.totalMileage}">
								
								<div id="form-card" class="form-field">
									<label for="pay">결제 금액</label>
									<div>
										<input id="pay" class="pay" name="pay" readonly>
									</div>
								</div>
								<button type="button" onclick="payOk();">결제하기</button>
							</form>
						</section>
					</main>
				</div>
			</div>
		</div>
	</div>
</main>