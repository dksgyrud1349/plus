<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.board-article img { max-width: 650px; }
</style>
<script type="text/javascript">
	function updateState(approvalCode){
		
		let s = "이 클래스의 승인 상태를 " + (approvalCode === 0 ? "대기" : approvalCode === 1 ? "승인" : approvalCode === 2 ? "보류" : approvalCode === 3 ? "취소" : "") + " 로 변경하시겠습니까?";
		
		if(confirm(s)){
			let classNum = ${dto.classNum};
			let query = "approvalCode=" + approvalCode + "&classNum=" + classNum;
			let url = "${pageContext.request.contextPath}/admin/lessonManage/update0?" + query;
			location.href = url;
		}
	}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:5% auto; padding-top:5%">
				<div class="body-main">
				
					<div class="card mb-5 w-80" style="margin:0 auto;">
				    	<div class="card-header text-center">
				    		<h3>
				    			<i class="bi bi-app"></i> 승인대기 클래스
				    		</h3>
				    	</div>
		
					<div class="table table-hover board-list " id="nav-tabContent">
						<table class="table">
							<thead>
								<tr>
									<td colspan="2" align="center">
										${dto.className}
									</td>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td width="50%">
										이름 : ${dto.userName}
									</td>
									<td align="right">
										시작일자 : ${dto.startDate} | 종료일자 : ${dto.endDate} | 등록일 : ${dto.regDate}
									</td>
								</tr>
								<tr>
									<td colspan="2" valign="top" height="200" style="border-bottom: none;">
										${dto.content}
									</td>
								</tr>
							</tbody>
						</table>
						
						<table class="table table-borderless mb-2">
							<tr>
								<td width="50%">
									<button type="button" class="btn btn-outline-secondary" onclick="updateState(0)">대기 <i class="bi bi-hourglass"></i></button>
									<button type="button" class="btn btn-outline-success" onclick="updateState(1)">승인<i class="bi bi-circle"></i></button>
									<button type="button" class="btn btn-outline-warning" onclick="updateState(2)">보류 <i class="bi bi-hourglass-split"></i></button>
									<button type="button" class="btn btn-outline-danger" onclick="updateState(3)">취소 <i class="bi bi-x-lg"></i></button>
								</td>
								<td class="text-end">
									<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/lessonManage/list0?${query}';">리스트</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}
</script>
