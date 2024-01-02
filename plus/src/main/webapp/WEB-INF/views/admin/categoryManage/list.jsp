<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style>

</style>
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
	
function detail(mainNum) {
	const dlg = $("#category-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  height: 400,
		  width: 600,
		  title: "카테고리 관리",
		  buttons: {
		       " 삭제 " : function() {
		    	   deleteOk(mainNum);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  close: function(event, ui) {
			  
		  }
	});
	
	dlg.dialog("widget").css({
        "background-color": "lightgray",
        "z-index": 10000,
        "boder" : "1px solid #ccc",
        "padding": "5px",
        "text-align": "center"
    });
	
	dlg.closest('.ui-dialog').find('.ui-dialog-titlebar-close').css({
        'position': 'absolute',
        'right': '10px'
    });
	
	dlg.closest('.ui-dialog').find('.ui-dialog-title').css({
        'font-size': '20px'
    });
	

	let url = "${pageContext.request.contextPath}/admin/categoryManage/detail";
	let query = "mainNum="+mainNum;
	
	const fn = function(data){
		$('#category-dialog').html(data);
		dlg.dialog("open");
	};
	
	ajaxFun(url, "get", query, "text", fn);
	

}

function deleteOk(mainNum) {
	var url = "${pageContext.request.contextPath}/admin/categoryManage/delete";
	var query = "mainNum="+mainNum;
	
	if(! confirm("카테고리를 삭제하시겠습니까 ?")) {
		  return;
	}
	
	const fn = function(data){
		$('#category-dialog').dialog("close");
		location.href = "${pageContext.request.contextPath}/admin/categoryManage/list";
	};
	ajaxFun(url, "post", query, "json", fn);
	
}




</script>

<main class="wrapper" style="margin:0 auto; width:100%;" >
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
    			<div class="body-main">
    			
	    			<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	                   	<i class="bi bi-archive-fill"></i> 카테고리 관리 
	                    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/categoryManage/list';" style="float:right;">
		                    <i class="fa-solid fa-arrow-rotate-left"></i>
		                </button>
		            </h3>
		            
		            <div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						<table class="table">
							<tr>
								<td align="left" width="50%">
									<span class="me-3">메인 카테고리: <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount}개</font></span> 
									<span>서브 카테고리: <font style="color:green; font-weight:bold; text-decoration:underline">${dataCount2}개</font></span>
								</td>
								<td align="right">
									<span class="btn btn-dark " onclick="location.href='${pageContext.request.contextPath}/admin/categoryManage/write';">추가</span>
								</td>
							</tr>
						</table>
  				
  					<div id="cate-content" style="padding: 20px 0px 0;">
						<div class="card mb-5" style="margin:0 auto">
							<div class="card-body">
				            	
								<c:if test="${listMainCategory.size() > 0}">
								   <div class="container">
								       <table class="table">
								           <c:forEach var="dto" items="${listMainCategory}" varStatus="status">
								               <c:if test="${status.index % 2 == 0}">
								                   <tr>
								               </c:if>
								               <td>
								                   <div class="border rounded m-1">
								                       <div class="accordion-header row p-2">
								                           <div class="col">
								                               <h3>${dto.mainName}</h3>
								                           </div>
								                           <div class="col update text-end">
								                               <span class="btn btn-outline-dark" onclick="detail('${dto.mainNum}');">상세보기</span>
								                           </div>
								                       </div>
								                   </div>
								               </td>
								           </c:forEach>
								       </table>
								   </div>
								</c:if>
								</div>
				        	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<div id="category-dialog" style="display: none;"></div>
