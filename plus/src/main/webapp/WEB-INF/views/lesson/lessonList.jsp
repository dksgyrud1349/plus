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

.colortext div {
	border:1px solid #black;
	width:60px;
	height:60px;
	line-height:60px;
	text-align:center;
	border-radius:25px;
	float:left;
	font-weight:bold;
	font-size:23px;
}

/* 5 */
.btn-5 {
  border: none;
  background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
}
.btn-5:hover {
  color: #000;
  background: transparent;
  box-shadow:none;
}
.btn-5:before,
.btn-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:4px;
  width:0;
  background: #47a3da;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:500ms ease all;
}
.btn-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn-5:hover:before,
.btn-5:hover:after{
  width:100%;
  transition:800ms ease all;
}
.custom-btn {
  border-radius: 10px;
  padding: 10px 25px;
  font-weight: bold;
  background: #47a3da;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
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

<div class="container mt-4 pt-3">
	<div class="row justify-content-center">
		<div class="col-8 mt-5" style="width: 180rem;">
			<div class="colortext">
				 <div style="background-color: #ff99cc;">원</div>
				 <div style="background-color: #66ccff;">데</div>
				 <div style="background-color: #99cc00;">이</div>
				 <div style="background-color: #ffcc00;">클</div>
				 <div style="background-color: #FF9966;">래</div>
				 <div style="background-color: #CC33FF;">스</div>
			</div>
			    <div class="row d-flex" style="clear:both;">
					<form action="" name="searchForm" method="post">
						<div class="col-2 p-3" style="float: left; width: 16.66%;">${dataCount}개(${page}/${total_page} 페이지)</div>
						<div class="col-2 p-2 input-group" style="float: right; width: 16.66%;">
							<input type="text" name="kwd" class="form-control" value="${kwd}">
							<button class="btn btn-outline-secondary">
								<span class="fw-semibold text-dark">검색</span>
							</button>
						</div>
						<div class="col-2 p-2" style="float: right; width: 16.66%;">
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
						<div class="col-2 p-2" style="float: right; width: 16.66%;">
							<select name="subNum" class="form-select">
								<option value="0">서브카테고리</option>
								<c:forEach var="vo" items="${listSubCategory}">
									<option value="${vo.subNum}" ${subNum==vo.subNum?"selected":""}>${vo.subName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2 p-2" style="float: right; width: 16.66%;">
							<select name="mainNum" class="form-select">
								<option value="0">메인카테고리</option>
								<c:forEach var="vo" items="${listMainCategory}">
									<option value="${vo.mainNum}" ${mainNum == vo.mainNum ? "selected":""}>${vo.mainName}</option>
								</c:forEach>
							</select>
						</div>
						
					</form>
				</div>
			
			<div class="row mt-5" style="border-top:1px solid #cccccc; clear:both;">
			    <c:forEach var="dto" items="${list}" varStatus="status">
			        <div class="card col-4 p-1 m-3" style="width: 25rem; height: 35rem; border:none; background:#F5F5F5">
			            <div class="zoom">
			                <img src="${pageContext.request.contextPath}/uploads/lesson/${dto.firstPhoto}" class="card-img-top">
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
			            </div>
			
			            <div class="d-grid gap-2 mt-3">
			                <button class="btn btn-primary custom-btn btn-5 product-item" data-productNum="${dto.classNum}">예약하기</button>
			            </div>
			        </div>
			    </c:forEach>
			</div>
			
			<div class="text-center mt-4 page-navigation">${dataCount == 0 ? "등록된 클래스가 존재하지 않습니다." : paging}</div>
		</div>
	</div>
</div>