<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

*, *::after, *::before {
	box-sizing: border-box;
}

body {
	font-size: 14px;
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}

textarea:focus, input:focus {
	outline: none;
}

.zoom{
  	margin: 0px auto;
  	overflow: hidden;
}

.zoom img {
	transition: all 0.2s linear;
}

.zoom:hover img {
	transform: scale(1.2);
}

</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

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
	$("form select[name=mainNum]").change(function(){
		let mainNum = $(this).val();
		
		$("form select[name=subNum]").find('option').remove().end()
			.append("<option value=''>서브 카테고리</option>");	
		
		if(! mainNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/lesson/listSubCategory";
		let query = "mainNum="+mainNum;
		
		const fn = function(data) {
			$.each(data.listSubCategory, function(index, item){
				let subNum = item.subNum;
				let subName = item.subName;
				let s = "<option value='"+subNum+"'>"+subName+"</option>";
				$("form select[name=subNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});
</script>

<div class="container mt-5 pt-3 ms-5">
	<div class="row justify-content-center">
		<div class="col-8" style="width: 180rem;">
			<h5 class="pb-2 fw-bold fs-2">모든 원데이 클래스</h5>
			<div class="row d-flex">
				<form action="" name="searchForm" method="post">
					<div class="col-2 p-3" style="float: left; width: 16.66%;">${dataCount}개(${page}/${total_page} 페이지)</div>
					<div class="col-2 p-2" style="float: left; width: 16.66%;">
						<select name="mainNum" class="form-select">
							<option value="0">메인카테고리</option>
							<c:forEach var="vo" items="${listMainCategory}">
								<option value="${vo.mainNum}" ${mainNum == vo.mainNum ? "selected":""}>${vo.mainName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-2 p-2" style="float: left; width: 16.66%;">
						<select name="subNum" class="form-select">
							<option value="0">서브카테고리</option>
							<c:forEach var="vo" items="${listSubCategory}">
								<option value="${vo.subNum}" ${subNum==vo.subNum?"selected":""}>${vo.subName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-2 p-2" style="float: left; width: 16.66%;">
						<select name="schType" class="form-select">
							<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
							<option value="nickName" ${schType=="nickName"?"selected":""}>플러스</option>
							<option value="regDate" ${schType=="regDate"?"selected":""}>등록일자순</option>
							<option value="className" ${schType=="className"?"selected":""}>클래스명</option>
							<option value="content" ${schType=="content"?"selected":""}>내용</option>
							<option value="highPrice" ${schType=="highPrice"?"selected":""}>높은가격순</option>
							<option value="lowPrice" ${schType=="lowPrice"?"selected":""}>낮은가격순</option>
						</select>
					</div>
					<div class="col-2 p-2" style="float: left; width: 16.66%;">
						<input type="text" name="kwd" class="form-control" value="${kwd}">
					</div>
					<div class="col-2 pt-2 text-center" style="float: left; width: 16.66%;">
						<button class="btn btn-outline-secondary">
							<span class="fw-semibold text-dark">검색</span>
						</button>
					</div>
				</form>
			</div>
			<div class="row">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="card col-4 p-1" style="width: 25rem; height: 43rem;">
						<div class="zoom">
							<img
								src="https://platum.kr/wp-content/uploads/2020/04/75293002_2452405441699191_8537183120770727936_o.jpg"
								class="card-img-top" alt="...">
						</div>
						<div class="card-body">
							<p class="card-text">
								<i class="bi bi-person"></i> ${dto.nickName}
							</p>
							<h5 class="card-title fs-5 pb-1">${dto.className}</h5>
							<p class="card-text">
								<i class="bi bi-geo-alt-fill"></i> ${dto.addr1}
							</p>
							<p class="card-text">
								<i class="bi bi-star"></i> 5.0 (리뷰 개수)
							</p>
							<p class="card-text text-danger fs-3"> <fmt:formatNumber value="${dto.price}" pattern="#,###" /></p>
							<p class="text-end">
								<a href="${pageContext.request.contextPath}/lesson/lessonDetail?classNum=${dto.classNum}" class="btn btn-primary">예약하기</a>

								<button class="btn">
									<i class="bi bi-heart pt-1"></i>
								</button>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="text-center mt-4 page-navigation">${dataCount == 0 ? "등록된 클래스가 존재하지 않습니다." : paging}</div>
		</div>
	</div>
</div>