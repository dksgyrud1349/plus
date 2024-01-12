<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}


.table-article img { max-width: 650px; }
.file-item { padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777; }
</style>

<script type="text/javascript">
	function deleteOk() {
		let query = 'num=${dto.num}&${query}';
		let url = '${pageContext.request.contextPath}/admin/termsManage/delete?' + query;
	
		if(confirm('위 자료를 삭제 하시 겠습니까 ? ')) {
			location.href = url;
		}
	}
</script>
<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
		    		<i class="fas fa-clipboard-list"></i> 이용약관 관리
		    	</h3>
		    			
				<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				    <table class="table">
						<tr>
							<td align="left" width="50%">
								&nbsp;
							</td>
							<td align="right">
								&nbsp;
							</td>
						</tr>
					</table>
				
					<div class="card mb-5 w-80 " style="margin:0 auto">
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
							<table class="table">
								<thead>
									<tr>
										<td colspan="2" align="center">
											${dto.subject}
										</td>
									</tr>
								</thead>
								
								<tbody>									
									<tr style="border-bottom:none;">
										<td colspan="2" valign="top" height="200">
											${dto.content}
										</td>
									</tr>
																		
									<tr>
										<td colspan="2">
											이전글 :
											<c:if test="${not empty prevDto}">
												<a href="${pageContext.request.contextPath}/admin/termsManage/article?${query}&num=${prevDto.num}">${prevDto.subject}</a>
											</c:if>
										</td>
									</tr>
									
									<tr>
										<td colspan="2">
											다음글 :
											<c:if test="${not empty nextDto}">
												<a href="${pageContext.request.contextPath}/admin/termsManage/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
								
							<table class="table">
								<tr>
									<td width="50%" align="left">
								    	<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/termsManage/update?num=${dto.num}&page=${page}';">수정</button>
						    			<button type="button" class="btn btn-success rere" onclick="deleteOk();">삭제</button>
									</td>
								
									<td align="right">
										<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/termsManage/list?${query}';">리스트</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</main>