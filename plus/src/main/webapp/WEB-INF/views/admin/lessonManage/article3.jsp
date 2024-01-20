<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.board-article img { max-width: 650px; }
.rere {
	color: white;
	background: #32B0E4;
	padding: 6px 12px 6px 12px;
	border: none;
}

</style>
<script type="text/javascript">
	function updateState(approvalCode){
		
		let s = "이 클래스의 승인 상태를 " + (approvalCode === 0 ? "대기" : approvalCode === 1 ? "승인" : approvalCode === 2 ? "보류" : approvalCode === 3 ? "취소" : "") + " 로 변경하시겠습니까?";
		
		if(confirm(s)){
			let classNum = ${dto.classNum};
			let query = "approvalCode=" + approvalCode + "&classNum=" + classNum;
			let url = "${pageContext.request.contextPath}/admin/lessonManage/update3?" + query;
			location.href = url;
		}
	}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:100%; margin:10% auto;">
				<div class="body-main">
				
					<div class="card mb-5 w-80" style="margin:0 auto;">
				    	<div class="card-header text-center">
				    		<h3>
				    			승인취소 클래스
				    		</h3>
				    	</div>
		
					<div class="table table-hover board-list " id="nav-tabContent">
						<table class="table">
							<thead>
								<tr class="fs-5">
									<td colspan="2" align="center">
										${dto.className}
									</td>
								</tr>
							</thead>
							
							<tbody>
								<tr class="fs-5">
									<td width="50%">
										이름 : ${dto.userName}
									</td>
									<td align="right">
										시작일자 : ${dto.startDate} <i class="bi bi-three-dots-vertical"></i> 종료일자 : ${dto.endDate} <i class="bi bi-three-dots-vertical"></i> 등록일 : ${dto.regDate}
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
									<button type="button" class="btn btn-secondary" onclick="updateState(0)">대기</button>
									<button type="button" class="btn btn-success" onclick="updateState(1)">승인</button>
									<button type="button" class="btn btn-warning" onclick="updateState(2)">보류</button>
									<button type="button" class="btn btn-danger" onclick="updateState(3)">취소</button>
								</td>
								<td class="text-end">
									<button type="button" class="btn rere" style="background: #32B0E4; color: white;" onclick="location.href='${pageContext.request.contextPath}/admin/lessonManage/list3?${query}';">리스트</button>
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
