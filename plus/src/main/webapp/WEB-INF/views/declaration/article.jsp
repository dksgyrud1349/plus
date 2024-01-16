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
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.body-container {
	width: 1200px;
	height: 70px;
	padding-top: 20px;
	margin-left: 20px;
}

.sContent {
	margin-left: 40px;
	padding-left: 10px;
	margin-top: 20px;
	width: 1200px;
	height: 65px;
	font-family: 'Pretendard-Regular';
	font-weight: bold;
}

.font1 {
	font-family: 'JalnanGothic';
}

.title {
	width: 150px;
	text-align: center;
	font-family: 'GmarketSansMedium';
	background-color: #D5D5D5;
}

.bDelaration {
	width: 100px;
	height: 40px;
	border: 1px solid black;
	font-family: 'GmarketSansMedium';
}

.bDelaration:hover {
	border: 2px solid black;
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

function writeSubmit(){
	const f = document.declarationForm;
	let url = "${pageContext.request.contextPath}/declaration/write";
	let query;
		
	if(!f.className.value.trim()){
		alert("클래스명을 선택하세요.");
		f.classNames.focus();
		return;
	}
		
	if(!f.rContent.value.trim()){
		alert("신고 사유를 작성하세요.");
		f.rContent.focus();
		return;
	}
	
	$("select #className").on("click", function(){
		const $select = $(this).closest("select");
		let className = $select.find("select[name=className]").val().trim();
		url = "${pageContext.request.contextPath}/declaration/write";
		query = "className="+className;
		
		ajaxFun(url, "post", query, "json", fn);
	});
	
	// ajax ===> form
	const fn = function(data){
		// rsltCode / rsltMsg
		if(data.rsltCode === "true"){
			alert(data.rsltMsg);
			let url = "${pageContext.request.contextPath}/declaration/article";
		}else if(data.rsltCode === "false"){
			alert(data.rsltMsg);
			return;
		}
	};

	query = $("form[name=declarationForm]").serialize();
	
	
	ajaxFun(url, "post", query, "json", fn);
		
}
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="margin: 100px auto;">
				<div class="body-main">
					<h3 class="font1"
						style="border-top: 1px solid black; padding-top: 20px; padding-left: 10px;">
						<i class="bi bi-exclamation-diamond-fill"></i> 신고하기
					</h3>
					<div class="sContent">
						이곳은 부적절한 <span style="color: red;">클래스 신고</span>를 하는 곳입니다.<br>
						허위 신고 시 서비스 이용제한 등의 불이익을 받을 수 있으니 주의해 주세요.
					</div>
				</div>
			</div>
		</div>
	</div>
	<form name="declarationForm" method="post">
		<div style="margin-left: 200px; height: 500px;">
			<div class="input-group mb-3" style="width: 400px; float: left; margin-right: 50px; height: 40px;">
				<span class="input-group-text title add" id="basic-addon1" style="padding-left: 50px; padding-top: 8px;">회원ID</span>
				<input type="text" name="userId" id="userId" class="form-control" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly" value="${dto.userId}">
			</div>
			<div class="input-group mb-3" style="width: 400px; height: 40px;">
				<span class="input-group-text title" id="basic-addon2" style="padding-left: 55px; padding-top: 8px;">이름</span> 
				<input type="text" name="userName" id="userName" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2" readonly="readonly" value="${dto.userName}">
			</div>
			<div class="input-group mb-3" style="width: 400px; height: 40px;">
				<span class="input-group-text title" id="basic-addon3" style="padding-left: 40px; padding-top: 8px;">클래스 명</span>
				<!-- <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">  -->
				<select name="className" id="className" style="width: 250px;">
					<option value="" style="text-align: center;">::선택::</option>
					<c:forEach var="dto" items="${listClass}">
						<option value="${dto.className}">${dto.className}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group" style="width: 850px; height: 300px;">
				<span class="input-group-text title" style="padding-left: 40px;">신고 사유</span>
				<textarea class="form-control" name="rContent" id="rContent" style="resize: none;" aria-label="With textarea">${dto.rContent}</textarea>
			</div>
			<div style="margin-top: 35px; float: right; margin-right: 250px;">
				<button type="button" id="btnOk" name="btnOk" class="bDelaration" onclick="writeSubmit();" style="padding-top: 3px;">신고하기<i class="bi bi-bell-fill"></i></button>
			</div>
		</div>
	</form>
</main>