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
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}


function searchList() {
	const f = document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/plusManage/plusList";
	f.submit();
}

function profile(userId) {
	const dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
			   " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk(userId);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 550,
		  width: 800,
		  title: "플러스상세정보",
		  close: function(event, ui) {
		  }
	});

	dlg.dialog("widget").css({
        "background-color": "lightgray",
        "z-index": 10000,
        "boder" : "1px solid #ccc",
        "padding": "3px",
        "text-align": "center"
    });
	
	$('#memberStateDetaile').closest('.ui-dialog').find('.ui-dialog-buttonset').css({
        'text-align': 'center',
        'padding': '15px',
        'margin': '5px auto',
        'boder':'none'
    });
	
	dlg.closest('.ui-dialog').find('.ui-dialog-titlebar-close').css({
        'position': 'absolute',
        'right': '10px'
    });
	
	dlg.closest('.ui-dialog').find('.ui-dialog-title').css({
        'font-size': '20px'
    });
	
	let url = "${pageContext.request.contextPath}/admin/plusManage/profile";
	let query = "userId="+userId;
	
	const fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "get", query, "text", fn);
}

function updateOk() {
	const f = document.deteailedMemberForm;
	
	if( ! f.stateCode.value ) {
		alert("상태코드를 선택하세요.");
		f.stateCode.focus();
		return;
	}
	if( ! f.memo.value.trim() ) {
		alert("상태메모를 선택하세요.");
		f.memo.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/plusManage/updateMemberState";
	let query = $("#deteailedMemberForm").serialize();

	const fn = function(data){
		$('form input[name=page]').val('${page}');
		searchList();
	};
	ajaxFun(url, 'post', query, 'json', fn);
		
	$('#member-dialog').dialog('close');
}

function memberStateDetaileView() {
	$('#memberStateDetaile').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정상태 상세',
		  close: function(event, ui) {
			   $(this).dialog("destroy"); // 이전 대화상자가 남아 있으므로 필요
		  }
	  });
	 $('#memberStateDetaile').dialog("widget").css({
	        "z-index": 10000,
	        "margin": "70px"
	 });
}

function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let s = f.stateCode.value;
	let txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!=="0" && s!=="6") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
}

function updateMembership(userId) {
	let query = "userId=" + userId + "&page=" + ${page};
	location.href = "${pageContext.request.contextPath}/admin/plusManage/updateMembership?" +  query;
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
    				
    				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
                      	<i class="fa-solid fa-user-group"></i> 플러스 관리 
	                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/plusManage/plusList';" style="float:right;">
	                    	<i class="fa-solid fa-arrow-rotate-left"></i>
	                    </button>
	                </h3>
    	
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
									<td align="right">
										<select id="selectEnabled" class="form-select" onchange="searchList();">
											<option value="" ${enabled=="" ? "selected":""}>::계정상태::</option>
											<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
											<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
										</select>
									</td>
								</tr>
							</table>
			
							<div class="card mb-5 w-80 text-center" style="margin:0 auto">
				                 <div class="card-body">
				                 	<div class="table-responsive">
				                    	<table class="table table-bordered">
				                        	<thead>
				                            	<tr>
				                                	<th>번호</th>
													<th>아이디</th>
													<th>이름</th>
													<th>전화번호</th>
													<th>이메일</th>
													<th>상태</th>
													<th>회원승인</th>
													<th>질문지 결과</th>
				                                </tr>
				                            </thead>
				
				                            <tbody>
												<c:forEach var="dto" items="${list}" varStatus="status">
													<tr class="hover" onclick="profile('${dto.userId}');">
														<td>${dataCount - (page-1) * size - status.index}</td>
														<td>${dto.userId}</td>
														<td>${dto.userName}</td>
														<td>${dto.tel}</td>
														<td>${dto.email}</td>
														<td>${dto.enabled==1?"활성":"잠금"}</td>
														<td class="event.stopPropagation()">
															<c:choose>
																<c:when test="${dto.membership==50}">
																<button type="button" class="btn btn-primary" onclick="updateMembership('${dto.userId}');">승인</button>
																
																</c:when>
																<c:otherwise>
																	승인
																</c:otherwise>
															</c:choose>
												
														</td>
														<td>
															<button type="button" class="btn btn-primary" onclick="sendOk('${dto.userId}');" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">확인</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
				                       </table>
				                                
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
															<input type="hidden" name="enabled" value="${enabled}">
															<input type="hidden" name="page" value="1">
															<button type="button" class="btn btn-outline-secondary" onclick="searchList()">검색</button>
														</div>
													</form>
												</td>
											</tr>
										</table>
										
										<div class="page-navigation" >
											${dataCount == 0 ? "등록된 회원이 없습니다." : paging}
										</div>
										
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
