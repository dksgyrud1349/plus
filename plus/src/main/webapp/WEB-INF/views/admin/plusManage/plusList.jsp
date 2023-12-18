<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<script type="text/javascript">
$(function(){
	$("#tab-0").addClass("active");

	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		let url = "${pageContext.request.contextPath}/admin/plusManage/graph";	
		location.href = url;
	});
});

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}


function searchList() {
	const f = document.searchForm;
	f.submit();
}

function sendOk(userId) {
	let q = "userId=" + userId + "&page=" + ${page};
	location.href = "${pageContext.request.contextPath}/admin/plusManage/article?" + q;
}

</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 	<div class="container-fluid px-5">
				<div class="body-container" style="width:80%; margin:5% auto; ">
    				<div class="body-main">
    	
						<div>
							<ul class="tabs">
								<li id="tab-0" data-tab="0">
									<i class="fa-solid fa-person"></i>&nbsp;플러스 리스트
								</li>
								<li id="tab-1" data-tab="1">
									<i class="fa-solid fa-chart-column"></i>&nbsp;질문 분석
								</li>
							</ul>
						</div>
						
						<div id="tab-content" style="padding: 20px 0px 0;">
							<table class="table">
								<tr>
									<td align="left" width="70%" style="font-weight:bold">
										전체 플러스 <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}명</font> (${page}/${total_page} 페이지)
									</td>
								</tr>
							</table>
			
							<div class="card mb-5 w-80 text-center" style="margin:0 auto">
				            	<div class="card-header">
				                	<h3>
				                      <i class="fa-solid fa-user-group"></i> 플러스 관리 
					                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/plusManage/plusList';" style="float:right;">
					                    	<i class="fa-solid fa-arrow-rotate-left"></i>
					                    </button>
					                </h3>
					             </div>
					             
				                 <div class="card-body">
				                 	<div class="table-responsive">
				                    	<table class="table table-bordered">
				                        	<thead>
				                            	<tr>
				                                	<th>번호</th>
													<th>아이디</th>
													<th>이름</th>
													<th>생년월일</th>
													<th>전화번호</th>
													<th>회원구분</th>
													<th>상태</th>
													<th>이메일</th>
													<th>확인</th>
				                                </tr>
				                            </thead>
				
				                            <tbody>
												<c:forEach var="dto" items="${list}" varStatus="status">
													<tr>
														<td>${dataCount - (page-1) * size - status.index}</td>
														<td>${dto.userId}</td>
														<td>${dto.userName}</td>
														<td>${dto.birth}</td>
														<td>${dto.tel}</td>
														<td>${dto.membership == 51 ? "플러스":""}</td>
														<td>${dto.enabled==1?"활성":"잠금"}</td>
														<td>${dto.email}</td>
														<td>
															<button type="button" class="btn btn-primary" onclick="sendOk('${dto.userId}');" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">확인</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
				                       </table>
				                                
				                       <div class="page-navigation" >
											${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
										</div>
												
										<table class="table">
											<tr>
												<td align="center">
													<form name="searchForm" action="${pageContext.request.contextPath}/admin/plusManage/plusList" method="post" style="width:300px;">
														<div class="input-group mb-3">
																
															<select name="schType" class="form-select">
																<option value="userId"     ${schType=="userId" ? "selected":""}>아이디</option>
																<option value="userName"   ${schType=="userName" ? "selected":""}>이름</option>
																<option value="email"      ${schType=="email" ? "selected":""}>이메일</option>
																<option value="tel"        ${schType=="tel" ? "selected":""}>전화번호</option>
															</select>
															<input type="text" name="kwd" class="form-control" value="${kwd}">
															<input type="hidden" name="page" value="1">
															<button type="button" class="btn btn-outline-secondary" onclick="searchList()">검색</button>
														</div>
													</form>
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
			</div>
		</main>

		<div id="member-dialog" style="display: none;"></div>
