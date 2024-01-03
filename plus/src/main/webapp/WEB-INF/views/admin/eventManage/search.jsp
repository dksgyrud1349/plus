<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>
<form name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/search">
	<div class="input-group mb-1">
		<select name="schType" class="form-select">
			<option value="classNum" ${schType=="classNum"?"selected":""}>클래스번호</option>
			<option value="className" ${schType=="className"?"selected":""}>클래스명</option>
			<option value="userId" ${schType=="userId"?"selected":""}>아이디</option>
			<option value="nickName" ${schType=="nickName"?"selected":""}>닉네임</option>
		</select>
		<input type="text" name="kwd" value="${kwd}" class="form-control">
		<button type="button" class="btn btn-success" onclick="searchList()">검색</button>
	</div>
</form>


<div>
	<table class="table table-border table-list">
		<thead>
			<tr>
				<th>선택</th>
				<th width="60">클래스번호</th>
				<th>클래스명</th>
				<th width="90">닉네임</th>
				<th width="110">아이디</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${classList}" varStatus="status">
				<tr>
					<td><input type="checkbox" id="check-class"></td>
					<td width="60">${dto.classNum}</td>
					<td>${dto.className}</td>
					<td width="90">${dto.nickName}</td>
					<td width="110">${dto.userId}</td>
				</tr>
			</c:forEach>
			<tr>
				<td>
					<span class="btn btn-dark btn-sm" onclick="sendOk();">확인</span>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="page-navigation dataCount mb-3">
	${dataCount == 0 ? "등록된 클래스가 없습니다." : paging}
</div>