<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
function sendOk() {
	const f = document.paymentForm;
	
	if(! f.recipientName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}

	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "BC 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	f.action = "${pageContext.request.contextPath}/order/paymentOk"
	f.submit();
}
</script>


<style>
@import url("https://fonts.googleapis.com/css?family=Raleway:300,400,700");


#main {
	position: relative;
	width: 700px;
	height: 500px;
	margin:10% auto;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
	background-color: white;
}

#left {
	position: relative;
	background: url("${pageContext.request.contextPath}/resources/images/keyimage3.jpg");
	background-size: cover;
	background-position: center;

	height: calc(100% + 50px);
	width: 40%;
	top: -35px;
	left: -50px;
	padding: 10px 25px;

	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);

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

#right form input,
#right form select {
	-moz-appearance:none;
	-webkit-appearance:none;
	appearance:none;
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

#right form button[type="submit"] {
	background: linear-gradient(
	135deg,
	#4183d7 0%,
	#66cc99 100%);
	padding: 5px;
	border: none;
	border-radius: 50px;
	color: white;
	font-weight: 400;
	font-size: 12pt;
	margin-top: 10px;
}

#right form button[type="submit"]:hover {
	background: transparent;
	box-shadow: 0 0 0 3px #4183d7;
	color: #4183d7;
}
</style>


<main class="wrapper main" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; ">
					<div class="body-main">
						<main id="main">
							<section id="left">
								<div id="head">
									<h1>클래스 명</h1>
									<p>강사님 이름</p>
								</div>
								<h3>10000원</h3>
							</section>
							<section id="right">
								<h1 class="text-center">payment</h1>
								<form action="paymentForm">
									<div id="form-card" class="form-field">
										<label for="userName">예약자명</label>
										<input id="userName" maxlength="19" placeholder="이름" required>
									</div>
	
									<div id="form-card" class="form-field">
										<label for="count">인원수</label>
										<input id="count" maxlength="19" placeholder="인원수" required>
									</div>
						
									<div id="form-date" class="form-field">
										<label for="expiry-month">예약날짜</label>
										<input type="date">
									</div>
									
									<div id="form-sec-code" class="form-field">
										<label for="sec-code">적립금</label>
										<input type="number" maxlength="3" placeholder="남은적립금 : 0" required>
									</div>
				
									<button type="submit">할인된 총 금액</button>
								</form>
							</section>
						</main>
					</div>
				</div>
			</div>
		</div>
	</main>