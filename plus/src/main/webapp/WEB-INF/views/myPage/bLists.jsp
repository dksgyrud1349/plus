<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.bookingTotal{
	width: 1200px;
	height: 800px;
}
.bookingSubject{
	margin-top: 110px;
	width: 200px;
	height: 70px;
	color: black;
	font-size: 30px;
	font-weight: bold;
	text-align: left;
	
}
.bookingSearch{
	width: 1200px;
	height: 110px;
	border-top: 1px solid #8C8C8C;
	border-bottom: 1px solid #8C8C8C;
	
}
.selectDesign{
	width: 130px;
	height: 40px;
	margin-top: 35px;
	margin-left: 350px;
	float: left;
	border: 1px solid #A6A6A6;
}
.dateDesgin{
	width: 130px;
	height: 40px;
	margin-top: 35px;
	float: left;
	margin-left: 10px;
	border: 1px solid #A6A6A6;
}
.btnSearch{
	border: 1px solid #A6A6A6;
	height: 40px;
	margin-top: 35px;
	margin-left: 5px;
	font-weight: bold;
	color: #353535;
}
.btnSearch:hover{
	border: 2px solid black;
}
.tableTotal{
	width: 1200px;
	height: auto;
	margin-top: 55px;
	border-top: 1px solid black;
}
.bookingDetailList{
	cursor: pointer;
}
.bookingDetailList:hover{
	font-weight: bold;
}
.modal-backdrop{
	background-color: transparent;
	zindex: 9999;
	width: 0px;
	height: 0px;
}
.modal-content{
	position: absolute;
	top: 200px;
}
</style>
<form>
<div class="bookingTotal">
	<div class="bookingSubject">
		<div><i class="bi bi-basket"></i> 예약내역</div>
	</div>
	
	<div class="bookingSearch">
		<select id="changeDate" class="form-select selectDesign" onchange="changeList();">
			<option value="all">전체</option>
			<option value="oneWeek">1주일</option>
			<option value="onetMonth">1개월</option>
			<option value="ThreeMonth">3개월</option>
			<option value="sixMonth">6개월</option>
			<option value="oneYear">1년</option>
			<option value="etc">직접입력</option>
		</select>
		<input type="date" name="startDate" id="startDate" class="form-control dateDesgin" value="startDate" placeholder="시작일자">
		<a style="font-size: 15px; float: left; margin-top: 45px; margin-left: 10px;">~</a>
		<input type="date" name="endDate" id="endDate" class="form-control dateDesgin" value="endDate" placeholder="마지막일자">
		<button type="button" class="btn btnSearch">검색 <i class="bi bi-search"></i></button>
	</div>
	<table class="table tableTotal">
	  <thead>
	    <tr>
	      <th scope="col" style="background-color: #FFF3CD; padding-left: 20px;">번호</th>
	      <th scope="col" style="background-color: #FFF3CD;">클래스</th>
	      <th scope="col" style="background-color: #FFF3CD;">강사</th>
	      <th scope="col" style="background-color: #FFF3CD;">주소</th>
	      <th scope="col" style="background-color: #FFF3CD;">예약상태</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="dto" items="${rtnList}" varStatus="status">
			<tr class="bookingDetailList">
				<th style="padding-left: 30px;">${dto.rnum}</th>
				<td>${dto.className}</td>
				<td>${dto.puserName}</td>
				<td>${dto.addr1}, ${dto.addr2}</td>
				<td style="padding-left: 10px;">${dto.mode}</td>
				<input type="hidden" name="orderNum" id="orderNum" value="${dto.orderNum}">
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
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
      <div class="modal-backdrop"></div>
    </div>
  </div>
</div>

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
	$.ajax(url, settings);
}

$(function(){
	$(".bookingDetailList").click(function(){
		let orderNum = $(this).children("input").val();
		
		let url = '${pageContext.request.contextPath}/bookingList/detail';
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

</script>