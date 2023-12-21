<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h3 style="font-size: 15px; padding-top: 10px; float:left;"><i class="fa-solid fa-angles-right"></i> 회원 정보</h3>

<table class="table td-border mx-auto my-10" style="width: 99%; text-align:left;">
	<tr>
		<td width="15%" class="text-center bg-light">회원번호</td>
		<td width="35%" class="ps-5">${dto.memberIdx}</td>
		<td width="15%" class="text-center bg-light">아이디</td>
		<td width="35%" class="ps-5">${dto.userId}(${dto.membership==1?"일반회원":(dto.membership==31?"강사":"기타")})</td>
	</tr>
	<tr>
		<td class="text-center bg-light">이 름</td>
		<td class="ps-5">${dto.userName}</td>
		<td class="text-center bg-light">생년월일</td>
		<td class="ps-5">${dto.birth}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">전화번호</td>
		<td class="ps-5">${dto.tel}</td>
		<td class="text-center bg-light">이메일</td>
		<td class="ps-5">${dto.email}</td>
	</tr>
	<tr>
		<td class="text-center bg-light">회원가입일</td>
		<td class="ps-5">${dto.regDate}</td>
		<td class="text-center bg-light">최근로그인</td>
		<td class="ps-5">${dto.lastLogin}</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light">총 구매액</td>
		<td class="ps-5">미완성</td>
		<td class="text-center bg-light">적립 총 금액</td>
		<td class="ps-5">미완성</td>
	</tr>
	
	<tr>
		<td class="text-center bg-light" style="vertical-align:middle">계정상태</td>
		<td colspan="3" class="ps-5">
			${dto.enabled==1?"활성":"잠금"}
			<c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
			&nbsp;<span class="btn btn-outline-secondary" onclick="memberStateDetaileView();" style="cursor: pointer; margin-left:10px;">자세히</span>
		</td>
	</tr>
</table>

<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
	<h3 style="font-size: 20px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 유저 상태 변경 <i class="fa-solid fa-angles-left"></i></h3>
	
	<table class="table td-border mx-auto my-5">
		<tr>
			<td width="15%" class="text-center bg-light" style="vertical-align:middle">계정상태</td>
			<td class="ps-5">
				<select class="form-select" name="stateCode" id="stateCode" onchange="selectStateChange()">
					<option value="">::상태코드::</option>
					<c:if test="${dto.enabled==0}">
						<option value="0">잠금 해제</option>
					</c:if>
					<option value="2">불법적인 방법으로 로그인</option>
					<option value="3">불건전 게시물 등록</option>
					<option value="4">다른 유저 비방</option>
					<option value="5">타계정 도용</option>
					<option value="6">기타 약관 위반</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="pe-7 text-center bg-light" style="vertical-align:middle">메 모</td>
			<td class="ps-5">
				<input type="text" name="memo" id="memo" class="form-control" style="width: 95%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
	<input type="hidden" name="userId" value="${dto.userId}">
	<input type="hidden" name="adminId" value="${sessionScope.member.userId}">
</form>

<div id="memberStateDetaile" style="display: none; z-index:10001;">
	<table class="table table-border mx-auto my-10">
		<thead>
			<tr class="bg-light border-top2">
				<th>내용</th>
				<th width="130">담당자</th>
				<th width="200">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="vo" items="${listState}">
				<tr>
					<td class="ps-5">${vo.memo} (${vo.stateCode})</td>
					<td class="text-center">${vo.adminId}</td>
					<td class="text-center">${vo.stateDate}</td>
				</tr>
			</c:forEach>
	  
			<c:if test="${listState.size()==0}">
				<tr align="center" style="border: none;">
					<td colspan="3">등록된 정보가 없습니다.</td>
				</tr>  
			</c:if>
		</tbody>
	</table>  
</div>
