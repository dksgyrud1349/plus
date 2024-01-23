<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@font-face {
	font-family: 'JalnanGothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SUIT-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'SejonghospitalBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/SejonghospitalBold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.subjectName {
	margin: 20px auto;
}

.subjectName2 {
	font-family: 'JalnanGothic';
}

.orderNum {
	color: gray;
	font-family: 'SUIT-Regular';
	font-weight: bold;
	margin-bottom: 15px;
}

.myPageB {
	background-color: white;
	border: 1px solid blue;
	color: blue;
	width: 100px;
	height: 30px;
}

.myPageB:hover {
	font-weight: bold;
}

.centerName {
	background-color: white;
	border: 1px solid #787878;
	color: 787878;
	float: inherit;
	width: 100px;
	height: 30px;
}

.centerName:hover {
	font-weight: bold;
}

hr {
	background: black;
	height: 1px;
	border: 0;
}

.firstD{
	border-top: 2px solid black;
	width: 1100px;
	height: 80px;
	border-collapse: collapse;
	border-bottom: 1px solid #BDBDBD;
	text-align: center;
}
.secondD{
	border-top: 2px solid black;
	width: 1100px;
	heigth: 200px;
	margin-top: 10px;
	border-collapse: collapse;
	text-align: center;
}
.borderStyle{
	background-color: #eaeaea;
	width: 270px;
	font-weight: bold;
	border: 1px solid #BDBDBD;
	border-left: none;
}
.borderStyle2{
	border: 1px solid #BDBDBD;
	border-right: none;
	font-family: 'Pretendard-Regular';
}
</style>
<body>
	<div style="height: 800px; margin-top: 120px; margin-left: 70px;">
		<div style="width: 1100px; height: 280px; text-align: center;">
			<div class="subjectName">
				<div style="border-top: 2px solid black;"></div>
				<br>
				<br>
				<h3 class="subjectName2">
					예약이 성공적으로 <span style="color: blue;">완료</span>되었습니다.
				</h3>
				<div class="orderNum">예약번호: ${dto.orderNum}</div>
				<button class="myPageB" type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/main';">마이
					페이지</button>
				<button class="centerName" type="button" onclick="location.href='${pageContext.request.contextPath}/faq/main';">고객센터</button>
				<div style="margin-top: 50px;">
					<hr>
				</div>
			</div>
		</div>
		<div>
			<div style="margin-bottom: 10px; font-size: 20px;">
				<div style="font-family: 'SejonghospitalBold';">예약상품내역</div>
			</div>
		</div>


		<table class="firstD">
			<thead>
				<tr style="height: 40px; background-color: #eaeaea;">
					<th colspan="1">수강일자</th>
					<th colspan="1">클래스명</th>
					<th colspan="1">신청 인원수</th>
					<th colspan="1">가격</th>
					<th colspan="1">예약상태</th>
				</tr>
			</thead>
		
			<tbody>
				<tr style="height: 10px; margin-left: 5px; text-align: center; font-family: 'Pretendard-Regular';">
					<td colspan="1">${dto.cDate}</td>
					<td colspan="1">${dto.className}</td>
					<td colspan="1">${dto.count}</td>
					<td colspan="1">${dto.pay}원</td>
					<td colspan="1" style="color: red;">${mode}</td>
				</tr>
			</tbody>
		</table>
		<div>
			<div style="margin-top: 40px; font-size: 20px;">
				<div style="font-family: 'SejonghospitalBold';">예약정보(예약자)</div>
			</div>
		</div>
		<table class="secondD" style="border-left: none;">
			<tr style="height: 40px;">
				<td class="borderStyle"> 이름 </td>
				<td class="borderStyle2">${dto.userName}</td>
			</tr>
			<tr style="height: 40px;">
				<td class="borderStyle"> 회원ID </td>
				<td class="borderStyle2">${dto.userId}</td>
			</tr>
			<tr style="height: 40px;">
				<td class="borderStyle"> 휴대전화 </td>
				<td class="borderStyle2">${dto.tel}</td>
			</tr>
			<tr style="height: 40px;">
				<td class="borderStyle"> 이메일 </td>
				<td class="borderStyle2">${dto.email}</td>
			</tr>
			
		</table>
		
	</div>
</body>