<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.table-article img {
	max-width: 650px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#tab-${category}').addClass('active');
	
		$('ul.tabs li').click(function() {
			let category = $(this).attr('data-category');
			
			location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
		});
	});

	function isValidDateFormat(data){
		if(data.length !== 8 && data.length !== 10) return false;
			
		let p = /(\.)|(\-)|(\/)/g;
		data = data.replace(p, "");
		if(data.length !== 8) return false;
		
		let format = /^[12][0-9]{7}$/;
		if(! format.test(data)) return false;
	    
		let y = parseInt(data.substr(0, 4));
		let m = parseInt(data.substr(4, 2));
		let d = parseInt(data.substr(6));
	
		if(m<1 || m>12) return false;
		let lastDay = (new Date(y, m, 0)).getDate();
		if(d<1 || d>lastDay) return false;
		
		return true;
	}

    function check() {
        const f = document.eventForm;
        let mode = "${mode}";

    	let str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.title.focus();
            return false;
        }

    	if(! isValidDateFormat(f.sday.value)) {
    		alert("날짜를 입력하세요.");
    		f.sday.focus();
    		return false;
    	}
    	
    	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.stime.value)) {
    		alert("시간을 입력하세요.");
    		f.stime.focus();
    		return false;
    	}

    	if(! isValidDateFormat(f.eday.value)) {
    		alert("날짜를 입력하세요.");
    		f.eday.focus();
    		return false;
    	}
    	
    	if(! /^[0-2][0-9]:[0-5][0-9]$/.test(f.etime.value)) {
    		alert("시간을 입력하세요.");
    		f.etime.focus();
    		return false;
    	}
    	
    	let sd = new Date(f.sday.value + " " + f.stime.value);
    	let ed = new Date(f.eday.value + " " + f.etime.value);
    	
    	if( sd.getTime() >= ed.getTime() ) {
    		alert("시작날짜는 종료날짜보다 크거나 같을 수 없습니다.");
    		f.sday.focus();
    		return false;
    	}

    	if( mode === "write" && new Date().getTime() > ed.getTime() ) {
    		alert("종료날짜는 현재 시간보다 작을수 없습니다.");
    		f.eday.focus();
    		return false;
    	}
        
    	str = f.eContent.value;
    	if( !str || str === "<p><br></p>" ) {
            alert("내용을 입력하세요. ");
            f.eContent.focus();
            return false;
        }
    	
    	f.action = "${pageContext.request.contextPath}/admin/eventManage/${category}/${mode}";

        return true;
    }
</script>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
	                	<i class="fa-regular fa-calendar"></i> 이벤트 관리 
		            </h3>
				
					<div>
						<ul class="tabs">
							<li id="tab-all" data-category="all">전체 이벤트</li>
							<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
							<li id="tab-ended" data-category="ended">종료된 이벤트</li>
							<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
						</ul>
					</div>
					
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
						
						<div class="card mb-5 w-80" style="margin:0 auto">
				        	<div class="card-header text-center">
				            	
					        </div>					
					
							<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
								<form name="eventForm" method="post" enctype="multipart/form-data">
									<table class="table table-border border-top2 table-form">
										<tr> 
											<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
											<td> 
												<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
											</td>
										</tr>
						
										<tr>
											<td>시작일자</td>
											<td> 
												<input type="date" name="sday" class="form-control" value="${dto.sday}">
												<input type="time" name="stime" class="form-control" value="${dto.stime}">
											</td>
										</tr>
						
										<tr>
											<td>종료일자</td>
											<td> 
												<input type="date" name="eday" class="form-control" value="${dto.eday}">
												<input type="time" name="etime" class="form-control" value="${dto.etime}">
											</td>
										</tr>
						
										<tr>
											<td>할인금액</td>
											<td> 
												<p> <input type="text" name="discountMoney" class="form-control" value="${dto.discountMoney}"> </p>
												<p class="help-block">할인금액을 입력해주세요.</p>
											</td>
										</tr>
										
										<tr>
											<td>할인율</td>
											<td> 
												<p> <input type="text" name="discountPercent" class="form-control" value="${dto.discountPercent}"> </p>
												<p class="help-block">할인율을 입력해주세요.</p>
											</td>
										</tr>
										
										<tr>
											<td>이벤트 종류</td>
											<td> 
												<p> <input type="text" name="eventKind" class="form-control" value="${dto.eventKind}"> </p>
												<p class="help-block">이벤트 종류</p>
											</td>
										</tr>
										
										<tr> 
											<td>출력여부</td>
											<td> 
												<input type="checkbox" name="showEvent" id="showEvent" class="form-check-input" value="1" ${mode=="write" || dto.showEvent==1 ? "checked":"" }>
												<label for="showEvent" class="form-check-label">표시</label>
											</td>
										</tr>
									
										<tr> 
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"> 
												<textarea name="eContent" id="ir1" class="form-control">${dto.eContent}</textarea>
											</td>
										</tr>
										
										<tr>
											<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
											<td> 
												<input type="file" name="selectFile" accept="image/*" class="form-control" multiple>
											</td>
										</tr>
									  	<c:if test="${mode=='update'}">
									  		<tr>
									  			<td>클래스 등록</td>
									  			<td>
									  				<a class="btn btn-light btn-sm searchclass" onclick="">검색</a>
									  				<div class="class-name-list"></div>
									  			</td>
									  		</tr>
									  	</c:if>
									</table>
										
									<table class="table">
										<tr> 
											<td align="center">
												<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
												<button type="reset" class="btn btn-success">다시입력</button>
												<button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';">${mode=='update'?'수정취소':'등록취소'}</button>
												<c:if test="${mode=='update'}">
													<input type="hidden" name="eventNum" value="${dto.eventNum}">
													<input type="hidden" name="eventImg" value="${dto.eventImg}">
													<input type="hidden" name="page" value="${page}">
												</c:if>
											</td>
										</tr>
									</table>
								</form>
							</div>		
						</div> 	
					</div>
				</div>
			</div>
		</div>
	</div>
</main>



<!-- 상품 검색 대화상자 -->
<div class="modal fade" id="classSearchModal" tabindex="-1" aria-labelledby="searchModalLabel"
				aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="searchViewerModalLabel">클래스검색</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
                <div class="row search-form">
					<div class="input-group">
						<select name="schType" class="form-select">
							<option value="classNum">클래스번호</option>
							<option value="className">클래스명</option>
							<option value="userId">아이디</option>
							<option value="nickName">닉네임</option>
						</select>
						<input type="text" name="kwd" class="form-control">
						<button type="button" class="btn btn-light btn-classSearch" title="검색"><i class="bi bi-search"></i></button>
					</div>
                </div>
               	<div class='row mt-2 border-top border-bottom bg-light p-2'>
               	 	<div class='col text-center'>클래스번호</div>
               	 	<div class='col text-center'>클래스명</div>
               	 	<div class='col text-center'>아이디</div>
               	 	<div class='col text-center'>닉네임</div>
               	 	<div class='col text-center'>가격</div>
               	 	
               	</div>
                <div class="class-search-list">
                	<ul></ul>
                </div>
			</div>
			<div class="modal-footer">
					<button type="button" class="btn btn-secondary btnClose">닫기</button>
			</div>	
		</div>
	</div>
</div>










<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}

</script>

<script>
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
	$(".searchclass").click(function(){
		$("#classSearchModal").modal("show");
	});

	// 클래스 검색 대화상자 - 취소
	$(".btnClose").click(function(){
		$("#classSearchModal").modal("hide");
	});
	
	
	// 상품검색 대화상자-검색 버튼
	$(".btn-classSearch").click(function(){
	    $(".class-search-list").html("");
	    
	    let schType = $(".search-form select[name=schType]").val();
	    let kwd = $(".search-form input[name=kwd]").val();
	    let eventNum = "${dto.eventNum}";
	    
	    let query = "&schType=" + schType + "&kwd=" + encodeURIComponent(kwd);
	    let url = "${pageContext.request.contextPath}/admin/eventManage/${dto.eventNum}/search";

	    const fn = function(data) {
	        let out = "";
	        for(let item of data.classList) {
	            let classNum = item.classNum;
	            let className = item.className;
	            let nickName = item.nickName;
	            let userId = item.userId;
	            let price = item.price;
	            
	            out += "<div class='row mb-2 p-2 border-bottom'>";
	            out += "  <div class='col text-center'>"+classNum+"</div>"
	            out += "  <div class='col search-className' data-classNum='"+classNum+"' data-classprice='"+price+"'>"+className+"</div>";
	            out += "  <div class='col text-center'>"+userId+"</div>"
	            out += "  <div class='col text-center'>"+nickName+"</div>"
	            out += "  <div class='col text-center'>"+price+"</div>"
	            out += "</div>"; 
	        }
	        
	        $(".class-search-list").html(out);
	    };
	    
	    ajaxFun(url, "get", query, "json", fn);
	    
	});

	// 상품검색 대화상자-검색된 상품을 클릭한 경우
	$("body").on("click", '.search-className', function(){
	    let classNum = $(this).attr("data-classNum");
	    let className = $(this).text().trim();
	    let eventNum = "${dto.eventNum}";
	    let price = $(this).attr("data-classprice");
	    let discountMoney = "${dto.discountMoney}";
	    let discountPercent = "${dto.discountPercent}";
	    
	    let query = "";
	    
	    if(discountMoney > 0){
	    	query = "eventNum=" + eventNum + "&classNum=" + classNum + "&price=" + price + "&discountMoney="+discountMoney;
	    } else {
	    	query = "eventNum=" + eventNum + "&classNum=" + classNum + "&price=" + price + "&discountPercent="+discountPercent;
	    }
	    
	    let url = "${pageContext.request.contextPath}/admin/eventManage/${dto.eventNum}/classInsert";
	    
	    const fn = function(data){
	        $("#classSearchModal").modal("hide");
	        printClass();
	    };
	    
	    ajaxFun(url, "post", query, "json", fn);
	    
	});
	
	// 등록 상품 삭제 버튼
	$(".class-name-list").on("click", ".btn-classDelete", function(){
		if( ! confirm('등록된 클래스를 삭제 하시겠습니까 ? ') ) {
			return false;	
		}
		
		let classNum = $(this).attr("data-classNum")
		let url = "${pageContext.request.contextPath}/admin/eventManage/${dto.eventNum}/classDelete";
		let query = "classNum="+classNum;
		
		const fn = function(data){
			printClass();
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
$(function(){
	printClass();
});

//상품리스트
function printClass() {
    $(".class-name-list").html("");

    let eventNum = "${dto.eventNum}";

    let url = "${pageContext.request.contextPath}/admin/eventManage/${dto.eventNum}/classList";
    let query = "eventNum=" + eventNum;
    const fn = function (data) {
        let out = "";
        for (let item of data.list) {
            let classNum = item.classNum;
            let className = item.className;
            let price = item.price;

            out += "<div class='row mb-2 p-2 border-bottom'>";
            out += "  <div class='col text-center'>" + classNum + "</div>";
            out += "  <div class='col search-className' data-classNum='" + classNum + "'>" + className + "</div>";
            out += "  <div class='col text-center'>" + price + "</div>";
            out += "  <div class='col'><span class='btn btn-sm btn-danger btn-classDelete' data-classNum='" + classNum + "'>삭제</span></div>";
            out += "</div>";
        }

        $(".class-name-list").html(out);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	    
	}
})

</script>