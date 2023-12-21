<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="categoryStateDetail">
<table>
<tr>
	<td> 카테고리 이름 </td>
	<td>
		<input type="text" name="subName" class="form-control" disabled value="${dto.mainName}">
	</td>
	<td>
		<input type="hidden" name="mainNum" value="${dto.mainNum}">
		<span class="btnSpanIcon btnCategoryUpdate" title="수정"><i class="fa-regular fa-pen-to-square"></i></span>&nbsp; 
		<span class="btnSpanIcon btnCategoryDeleteOk" title="삭제"><i class="fa-solid fa-trash-can"></i></span> 
		<span class="btnSpanIcon btnCategoryUpdateOk" title="수정완료" style="display: none;"><i class="fa-solid fa-check"></i></span>&nbsp;
		<span class="btnSpanIcon btnCategoryUpdateCancel" title="수정취소" style="display: none;"><i class="fa-solid fa-arrow-rotate-left"></i></span>

	</td>
</tr>

<c:forEach var="vo" items="${subList}">
	<tr>
		<td> 서브 카테고리 이름 </td>
		<td> <input type="text" name="subName" class="form-control" disabled value="${vo.subName}"> </td>
		<td>
			<input type="hidden" name="subNum" value="${vo.subNum}">
			<span class="btnSpanIcon btnCategoryUpdate" title="수정"><i class="fa-regular fa-pen-to-square"></i></span>&nbsp;
			<span class="btnSpanIcon btnCategoryDeleteOk" title="삭제"><i class="fa-solid fa-trash-can"></i></span>
			<span class="btnSpanIcon btnCategoryUpdateOk" title="수정완료" style="display: none;"><i class="fa-solid fa-check"></i></span>&nbsp;
			<span class="btnSpanIcon btnCategoryUpdateCancel" title="수정취소" style="display: none;"><i class="fa-solid fa-arrow-rotate-left"></i></span>
		</td>
	</tr>
</c:forEach>
</table>
</div>