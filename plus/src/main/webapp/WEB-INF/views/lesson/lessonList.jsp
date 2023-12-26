<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
textarea:focus, input:focus {
	outline: none;
}

.zoom{
  	margin: 0px auto;
  	overflow: hidden;
  	border-radius: 20px 20px 0 0;
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
$(function() {
    $(".product-item").click(function() {
      let classNum = $(this).attr("data-productNum");
      let url = "${pageContext.request.contextPath}/lesson/detail/" + classNum;
      location.href = url;
    });
  });

$(function(){
	  $('.btnSendLessonLike').click(function(){
		  const $i = $(this).find('i');
		  let userLiked = $i.hasClass('bi-heart-fill');
		  let msg = userLiked ? '게시글 좋아요를 취소하시겠습니까?' : '게시글에 좋아요를 누르시겠습니까?';
			
		  if(! confirm( msg )) {
			  return false;
		  }
		  
		  let url = '${pageContext.request.contextPath}/lesson/insertLessonLike';
		  let classNum = $(this).attr("data-classNum");
		  let query = 'classNum=' + classNum + '&userLiked=' + userLiked;
		  
		  const fn = function(data){
			  let state = data.state;
			  if(state === 'true'){
				  if(userLiked){
					  $i.removeClass('bi-heart-fill').addClass('bi-heart');
				  } else{
					  $i.removeClass('bi-heart').addClass('bi-heart-fill');
				  }
				  let count = data.lessonLikeCount;
				  $('.'+classNum).text(count);
			  } else if(state === "liked"){
				  alert('게시글 좋아요는 한 번만 가능합니다.');
			  } else if(state === "false"){
				  alert('게시물 좋아요 여부 처리가 실패하였습니다.');
			  }
		  };
		  ajaxFun(url, 'post', query, 'json', fn);
	  });
});
</script>

<div class="container mt-5 pt-3">
	<div class="row justify-content-center">
		<div class="col-8 mt-5" style="width: 180rem;">
			<h5 class="pb-2 fw-bold fs-2">모든 원데이 클래스</h5>
			    <div class="row d-flex mt-5">
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
			<div class="row mt-5" style="border-top:1px solid #cccccc; clear:both;">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="card col-4 p-1 m-3" style="width: 25rem; height: 35rem; border:none; background:#F5F5F5">
						<div class="zoom">
							<img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" class="card-img-top">
							    <div class="badge bg-dark text-white position-absolute" style="top: 1.0rem; left: 1.0rem; font-size:16px;">
							    	<i class="bi bi-star"></i> 5.0 (리뷰 개수)
							    </div>
						</div>
						<div class="card-body" style="height: 15px;">
							<p class="card-text">
								<i class="bi bi-person"></i> ${dto.nickName}
								<button type="button" class="btn btnSendLessonLike" title="좋아요" data-classNum="${dto.classNum}" style="float:right;">
									<i class="pt-1 bi ${dto.userLessonLiked ? 'bi-heart-fill' : 'bi-heart'}"></i>
									<span id="lessonLikeCount" class="${dto.classNum}">${dto.lessonLikeCount}</span>
								</button>
							</p>
							<h5 class="card-title pb-1">${dto.className}</h5>
							<p class="card-text">
								<i class="bi bi-geo-alt-fill"></i> ${dto.addr1}
							</p>
							<p class="card-text">
								<i class="bi bi-calendar-check"></i> ${dto.startDate} ~ ${dto.endDate}
							</p>
							
							<span class="card-text text-danger text-start mt-5 fs-5"> <fmt:formatNumber value="${dto.price}" pattern="#,###원" /></span>
							
							<div class="d-grid gap-2 mt-3">
								<button class="btn btn-primary product-item" data-productNum="${dto.classNum}">예약하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="text-center mt-4 page-navigation">${dataCount == 0 ? "등록된 클래스가 존재하지 않습니다." : paging}</div>
		</div>
	</div>
</div>