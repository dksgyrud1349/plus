<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.table-category {
	border-spacing: 1px;
	background: #999;
	width: 100%;
}
.table-category thead>tr {
	text-align: center;
	background: #f8f9fa;
}
.table-category thead tr>th {
	color:  #787878;
	padding: 10px 0;
}

.table-category tbody>tr, .table-category tfoot>tr {
	text-align: center;
	background: #fff;
	height: 30px;
}

.table-category input {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	box-sizing: border-box;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.table-category select {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnCategoryAddOk, .btnSpanIcon {
	cursor: pointer;
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
.change{
	border: 1px solid #b4b4b4;
}

</style>

<script type="text/javascript">
function sendOk() {
    const f = document.faqForm;

    if(! f.cateNum.value) {
        alert("카테고리를 선택하세요. ");
        f.cateNum.focus();
        return;
    }
    
	let str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
    f.action="${pageContext.request.contextPath}/admin/faqManage/${mode}";
    f.submit();
}
</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		 	<div class="container-fluid px-5">
				<div class="body-container" style="width:80%; margin:5% auto; ">
				
			    <div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="fa-solid fa-clipboard-question"></i> 자주하는 질문 
					</h3>	
    
					<form name="faqForm" method="post">
						<table class="table table-border border-top2 table-form">
							<tr> 
								<td>카테고리</td>
								<td>
									<div class="d-flex flex-row">
										<div class="col-3">
											<select name="cateNum" class="form-select">
												<c:forEach var="vo" items="${listCategory}">
													<option value="${vo.cateNum}" ${dto.faqName==vo.faqName?"selected":""}>${vo.faqName}</option>
												</c:forEach>
											</select>
										</div>
										<button type="button" class="btn btn-outline-secondary btnCategoryDialog col-md-auto"> 변경 </button>
									</div>
								</td>
							</tr>
						
							<tr> 
								<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
								<td> 
									<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
								</td>
							</tr>
						
							<tr>
								<td>작성자</td>
								<td> 
									${sessionScope.member.userName}
								</td>
							</tr>
						
							<tr> 
								<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
								<td valign="top"> 
									<textarea name="content" class="form-control">${dto.content}</textarea>
								</td>
							</tr>
						</table>
						
						<table class="table">
							<tr>
								<td align="center">
									<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
									<button type="reset" class="btn btn-success rere">다시입력</button>
									<button type="button" class="btn btn-success rere" onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/main?pageNo=${pageNo}';">${mode=='update'?'수정취소':'등록취소'}</button>
									<c:if test="${mode=='update'}">
										<input type="hidden" name="num" value="${dto.num}">
										<input type="hidden" name="pageNo" value="${pageNo}">
									</c:if>
								</td>
							</tr>
						</table>
					</form>
					
					<div id="category-dialog" style="display: none;">
						<form name="categoryForm" method="post">
							<table class="table-category">
								<thead>
									<tr> 
										<th>카테고리</th>
										<th width="110">활성</th>
										<th width="110">출력대상</th>
										<th width="110">출력순서</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center" height="30" bgcolor="#fff">
										<td> <input type="text" name="faqName"> </td>
										<td>
											<select name="showFaq">
												<option value="1">활성</option>
												<option value="0">비활성</option>
											</select>
										</td>
										<td>
											<select name="showUser">
												<option value="0">공통</option>
												<option value="1">이용자</option>
												<option value="2">플러스</option>
											</select>
										</td>
										<td> <input type="text" name="orderNo"> </td>
										<td> <button type="button" class="btnCategoryAddOk">등록하기</button> </td>
									</tr>
								</tbody>
								<tfoot class="category-list"></tfoot>
							</table>
						</form>
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

$(function(){
	// 카테고리 수정 대화상자
	$(".table-form").on("click", ".btnCategoryDialog", function(){
		$("form[name=categoryForm]").each(function(){
			this.reset();
		});
		
		$("#category-dialog").dialog({
			  modal: true,
			  height: 500,
			  width: 700,
			  title: '카테고리 수정',
			  open : function(){
				let url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
				$(".category-list").load(url);  
			  },
			  close: function(event, ui) {
				  $("form[name=faqForm] select[name=cateNum]").find('option').remove();
				  
				  let url = "${pageContext.request.contextPath}/admin/faqManage/listCategory";
				  let query = "mode=showFaq";

				  const fn = function(data) {
						$.each(data.listCategory, function(index, item){
							let cateNum = item.cateNum;
							let faqName = item.faqName;
							let s = "<option value='"+cateNum+"'>"+faqName+"</option>";
							$("form[name=faqForm] select[name=cateNum]").append(s);
						});
						
						let mode = "${mode}";
						if(mode === "update") {
							$("form[name=faqForm] select[name=cateNum]").val("${dto.cateNum}");
						}
				  };
				  ajaxFun(url, "get", query, "json", fn);

			  }
		});
	});
	// $('.category-dialog').dialog("close"); // 창종료

	// 카테고리 등록
	$("#category-dialog").on("click", ".btnCategoryAddOk", function(){	
		const $tr = $(this).closest("tr");
		let faqName = $tr.find("input[name=faqName]").val().trim();
		let showFaq = $tr.find("select[name=showFaq]").val().trim();
		let showUser = $tr.find("select[name=showUser]").val().trim();
		let orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! faqName) {
			$tr.find("input[name=faqName]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		faqName = encodeURIComponent(faqName);
		let url = "${pageContext.request.contextPath}/admin/faqManage/insertCategory";
		let query = "faqName="+faqName+"&showFaq="+showFaq+"&showUser="+showUser+"&orderNo="+orderNo;
		
		const fn = function(data){
			// let state = data.state;
			$("form[name=categoryForm]").each(function(){
				this.reset();
			});
			
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정
	$(".category-list").on("click", ".btnCategoryUpdate", function(){	
		const $tr = $(this).closest("tr");
		$tr.find("input").prop("disabled", false);
		$tr.find("select").prop("disabled", false);
		
		$tr.find(".btnCategoryUpdate").hide();
		$tr.find(".btnCategoryDeleteOk").hide();

		$tr.find(".btnCategoryUpdateOk").show();
		$tr.find(".btnCategoryUpdateCancel").show();
	});

	// 카테고리 수정 완료
	$(".category-list").on("click", ".btnCategoryUpdateOk", function(){	
		const $tr = $(this).closest("tr");
		let categoryNum = $tr.find("input[name=cateNum]").val();
		let category = $tr.find("input[name=faqName]").val().trim();
		let showFaq = $tr.find("select[name=showFaq]").val().trim();
		let showUser = $tr.find("select[name=showUser]").val().trim();
		let orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! category) {
			$tr.find("input[name=faqName]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		faqName = encodeURIComponent(category);
		let url = "${pageContext.request.contextPath}/admin/faqManage/updateCategory";
		let query = "cateNum="+categoryNum+"&faqName="+faqName+"&showFaq="+showFaq+"&showUser="+showUser+"&orderNo="+orderNo;
		const fn = function(data){
			let state = data.state;
			if(state === "false") {
				alert("카테고리 삭제가 불가능합니다.");
				return false;
			}
			
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정 취소
	$(".category-list").on("click", ".btnCategoryUpdateCancel", function(){	
		const $tr = $(this).closest("tr");
		$tr.find("input").prop("disabled", true);
		$tr.find("select").prop("disabled", true);
		
		$tr.find(".btnCategoryUpdateOk").hide();
		$tr.find(".btnCategoryUpdateCancel").hide();

		$tr.find(".btnCategoryUpdate").show();
		$tr.find(".btnCategoryDeleteOk").show();
	});

	// 카테고리 삭제
	$(".category-list").on("click", ".btnCategoryDeleteOk", function(){
		if(! confirm("카테고리를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		const $tr = $(this).closest("tr");
		let cateNum = $tr.find("input[name=cateNum]").val();
		
		let url = "${pageContext.request.contextPath}/admin/faqManage/deleteCategory";
		let query = "cateNum="+cateNum;
		
		const fn = function(data){
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>
