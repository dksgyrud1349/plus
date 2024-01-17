<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="category-list my-2" style="border:3px solid #fff;">
	<table style="margin:10px auto;">
	<tr>
		<td class="border-bottom"> 카테고리 이름 </td>
		
		<td>
			<input type="text" name="mainName" class="form-control" disabled value="${dto.mainName}">
		</td>
	</tr>
	
	<c:forEach var="vo" items="${subList}">
		<tr>
			<td class="border-bottom"> 서브 카테고리 이름&nbsp;&nbsp;&nbsp; </td>
			<td> <input type="text" name="subName" class="form-control" disabled value="${vo.subName}"> </td>
			<td>
				<button type="button" class="btnSpanIcon btnCategoryDeleteOk" onclick="deleteSubOk('${vo.subNum}');"><i class="fa-solid fa-trash-can"></i></button>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
<form id="subCategoryForm" name="subCategoryForm" method="post">
	<h6 style="padding-top: 20px;"><i class="fa-solid fa-angles-right"></i> 서브 카테고리 추가 <i class="fa-solid fa-angles-left"></i></h6>
	
	<table class="table td-border mx-auto mt-2">
		<tr>
			<td class="pe-7 text-center bg-light" style="vertical-align:middle;">이름</td>
			<td class="ps-5 input-group">
				<input type="text" name="subName" class="form-control" style="width: 80%;">
				<button type="button" class="btn btn-outline-dark btn-sm" onclick="addsubCategory();">+</button>
				<input type="hidden" name="mainNum" value="${dto.mainNum}">
			</td>
		</tr>
	</table>
	
</form>
<script>
function deleteSubOk(subNum) {
	var url = "${pageContext.request.contextPath}/admin/categoryManage/deleteSubCategory";
	var query = "subNum="+subNum;
	
	if(! confirm("서브 카테고리를 삭제하시겠습니까 ?")) {
		  return;
	}
	
	const fn = function(data){
		$('#category-dialog').dialog("close");
		location.href = "${pageContext.request.contextPath}/admin/categoryManage/list";
	};
	ajaxFun(url, "post", query, "json", fn);
}

function addsubCategory() {
	const f = document.subCategoryForm;
	
	if(! f.subName.value) {
		alert('서브카테고리를 입력해주세요.');
		f.subName.focus();
		return;
	}
	
	f.action="${pageContext.request.contextPath}/admin/categoryManage/addSubCategory";
    f.submit();
}

</script>