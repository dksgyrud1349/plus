<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
@font-face {
    font-family: 'JalnanGothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'EASTARJET-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/EASTARJET-Medium.woff2') format('woff2');
    font-weight: 300;
    font-style: normal;
}
@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: 500;
    font-style: normal;
}
.total{
	width: 1200px;
	height: 1150px;
	border-top: 2px solid black;
}
.subject{
	font-weight: bold;
	font-size: x-large;
	margin-top: 100px;
	font-family: 'JalnanGothic';
}
.main_image_text{
	position: absolute;
    top: 14%;
    left: 45%;
    transform: translate( -50%, -50% );
    color: white;
    font-weight: 500;
    font-family: 'JalnanGothic';
    padding-bottom: 35px;
}
.body1_image_text{
    color: white;
    position: absolute;
    top: 17%;
    left: 50%;
    transform: translate( -50%, -50% );
    font-size: large;
    padding-top: 20px;
    padding-bottom: 20px;
    line-height: 1.3;
    font-family: 'EASTARJET-Medium';
}
.body2_image_text{
    color: white;
    position: absolute;
    top: 21%;
    left: 50%;
    transform: translate( -50%, -50% );
    font-size: large;
    line-height: 1.3;
    padding-top: 10px;
    font-family: 'EASTARJET-Medium';
}

.main2_image_text{
	position: absolute;
	top: 36.5%;
	left: 27%;
	transform: translate( -50%, -50% );
	font-weight: normal;
	font-size: 50px;
	color: black;
	font-family: 'JalnanGothic';
	margin-top: 55px;
}
.body3_image_text{
	color: black;
    position: absolute;
    top: 43%;
    left: 30%;
    transform: translate( -50%, -50% );
    font-size: large;
    font-family: 'MICEGothic Bold';
}
.body4_image_text{
	color: black;
    position: absolute;
    top: 44.3%;
    left: 25.6%;
    transform: translate( -50%, -50% );
    padding-top: 10px;
    font-family: 'MICEGothic Bold';
    font-size: large;
}
.main3_image_text{
	position: absolute;
	top: 56%;
	left: 25%;
	transform: translate( -50%, -50% );
	font-weight: normal;
	font-size: 50px;
	color: black;
	font-family: 'JalnanGothic';
	margin-top: 55px;
}
.body5_image_text{
	color: black;
    position: absolute;
    top: 62.5%;
    left: 31%;
    transform: translate( -50%, -50% );
    font-size: large;
    font-family: 'MICEGothic Bold';
}
.body6_image_text{
	color: black;
    position: absolute;
    top: 64.8%;
    left: 35.2%;
    transform: translate( -50%, -50% );
    font-size: large;
    font-family: 'MICEGothic Bold';
}
.total2{
	width: 1200px;
	height: 600px;
}
.main4_image_text{
	position: absolute;
    top: 79%;
    left: 46%;
    transform: translate( -50%, -50% );
    color: black;
    font-weight: 500;
    font-family: 'JalnanGothic';
    padding-bottom: 45px;
}
.body7_image_text{
    color: black;
    position: absolute;
    top: 82.5%;
    left: 24%;
    transform: translate( -50%, -50% );
    padding-top: 10px;
    padding-bottom: 20px;
    font-size: xx-large;
    font-family: 'GangwonEduPowerExtraBoldA';
}
.body8_image_text{
    color: black;
    position: absolute;
    top: 82.5%;
    left: 46.5%;
    transform: translate( -50%, -50% );
    line-height: 1.5;
    padding-top: 10px;
    padding-bottom: 20px;
    font-size: xx-large;
    font-family: 'GangwonEduPowerExtraBoldA';
}
.body9_image_text{
    color: black;
    position: absolute;
    top: 82.5%;
    left: 70.3%;
    transform: translate( -50%, -50% );
    line-height: 1.5;
    padding-top: 10px;
    padding-bottom: 20px;
    font-size: xx-large;
    font-family: 'GangwonEduPowerExtraBoldA';
}

.animation-container {
    overflow: hidden;
    position: relative;
}

.img-fade-in {
    opacity: 0;
    animation: fadeIn 3.0s ease-out forwards;
}

@keyframes fadeIn {
    to {
        opacity: 1;
    }
}
</style>

<div class="subject"> 회사 소개 + </div>

<div class="total">
<div class="animation-container">
	<img src="${pageContext.request.contextPath}/resources/images/introduction_1.png"
	style="width: 1200px; height: 500px; padding-top: 15px; object-fit: cover;" class="img-fade-in">
</div>	
	<h1 class="main_image_text" style="font-size: 50px;">원데이 플러스 회사 소개</h1>
	
	<h5 class="body1_image_text">
	원데이 플러스는 원데이 클래스를 통해 사람들에게 다양한 경험을 제공하는 회사입니다.
	우리의 비전은 사람들이 쉽게 배울 수 있도록 도우며, 우리의 가치관은 창의성, 혁신, 그리고 공동체입니다.
	</h5>
	<h5 class="body2_image_text">
	원데이 클래스는 다양한 강의와 워크샵을 통해 수강생들의 창의적인 재능과 기술을 개발할 수 있게 돕습니다.
	우리의 목표는 사람들이 새로운 것을 배우고, 새로운 취미와 기술을 개발하며, 주변 사람들과 교류하고 성장할수록 하는 것입니다.
	</h5>
	
	<div>
		<h3 class="main2_image_text"> 원데이 클래스란 무엇인가요? </h3>
		
		<div class="body3_image_text"> 원데이 클래스는 짧은 기간 동안 사람들이 특정 기술이나 분야에 대해 
		배울 수 있는 강의 형태입니다.
		</div>
		<div class="body4_image_text">
		원데이 클래스는 주로 작은 그룹으로 진행되며, 실습 중심의 학습 방식을 채택합니다.
		</div>
	
		<img src="${pageContext.request.contextPath}/resources/images/introduction_2.jpg"
		style="width: 450px; height: 400px; object-fit: cover; float: right; padding-top: 35px;
		padding-left: 15px; border-top-left-radius: 2.2cm; border-top-right-radius: 2cm; border-bottom-left-radius: 2cm;
		border-bottom-right-radius: 18%; overflow: hidden;">
	</div>
	
	<div>
		<h3 class="main3_image_text"> 우리 회사의 비전과 가치관 </h3>
		
		<div class="body5_image_text"> 우리 회사의 비전은 사람들이 열린 마음과 호기심을 가지고 새로운 것을 배울 수 있도록 하는 것입니다.
		</div>
		<div class="body6_image_text"> 우리의 가치관은 창의성, 혁신, 그리고 공동체입니다. 우리는 사람들이 자신의 잠재력을 최대한 발휘하고, 
		서로를 지원하며, 성공적인 경험을 할 수 있는 환경을 조성하기 위해 노력합니다.
		</div>
	</div>
</div>
<div class="total2">
	<div>
		<img src="${pageContext.request.contextPath}/resources/images/introduction_3.png"
		style="width: 1200px; height: 500px; padding-top: 120px; object-fit: cover;">
		
		<h1 class="main4_image_text" style="font-size: 50px;">원데이 플러스의 강점과 특징</h1>
		
		<div class="body7_image_text">
			I. 즐거운 경험
			<div style="width: 180px; color: black; position: absolute; top: 122%; left: 48%; transform: translate( -50%, -50% ); font-size: large; font-family: 'MICEGothic Bold';">
				원데이 플러스는 즐겁고 유익한 학습 경험을 제공합니다.
			</div>
		</div>
		
		<div class="body8_image_text">
			II. 창의적인 환경
			<div style="width: 200px; color: black; position: absolute; top: 148%; left: 46.5%; transform: translate( -50%, -50% ); font-size: large; font-family: 'MICEGothic Bold'; padding-top: 30px;">
				우리는 창의적인 학습 환경을 만들기 위해 노력하고 있습니다. 다양한 도구와 자원을 활용하며, 참가자들의 창의성을 극대화하는 강의를 제공합니다.
			</div>
		</div>
		
		<div class="body9_image_text">
			III. 전문 강사진
			<div style="width: 200px; color: black; position: absolute; top: 148%; left: 52%; transform: translate( -50%, -50% ); font-size: large; font-family: 'MICEGothic Bold'; padding-top: 30px;">
				다양한 분야의 전문 강사진을 보유하고 있습니다. 강의에서는 전문자들의 경험과 지식을 나누어 수강생들의 실질적인 학습을 도울 수 있습니다.
			</div>
		</div>
	</div>	
</div>

