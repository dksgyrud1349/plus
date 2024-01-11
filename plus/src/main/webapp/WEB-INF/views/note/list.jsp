<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

.table .ellipsis {
	position: relative;
	min-width: 200px;
}
.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 9px;
	right: 9px;
	cursor: pointer;
}

.table .ellipsis:before {
	content: '';
	display: inline-block;
}
.miyul {
	color: #828282;
}
.yul {
	color: #3c3c3c;
}
.circle {
	font-size: 10px;
}
.write {
	color: white;
	background: #46AA46;
	padding: 10px;
	border: none;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">


$(function(){
	let menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/note/"+tab+"/list";
		location.href=url;
    });
});

function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=nums]").prop("checked", true);
        } else {
		   $("input[name=nums]").prop("checked", false);
        }
    });
 
    $(".btnDelete").click(function(){
		let cnt = $("input[name=nums]:checked").length;

		if (cnt === 0) {
			alert("삭제할 쪽지를 먼저 선택 하세요 !!!");
			return;
		}
         
		if(confirm("선택한 쪽지를 삭제 하시 겠습니까 ? ")) {
			const f = document.listForm;
			f.action = "${pageContext.request.contextPath}/note/${menuItem}/delete";
			f.submit();
		}
	});
});
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:10% auto; ">
				<div class="body-main">
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
					<i class="bi bi-messenger"></i> 쪽지함 
					
					<button type="button" class="btn btn-outline-success rere" onclick="location.href='${pageContext.request.contextPath}/note/${menuItem}/list';" title="새로고침" style="float:right;">
						<i class="bi bi-arrow-counterclockwise"></i>
					</button>
				</h3>
		
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link border border-1.5" id="tab-receive" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="receive" aria-selected="true" data-tab="receive">받은 쪽지함</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link border border-1.5" id="tab-send" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="send" aria-selected="true" data-tab="send">보낸 쪽지함</button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active mt-3" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content">
				
					<table class="table table-borderless mb-0">
						<tr>
							<td align="left" width="50%">
								<button type="button" class="btn btnDelete border border-1.5 border-black px-2 py-1" title="삭제"><i class="bi bi-trash3-fill"></i></button>
							</td>
							<td align="right">
								<button type="button" class="btn btn-outline-success write" onclick="javascript:location.href='${pageContext.request.contextPath}/note/write';">쪽지 쓰기&nbsp;<i class="bi bi-pencil"></i></button>
							</td>
						</tr>
					</table>
					
					<form name="listForm" method="post">
						<table class="table table-hover board-list" style="">
							<thead class="table-light text-center align-middle" style="height: 57px">
								<tr>
									<th width="40"><input type="checkbox" name="chkAll" id="chkAll" class="form-check-input border border-1.5"></th>
									<th>번호</th>
									<th width="100">${menuItem=="receive"?"보낸사람":"받는사람"}</th>
									<th>내용</th>
									<th width="150">${menuItem=="receive"?"받은날짜":"보낸날짜"}</th>
									<th width="150">읽은날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							
							<tbody class="text-center align-middle">
								<c:forEach var="dto" items="${list}" varStatus="status">
									<tr>
										<td><input type="checkbox" name="nums" value="${dto.noteNum}" class="form-check-input"></td>
										<td>${dataCount - (page-1) * size - status.index}</td>
										<td>${menuItem=="receive"?dto.senderName:dto.receiverName}</td>
										<td class="left ellipsis">
												<a href="${articleUrl}&noteNum=${dto.noteNum}" class="text-reset">
												<c:choose>
									                <c:when test="${dto.identifyDate == null}">
									                    <span><i class="bi bi-envelope"></i>&nbsp;${dto.content}</span>
									                </c:when>
									                <c:otherwise>
									                    <span><i class="bi bi-envelope-open"></i>&nbsp;${dto.content}</span>
									                </c:otherwise>
									            </c:choose></a>
										</td>
										<td>${dto.sendDate}</td>
										<td>${dto.identifyDate}</td>
										<td>
										<c:choose>
							                <c:when test="${dto.identifyDate == null}">
							                    <span class="fw-bold miyul"><i class="bi bi-circle-fill circle" style="color:red"></i>&nbsp;미열람</span>
							                </c:when>
							                <c:otherwise>
							                    <span class="fw-bold yul"><i class="bi bi-circle-fill circle" style="color:green"></i>&nbsp;열람</span>
							                </c:otherwise>
							            </c:choose>
							            </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="schType" value="${schType}">
						<input type="hidden" name="kwd" value="${kwd}">						
					</form>
					
						<table class="table">
							<tr>
								<td align="center">
									<form class="row" name="searchForm" action="${pageContext.request.contextPath}/note/${menuItem}/list" method="post" style="width:300px;">
										<div class="input-group mb-3">
											<select name="schType" class="form-select">
												<option value="content" ${schType=="content"?"selected":""}>내용</option>
												<c:choose>
													<c:when test="${menuItem=='receive'}">
														<option value="senderName" ${schType=="senderName"?"selected":""}>보낸사람</option>
														<option value="senderId" ${schType=="senderId"?"selected":""}>아이디</option>
														<option value="sendDate" ${schType=="sendDate"?"selected":""}>받은날짜</option>
													</c:when>
													<c:otherwise>
														<option value="receiverName" ${schType=="receiverName"?"selected":""}>받는사람</option>
														<option value="receiverId" ${schType=="receiverId"?"selected":""}>아이디</option>
														<option value="sendDate" ${schType=="sendDate"?"selected":""}>보낸날짜</option>
													</c:otherwise>
												</c:choose>
											</select>
											<input type="text" name="kwd" value="${kwd}" class="form-control">
											<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
										</div>
									</form>
								</td>
							</tr>
						</table>
					<div class="page-navigation text-center mb-3">
						${dataCount == 0 ? "등록된 쪽지가 없습니다." : paging}
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>
</main>