<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.bookingTotal {
	width: 1200px;
	height: 800px;
}

.bookingSubject {
	margin-top: 110px;
	width: 200px;
	height: 70px;
	color: black;
	font-size: 30px;
	font-weight: bold;
	text-align: left;
}

.bookingSearch {
	width: 1200px;
	height: 110px;
	border-top: 1px solid #8C8C8C;
	border-bottom: 1px solid #8C8C8C;
}

.selectDesign {
	width: 130px;
	height: 40px;
	margin-top: 35px;
	margin-left: 350px;
	float: left;
	border: 1px solid #A6A6A6;
}

.dateDesgin {
	width: 130px;
	height: 40px;
	margin-top: 35px;
	float: left;
	margin-left: 10px;
	border: 1px solid #A6A6A6;
}

.btnSearch {
	border: 1px solid #A6A6A6;
	height: 40px;
	margin-top: 35px;
	margin-left: 5px;
	font-weight: bold;
	color: #353535;
}

.btnSearch:hover {
	border: 2px solid black;
}

.tableTotal {
	width: 1200px;
	height: auto;
	margin-top: 55px;
	border-top: 1px solid black;
}

.bookingDetailList {
	cursor: pointer;
}

.bookingDetailList:hover {
	font-weight: bold;
}

.modal-backdrop {
	background-color: transparent;
	zindex: 9999;
	width: 0px;
	height: 0px;
}

.modal-content {
	position: absolute;
	top: 200px;
}

.review-form textarea {
	width: 100%;
	height: 75px;
	resize: none;
}

.review-form .star {
	font-size: 0;
	letter-spacing: -4px;
}

.review-form .star a {
	font-size: 22px;
	letter-spacing: 1px;
	display: inline-block;
	color: #ccc;
	text-decoration: none;
}

.review-form .star a:first-child {
	margin-left: 0;
}

.star a.on {
	color: #FFBB00;
}

.review-form .img-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>
<form>
	<div class="bookingTotal">
		<div class="bookingSubject">
			<div>
				<i class="bi bi-basket"></i> 예약내역
			</div>
		</div>

		<div class="bookingSearch">
			<select id="changeDate" class="form-select selectDesign"
				onchange="changeList();">
				<option value="all">전체</option>
				<option value="oneWeek">1주일</option>
				<option value="onetMonth">1개월</option>
				<option value="ThreeMonth">3개월</option>
				<option value="sixMonth">6개월</option>
				<option value="oneYear">1년</option>
				<option value="etc">직접입력</option>
			</select> <input type="date" name="startDate" id="startDate"
				class="form-control dateDesgin" value="startDate" placeholder="시작일자">
			<a
				style="font-size: 15px; float: left; margin-top: 45px; margin-left: 10px;">~</a>
			<input type="date" name="endDate" id="endDate"
				class="form-control dateDesgin" value="endDate" placeholder="마지막일자">
			<button type="button" class="btn btnSearch">
				검색 <i class="bi bi-search"></i>
			</button>
		</div>
		<table class="table tableTotal">
			<thead>
				<tr>
					<th scope="col"
						style="background-color: #FFF3CD; padding-left: 20px;">번호</th>
					<th scope="col" style="background-color: #FFF3CD;">클래스</th>
					<th scope="col" style="background-color: #FFF3CD;">강사</th>
					<th scope="col" style="background-color: #FFF3CD;">주소</th>
					<th scope="col" style="background-color: #FFF3CD;">예약상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${rtnList}" varStatus="status">
					<tr class="bookingDetailList" data-orderNum="${dto.orderNum}"
						data-classNum="${dto.classNum}">
						<th style="padding-left: 30px;">${dto.rnum}</th>
						<td>${dto.className}</td>
						<td>${dto.puserName}</td>
						<td>${dto.addr1},${dto.addr2}</td>
						<td style="padding-left: 10px;">${dto.mode}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</form>
<div class="modal" id="orderDetailModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세 주문 정보</h5>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">

				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>

			</div>
			<div class="modal-backdrop"></div>
		</div>
	</div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5 text-center" id="exampleModalLabel">리뷰</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="review-form p-3 mt-2 ">
					<form name="reviewForm">
						<div class="p-1">
							<p class="star">
								<a href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
									href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
									href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
									href="#" class="on"><i class="bi bi-star-fill"></i></a> <a
									href="#" class="on"><i class="bi bi-star-fill"></i></a> <input
									type="hidden" name="reviewScore" value="5"> <input
									type="hidden" name="classNum">
							</p>
						</div>

						<div class="p-1">
							<input type="text" name="reviewSubject" class="form-control"
								placeholder="제목을 입력해주세요.">
						</div>

						<div class="p-1">
							<textarea name="reviewContent" class="form-control"></textarea>
						</div>
						<div class="p-1">
							<div class="img-grid">
								<img class="item img-add"
									src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</div>
							<input type="file" name="selectFile" accept="image/*" multiple
								class="form-control" style="display: none;">
						</div>
						<div class="p-1 text-end">
							<input type="hidden" name="orderNum">
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btnReviewSend">등록하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 환불 모달 -->
<div class="modal fade" id="refundModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form name="refundForm" method="post" action="${pageContext.request.contextPath}/refund/refund">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 text-center" id="exampleModalLabel">
						<i class="bi bi-currency-dollar"></i> 환불
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="review-form p-3 mt-2 ">
						<div class="p-1">
							<select name="bankName" class="form-select">
								<option value="">::은행선택::</option>
								<option value="KB국민은행" ${bankName=="KB국민은행"?"selected":""}>KB국민은행</option>
								<option value="IBK기업은행" ${bankName=="IBK기업은행"?"selected":""}>IBK기업은행</option>
								<option value="BS부산은행" ${bankName=="BS부산은행"?"selected":""}>BS부산은행</option>
								<option value="우리은행" ${bankName=="우리은행"?"selected":""}>우리은행</option>
								<option value="우리은행" ${bankName=="우리은행"?"selected":""}>우리은행</option>
								<option value="새마을금고" ${bankName=="새마을금고"?"selected":""}>새마을금고</option>
								<option value="전북은행" ${bankName=="전북은행"?"selected":""}>전북은행</option>
								<option value="신한은행" ${bankName=="신한은행"?"selected":""}>신한은행</option>
								<option value="NH농협" ${bankName=="NH농협"?"selected":""}>NH농협</option>
								<option value="수협은행" ${bankName=="수협은행"?"selected":""}>수협은행</option>
								<option value="대구은행" ${bankName=="대구은행"?"selected":""}>대구은행</option>
								<option value="하나은행" ${bankName=="하나은행"?"selected":""}>하나은행</option>
								<option value="kdb산업은행" ${bankName=="kdb산업은행"?"selected":""}>kdb산업은행</option>
								<option value="신협" ${bankName=="신협"?"selected":""}>신협</option>
								<option value="광주은행" ${bankName=="광주은행"?"selected":""}>광주은행</option>
								<option value="SC제일은행" ${bankName=="SC제일은행"?"selected":""}>SC제일은행</option>
								<option value="citibank" ${bankName=="citibank"?"selected":""}>citibank</option>
								<option value="경남은행" ${bankName=="경남은행"?"selected":""}>경남은행</option>
							</select>
						</div>
						<div class="p-1">
							<input type="text" name="account" class="form-control"
								placeholder="반환계좌를 입력해주세요.('-'은 생략해주세요.)">
						</div>
						<div class="p-1 text-end">
							<input type="hidden" name="oNum"> <input type="hidden"
								name="pay">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="refundSend();">환불하기</button>
				</div>
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType: dataType,
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
	$(".bookingDetailList").click(function(){
		let orderNum = $(this).attr("data-orderNum");
		$('form[name=reviewForm]').find("input[name=orderNum]").val(orderNum);
		let classNum = $(this).attr("data-classNum");
		$('form[name=reviewForm]').find("input[name=classNum]").val(classNum);
		
		let url = '${pageContext.request.contextPath}/myPage/booking/detail';
		let query = 'orderNum='+orderNum;
		
		const fn = function(data){
			//$('.modal-backdrop').last().css("z-index", "9999");
			//$(".modal-backdrop").remove();
			var userName = data.userName;
			var cDate = data.cDate;
			var count = data.count;
			var className = data.className;
			var pay = data.pay;
			var tel = data.tel;
			var email = data.email;
			var state = data.state;
			var orderNum = data.orderNum;
			
			var classDate = new Date(cDate);
			
			var currentDate = new Date();
			var previousDate = new Date(currentDate);
			previousDate.setDate(previousDate.getDate() - 1);
			
			var inputDateObj = Date.parse(classDate);
			var previousDateObj = Date.parse(previousDate);
			
			let htmlText;
			
			htmlText = '<div class="modal-body">';
			htmlText += '	<div>회원 이름: '+userName+'</div>';
			htmlText += '	<div>수강 날짜: '+cDate+'</div>';
			htmlText += '	<div>수강 인원수: '+count+'명</div>';
			htmlText += '	<div>클래스 명: '+className+'</div>';
			htmlText += '	<div>결제 금액: '+pay+'</div>';
			htmlText += '	<div>전화번호: '+tel+'</div>';
			htmlText += '	<div>이메일: '+email+'</div>';
			htmlText += '</div>';
			
			// 조건부로 버튼 추가
			if (state === 1) {
			    htmlText += '    <button type="button" class="btn btn-dark reviewbtn" style="float:right;" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰쓰기</button>';
			}
			
			if(inputDateObj > previousDateObj && state === 0){
				htmlText += '	<button type="button" class="btn btn-dark refundBtn" style="float:left;" data-bs-toggle="modal" data-bs-target="#refundModal">환불하기</button>';
			}
			
			$("input[name=oNum]").val(orderNum);
			$("input[name=pay]").val(pay);
			$("#orderDetailModal .modal-body").html(htmlText);
			$("#orderDetailModal").modal("show");
			
		};
		
		ajaxFun(url, 'get', query, 'json', fn);
		
	});
});
$(function(){
		$(".btn").on("click", function(){
			$("#orderDetailModal").modal('hide');
		});
});

<%-- 리뷰 --%>
const exampleModal = document.getElementById('exampleModal');
if (exampleModal) {
  exampleModal.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget;
    const recipient = button.getAttribute('data-bs-whatever');

    const modalTitle = exampleModal.querySelector('.modal-title');
    const modalBodyInput = exampleModal.querySelector('.modal-body input');

    modalTitle.textContent = `리뷰를 작성해주세요! ${recipient}`;
    modalBodyInput.value = recipient;
  });
}

function refundSend(){
	const f = document.refundForm;
	
	if (!f.bankName.value.trim()) {
		alert("은행명을 입력해주세요.");
	    return;
	}
	
	if (!f.account.value.trim()) {
		alert("반환계좌를 입력해주세요.");
	    return;
	}
	
	if(!confirm("환불을 진행하시겠습니까?")){
		return;
	}
	
	f.submit();
}

$(function() {
	  var sel_files = [];

	  $("body").on("click", ".review-form .img-add", function() {
	    $(this).closest(".review-form").find("input[name=selectFile]").trigger("click");
	  });

	  $("form[name=reviewForm] input[name=selectFile]").change(function(e) {
	    if (!this.files) {
	      let dt = new DataTransfer();
	      for (let f of sel_files) {
	        dt.items.add(f);
	      }

	      this.files = dt.files;

	      return false;
	    }

	    let $form = $(this).closest("form");

	    // 유사 배열을 배열로 변환
	    const fileArr = Array.from(this.files);

	    fileArr.forEach((file, index) => {
	      sel_files.push(file);

	      const reader = new FileReader();
	      const $img = $("<img>", { "class": "item img-item" });
	      $img.attr("data-filename", file.name);
	      reader.onload = e => {
	        $img.attr("src", e.target.result);
	      };
	      reader.readAsDataURL(file);
	      $form.find(".img-grid").append($img);
	    });

	    let dt = new DataTransfer();
	    for (let f of sel_files) {
	      dt.items.add(f);
	    }

	    this.files = dt.files;
	  });

	  // 별
	  $(".review-form .star a").click(function(e) {
	    let b = $(this).hasClass("on");
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");

	    if (b) {
	      $(this).removeClass("on");
	    }

	    let s = $(this).closest(".review-form").find(".star .on").length;
	    $(this).closest(".review-form").find("input[name=reviewScore]").val(s);

	    // e.preventDefault(); // 화면 위로 이동 안되게
	    return false;
	  });

	  // 리뷰 등록 완료
	  $(".btnReviewSend").click(function() {
		  const f = document.reviewForm;
		  let s;

		  if (f.reviewScore.value === "0") {
		    alert("평점은 1점부터 가능합니다.");
		    return false;
		  }
		  
		  s = f.reviewSubject.value;
		  if (typeof s === 'undefined' || s.trim() === "") {
		    alert("제목을 입력하세요.");
		    f.reviewSubject.focus();
		    return false;
		  }

		  s = f.reviewContent.value;
		  if (typeof s === 'undefined' || s.trim() === "") {
		    alert("리뷰를 입력하세요.");
		    f.reviewContent.focus();
		    return false;
		  }

		  if (f.selectFile.files.length > 1) {
		    alert("이미지는 최대 1개까지 가능합니다.");
		    return false;
		  }

		  let url = "${pageContext.request.contextPath}/review/write";
		  // FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공
		  // FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
		  let query = new FormData(f); // jQuery 객체에서 원본 DOM 객체로 접근
		  const fn = function(data) {
		  	if (data.state === "true") {
			    $("#exampleModal").modal('hide');
			}
		  };
		 ajaxFun(url, "post", query, "json", fn, true);
		});
	});
</script>