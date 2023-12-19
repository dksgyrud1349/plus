<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>spring</title>

<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style type="text/css">
*{ padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body { font-size: 14px; font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif; }

textarea:focus, input:focus { outline: none; }

</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
function memberOk() {
	const f = document.questionForm;
	
	f.action = "${pageContext.request.contextPath}/pluszone/question/questionOk";
    f.submit();
</script>

</head>
<body>

<header>
</header>
	
<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
		<div class="row justify-content-center">
			<div class="col-8">
				<h5 class="pb-2 fw-bold fs-2 pb-5">
					<i class="bi bi-book"></i> 플러스 질문지
				</h5>
				<form class="questionForm">
					<div>
						<div class="row border bg-body-secondary">
							<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> 어떤 목적의 원데이 클래스를 추천 받으시겠습니까?</span></div>
						</div>
						<div class="form-check form-check-inline mt-3">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  	<label class="form-check-label" for="flexCheckDefault">취미</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">새로운 경험</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">데이트</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">선물</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">스트레스 해소</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">운동 / 건강</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">뷰티</label>
						</div>
						<div class="form-check form-check-inline mb-5">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">학업</label>
						</div>
					</div>
					
					<div>
						<div class="row border bg-body-secondary">
							<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> 어떤 카테고리의 원데이 클래스를 추천 받으시겠습니까?</span></div>
						</div>
						<div class="form-check form-check-inline mt-3">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">핸드메이드</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">드로잉</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">음악</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">쿠킹</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">공예</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">미용</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">스포츠</label>
						</div>
						<div class="form-check form-check-inline mb-5">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">상관없음</label>
						</div>
					</div>
					
					<div>
						<div class="row border bg-body-secondary">
							<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> 어느 지역의 원데이 클래스를 추천 받으시겠습니까?</span></div>
						</div>
						<div class="form-check form-check-inline mt-3">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">서울</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">경기도</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">인천</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">강원도</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">충청도</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">경상도</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">전라도</label>
						</div>
						<div class="form-check form-check-inline mb-5">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">제주도</label>
						</div>
					</div>
					
					<div>
						<div class="row border bg-body-secondary">
							<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> 어느 가격대의 원데이 클래스를 추천 받으시겠습니까?</span></div>
						</div>
						<div class="form-check form-check-inline mt-3">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">상관없음</label>
						</div>
						<div class="form-check form-check-inline ">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">1만원 ~ 5만원</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">5만원 ~ 10만원</label>
						</div>
						<div class="form-check form-check-inline mb-5">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">10만원 이상</label>
						</div>
					</div>
					
					<div>
						<div class="row border bg-body-secondary">
							<div class="col-12 p-2"><span class="fw-semibold text-black fs-5"><i class="bi bi-lightbulb"></i> 어느 나이대의 원데이 클래스를 추천 받으시겠습니까?</span></div>
						</div>
						<div class="form-check form-check-inline mt-3">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">상관없음</label>
						</div>
						<div class="form-check form-check-inline ">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">10대 / 20대</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">30대 / 40대</label>
						</div>
						<div class="form-check form-check-inline mb-5">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
						  	<label class="form-check-label" for="flexCheckChecked">50대 이상</label>
						</div>
					</div>
					
					<div class="col-12 mx-2 text-end">
						<button class="btn btn-outline-success"><span class="fw-semibold text-dark" onclick="questionOk();">등록하기 <i class="bi bi-check-lg"></i></span></button>
						<button class="btn btn-outline-danger"><span class="fw-semibold text-dark" onclick="location.href='${pageContext.request.contextPath}/';">취소하기 <i class="bi bi-x-lg"></i></span></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
</main>

<footer>
</footer>

</body>
</html>