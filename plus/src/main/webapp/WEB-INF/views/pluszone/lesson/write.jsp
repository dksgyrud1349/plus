<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table-form tr>td {
	vertical-align: middle;
}

.table-form tr:first-child {
	border-top: 2px solid #212529;
}

.table-form tr>td:first-child {
	text-align: center;
}

.table-form tr>td:nth-child(2) {
	padding-left: 10px;
}

.table-form textarea {
	height: 170px;
	resize: none;
}

.table-form .option-minus, .table-form .option-minus2 {
	cursor: pointer;
}

.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-form .img-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.table-form .img-grid .item {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<script type="text/javascript">
	$(function() {
		let mode = "${mode}";
		if (mode === "write") {
			let special = "${special}";
			$("select[name=special]").val(special);

			$("#showClass0").prop("checked", true);
		}
	});
	
	function check() {
		const f = document.productForm;

		let str, b;
		let mode = "${mode}";


		if(! f.mainNum.value) {
			alert("메인카테고리를 선택하세요.");
			f.mainNum.focus();
			return false;
		}

		if(! f.subNum.value) {
			alert("서브카테고리를 선택하세요.");
			f.subNum.focus();
			return false;
		}
		
		if(! f.className.value.trim()) {
			alert("클래스명을 입력하세요.");
			f.className.focus();
			return false;
		}
		
		if(!/^(\d){1,8}$/.test(f.price.value)) {
			alert("클래스 가격을 입력하세요.");
			f.price.focus();
			return false;
		}
		
		if(! f.startDate.value){
			alert("수업 시작일을 입력하세요.");
			f.startDate.focus();
			return;
		}
		
		if(! f.endDate.value){
			alert("수업 종료일을 입력하세요.");
			f.endDate.focus();
			return;
		}
		if(f.startDate.value > f.endDate.value){
			alert("날짜를 올바르게 입력하세요.");
			f.endDate.focus();
			return;
		}
		
		var ch = document.querySelectorAll('input[type="checkbox"]:checked').length;
		if(ch == 0){
			alert("하나 이상 선택해주세요.");
			return;
		}
		
		if(! /^[0-9]+$/.test(f.classTime.value)){
			alert("숫자만 입력하세요.");
			f.classTime.focus();
			return;
		}
		
		if(! /^[0-9]+$/.test(f.count.value)){
			alert("숫자만 입력하세요.");
			f.count.focus();
			return;
		}
		
		if(!/^(\d){1,7}$/.test(f.mileage.value)) {
			alert("적립금을 입력 하세요.");
			f.mileage.focus();
			return false;
		}
		
		str = f.content.value.trim();
		if(!str || str === "<p><br></p>"){
			alert("클래스 설명을 입력하세요.");
			f.content.focus();
			return false;
		}
		
		if(mode === "write" && !f.firstPhotoFile.value){
			alert("대표 이미지를 등록하세요.");
			f.firstPhotoFile.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/lessonPlus/${mode}";
		return true;

	}

</script>
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
	$("form select[name=mainNum]").change(function(){
		let mainNum = $(this).val();
		
		$("form select[name=subNum]").find('option').remove().end()
			.append("<option value=''>서브 카테고리</option>");	
		
		if(! mainNum) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/lesson/listSubCategory";
		let query = "mainNum="+mainNum;
		
		const fn = function(data) {
			$.each(data.listSubCategory, function(index, item){
				let subNum = item.subNum;
				let subName = item.subName;
				let s = "<option value='"+subNum+"'>"+subName+"</option>";
				$("form select[name=subNum]").append(s);
			});
		};
		ajaxFun(url, "get", query, "json", fn);
		
	});
});

$(function(){
	$('input[name=startDate]').change(function(){
		let startDate = $(this).val();
		
		$('input[name="endDate"]').change(function(){
			let endDate = $(this).val();
			
			if(startDate > endDate){
				alert("날짜를 잘못 입력하셨습니다.");
				$(this).val("");
				return false;
			}
			
		});
	})
});
</script>

<main class="wrapper" style="margin: 0 auto; width: 100%;">
	<div id="layoutSidenav_content" style="background: #F8F8FF;">
		<div class="container-fluid px-5">
			<div class="body-container" style="width: 80%; margin: 5% auto;">
				<div class="body-main">
					<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
						<i class="bi bi-app"></i> 클래스 등록
					</h3>
				</div>

					<form name="productForm" method="post" enctype="multipart/form-data">
						<table class="table mt-5 table-form">
							<tr>
								<td class="table-light col-sm-2">카테고리</td>
								<td style="display: flex;">
									<div class="row">
										<div class="col-6 ps-3" style="flex: 1;">
											<select name="mainNum" class="form-select">
												<option value="">:: 메인 카테고리 선택 ::</option>
												<c:forEach var="vo" items="${listMainCategory}">
													<option value="${vo.mainNum}" ${mainNum == vo.mainNum ? "selected" : ""}>${vo.mainName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-6 ps-3" style="flex: 1;">
											<select name="subNum" class="form-select">
												<option value="">:: 서브 카테고리 선택 ::</option>
												<c:forEach var="vo" items="${listSubCategory}">
													<option value="${vo.subNum}" ${dto.subNum == vo.subNum ? "selected" : ""}>${vo.subName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-6 ps-3" style="flex: 1;">
											<select name="tagNum" class="form-select">
												<option value="">:: 해시태그 선택 ::</option>
												<c:forEach var="vo" items="${listHashTag}">
													<option value="${vo.tagNum}" ${dto.tagNum == vo.tagNum ? "selected" : ""}>${vo.tagName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">클래스명</td>
								<td>
									<input type="text" name="className" class="form-control" value="${dto.className}">
								</td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">클래스가격</td>
								<td>
									<input type="text" name="price" class="form-control" value="${dto.price}">
								</td>
							</tr>
							<c:if test="${mode == 'write'}">
								<tr>
									<td class="table-light col-sm-2">시작일</td>
									<td>
										<input type="date" name="startDate" class="form-control" value="${dto.startDate}">
									</td>
								</tr>
								<tr>
									<td class="table-light col-sm-2">종료일</td>
									<td>
										<input type="date" name="endDate" class="form-control" value="${dto.endDate}">
									</td>
								</tr>
								<tr>
									<td class="table-light col-sm-2">시간 선택</td>
									<td>
										<div class="pt-2 pb-2">
											<input type="checkbox" name="startTime1" class="form-check-input" id="startTime1" value="12:00">
											<label class="form-check-label" for="startTime1">12:00</label> &nbsp;&nbsp;
											<input type="checkbox" name="startTime2" class="form-check-input" id="startTime2" value="14:00">
											<label class="form-check-label" for="startTime2">14:00</label> &nbsp;&nbsp;
											<input type="checkbox" name="startTime3" class="form-check-input" id="startTime3" value="16:00">
											<label class="form-check-label" for="startTime3">16:00</label> &nbsp;&nbsp;
											<input type="checkbox" name="startTime4" class="form-check-input" id="startTime4" value="18:00">
											<label class="form-check-label" for="startTime4">18:00</label>
										</div>
									</td>
								</tr>
							</c:if>
							<c:if test="${mode == 'update'}"> <!-- 시작일, 종료일, 시간 선택 -->
								<c:forEach var="vo" items="${listDetail}" varStatus="status">
									<tr>
										<td class="table-light col-sm-2">상세</td>
										<td>
											<input type="text" name="classDate" class="form-control" style="width: 300px; float: left;" value="${vo.classDate}" readonly> &nbsp;&nbsp; <input type="number" name="count" class="form-control" style="width: 300px; float: left;" value="${vo.count}">
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td class="table-light col-sm-2">수업시간</td>
								<td>
									<input type="text" name="classTime" class="form-control" value="${dto.classTime}">
									<small class="form-control-plaintext help-block">수업시간이 1인 경우 1시간 수업임을 의미합니다..</small>
								</td>
							</tr>
							<c:if test="${mode == 'write'}">
								<tr>
									<td class="table-light col-sm-2">인원수</td>
									<td>
										<input type="text" name="count" class="form-control" value="${dto.count}">
										<small class="form-control-plaintext help-block">인원수가 1인 경우 시간당 참여할 수 있는 인원수가 1명임을 의미합니다..</small>
									</td>
								</tr>
							</c:if>
							<tr>
								<td class="table-light col-sm-2">상세 설명</td>
								<td>
									<textarea name="dContent" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.dContent}</textarea>
								</td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">우편번호(수업장소)</td>
								<td>
									<input type="text" name="zip" id="zip" class="form-control radi" style="margin-right: 20px; width: 300px; display: inline;" placeholder="우편번호" value="${dto.zip}" readonly>
									<button class="btn btn-light" type="button" style="margin-left: 3px; display: inline;" onclick="daumPostcode();">우편번호 검색</button>
								</td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">주소(수업장소)</td>
								<td style="display: flex;">
									<div style="flex: 1; margin-top: 5px; margin-right: 3px;">
										<input type="text" name="addr1" id="addr1" class="form-control radi" placeholder="기본 주소" value="${dto.addr1}" readonly>
									</div>
									<div style="margin-top: 5px; flex: 1;">
										<input type="text" name="addr2" id="addr2" class="form-control radi" placeholder="상세 주소" value="${dto.addr2}">
									</div>
								</td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">적립금</td>
								<td><input type="text" name="mileage" class="form-control"
									value="${dto.mileage}"></td>
							</tr>
							<tr>
								<td class="table-light col-sm-2">공개 여부</td>
								<td>
									<div class="pt-2 pb-2">
										<input type="radio" name="showClass" class="form-check-input" id="showClass0" value="0" ${dto.showClass == 0 ? "checked='checked'" : "" }>
										<label class="form-check-label" for="showClass0">클래스 공개</label> &nbsp;&nbsp;
										<input type="radio" name="showClass" class="form-check-input" id="showClass1" value="1" ${dto.showClass == 1 ? "checked='checked'" : "" }>
										<label class="form-check-label" for="showClass1">클래스 비공개</label>
									</div>
								</td>
							</tr>

							<tr>
								<td class="table-light col-sm-2">클래스 설명</td>
								<td>
									<textarea name="content" id="ir2" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
								</td>
							</tr>

							<tr>
								<td class="table-light col-sm-2">대표이미지</td>
								<td>
									<div class="thumbnail-viewer"></div>
									<input type="file" name="firstPhotoFile" accept="image/*" class="form-control" style="display: none;">
								</td>
							</tr>

							<tr>
								<td class="table-light col-sm-2">추가이미지</td>
								<td>
									<div class="img-grid">
										<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
										<c:forEach var="vo" items="${listPhoto}">
											<img src="${pageContext.request.contextPath}/uploads/lesson/${vo.photoName}" class="item delete-img" data-fileNum="${vo.photoNum}" data-filename="${vo.photoName}">
										</c:forEach>
									</div>
									<input type="file" name="photos" accept="image/*" multiple class="form-control" style="display: none;">
								</td>
							</tr>

						</table>

						<table class="table table-borderless">
							<tr>
								<td class="text-center">
									<c:url var="url" value="/lessonPlus/main">
										<c:if test="${not empty page}">
											<c:param name="page" value="${page}"/>
										</c:if>
									</c:url>
									<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
									<button type="reset" class="btn btn-light">다시입력</button>
									<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
									<c:if test="${mode == 'update'}">
										<button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/lessonPlus/delete?classNum=${dto.classNum}';">삭제하기</button>
									</c:if>
									<c:if test="${mode=='update'}">
										<input type="hidden" name="classNum" value="${dto.classNum}">
										<input type="hidden" name="firstPhoto" value="${dto.firstPhoto}">
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
</main>
<script type="text/javascript">
$(function(){
	var img = "${dto.firstPhoto}";
	if(img){
		img = "${pageContext.request.contextPath}/uploads/lesson/" + img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=firstPhotoFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=firstPhotoFile]").change(function(){
		let file = this.files[0];
		if(! file){
			$(".table-form .thumbnail-viewer").empty();
			
			if(img){
				img = "${pageContext.request.contextPath}/uploads/lesson" + img;
			} else{
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			return false;
		}
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제하시겠습니까?")){
			return false;
		}
		let $img = $(this);
		let photoNum = $img.attr("data-fileNum");
		let photoName = $img.attr("data-filename");
		let url = "${pageContext.request.contextPath}/lesson/deleteImg";
		$.post(url, {photoNum:photoNum, photoName:photoName}, function(data){
			$img.remove();
		}, "json");
	});
});

$(function(){
	var sel_files = [];
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=photos]").trigger("click");
	});
	
	$("form[name=productForm] input[name=photos]").change(function(){
		if(! this.files){
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.photos.files = dt.files;
			
			return false;
		}
		for(let file of this.files) {
        	sel_files.push(file);
        	
            const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
            reader.onload = e => {
            	$img.attr("src", e.target.result);
            };
			reader.readAsDataURL(file);
            
            $(".img-grid").append($img);
        }
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.photos.files = dt.files;
	});
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 사진을 삭제하시겠습니까?")) {
			return false;
		}
		
		let photoName = $(this).attr("data-filename");
		
		for(let i = 0; i < sel_files.length; i++) {
			if(photoName === sel_files[i].name) {
				console.log(photoName);
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.photos.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir2",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 oEditors.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);
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
	oEditors.getById["ir2"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress; // 사용자가 지번 주소를 선택했을 경우(J)
				}
				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if(data.userSelectedType === 'R'){
					//법정동명이 있을 경우 추가한다.
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
			}
        }).open();
    }
</script>