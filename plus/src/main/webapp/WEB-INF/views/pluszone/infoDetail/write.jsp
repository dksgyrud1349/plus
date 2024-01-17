<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.table-article img {
	max-width: 650px;
}
.file-item {
	padding: 7px; margin-bottom: 3px; border: 1px solid #ced4da; color: #777777;
}
.btn-return{
	background-color: #B4B4B4;
	color: white;
}
.btn-return:hover{
	background-color: #A0A0A0;
	color: white;
}
.totalSize{
	width: 1000px;
	height: 700px;
}
.imgStyle{
	width: 250px;
	height: 250px;
	
}
.rere {
	color: white;
	background: #46AA46;
	padding: 6px 12px 6px 12px;
	border: none;
}
</style>

<script type="text/javascript">
function sendOk(){
	const f = document.infoDetailForm;
	let mode="${mode}";
	/*
	if(!f.photoFile.value){
		alert("대표 사진을 등록하세요.");
		f.photoFile.focus();
		return false;
	}
	*/
	
	if(! f.nickName.value){
		alert("닉네임을 입력해주세요.");
		f.nickName.focus();
		return false;
	}
	
	if(! f.content.value){
		alert("플러스 소개를 입력해주세요.");
		f.content.focus();
		return false;
	}
	
	f.action = "${pageContext.request.contextPath}/pluszone/infoDetail/${mode}";
	f.submit();
}
</script>

<script type="text/javascript">
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
function(){
	//enter => <br>
	var text = document.getElementById("textarea").value;
	text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

	//<br> => enter
	var text = document.getElementById("textarea").value;
	text = text.replaceAll("<br>", "\r\n");
}
</script>

<main class="wrapper totalSize" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
	  <form name="infoDetailForm" method="post" enctype="multipart/form-data">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:62%; margin:5% auto; ">
				<div class="body-main">
		    			
					<div class="card mb-5 w-80" style="margin:0 auto">
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
						  <input type="hidden" name="userId" value="${dto.userId}">
						  <input type="hidden" name="photo" value="${dto.photo}">
							<div class="table">
								<div>
									<div align="center" style="font-weight: bold; font-size: 25px; border-bottom: 1px solid black;">
										<i class="bi bi-file-earmark-plus" style="padding: 0px;"></i> 세부정보수정
									</div>
								</div>
								
								<div>
									<div>
										<div class="px-2 pt-2 pb-0" style="float: left; margin-left: 70px; margin-right: 20px;">
											<div class="imageFile"></div>
											<div class="mt-3">
												<c:if test="${empty dto.photo}">
													<img src ="${pageContext.request.contextPath}/resources/images/person_photo.png" class="imgStyle">
												</c:if>
												<c:if test="${not empty dto.photo}">
													<img src="${pageContext.request.contextPath}/uploads/infoDetail/${dto.photo}" class="card-img-top imgStyle">
												</c:if>
											</div>
											<div class="mt-1">
											<span style="font-weight: bold; margin-top: 20px;">대표사진</span> <input type="file" name="photoFile" accept="image/*" class="form-control" style="width: 250px; height: 40px; border: 1px solid gray;"> 
											</div>
										</div>
									</div>
								</div>
							  </div>
								<div>
									<div>
										<div class="mt-0" style="font-weight: bold;">닉네임</div>
										<input type="text" name="nickName" value="${dto.nickName}" placeholder="닉네임">
									</div>
									<div>
										<div class="mt-1" style="font-weight: bold;">플러스 소개 </div>
											<textarea name="content" id="content" placeholder="소개" style="resize: none; width: 55%; height: 177px; border-radius: 8px;">${dto.content}</textarea>
									</div>
							    </div>
							<div>
								<div>
									<div class="mt-3 mb-1" align="right" style="margin-right: 20px; margin-top: 10px;">
										<button type="button" class="btn btn-success rere" onclick="sendOk();"> ${mode=="update"?"수정완료":"등록완료"}</button>
										<button type="button" class="btn btn-return" onclick="location.href='${pageContext.request.contextPath}/pluszone';">돌아가기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	  </form>
	</div>
</main>

<script type="text/javascript">
$(function(){
	var img = "${dto.photo}";

	if(img){
		img = "${pageContext.request.contextPath}/uploads/infoDetail/" + img;
		$(".imageFile").empty();
		$(".imageFile").css("background-image", "url("+img+")");
	}
	$(".imageFile").click(function(){
		$("input[name=photoFile]").trigger("click");
	});
	
	$("form[name=photoFile]").change(function(){
		let file = this.files[0];
		
		if(! file){
			$(".imageFile").empty();
			
			if(img){
				img = "${pageContext.request.contextPath}/uploads/infoDetail" + img;
			} else{
				img = "${pageContext.request.contextPath}/resources/images/person_photo.png";
			}
			$(".imageFile").css("background-image", "url("+img+")");
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".imageFile").empty();
			$(".imageFile").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL(file);
	});
});
</script>