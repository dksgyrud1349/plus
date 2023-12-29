<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        				
    <style>
            body {
                min-height: 100vh;
            }

            .body-container {
                max-width: 900px;
                margin-top: 5%;
                margin-bottom: 0;
                margin-left: auto;
                margin-right: auto;
            }

            .input-form {
                max-width: 840px;
                padding: 25px;
                background: #fff;
                border-radius: 15px;
                box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            }
            .terms{
            	float: right; 
            	font-size:12.5px; 
            	color:#a0a0a0; 
            }
            .radi{
            	border-radius: 100px;
            }
           
    </style>
    
    <script type="text/javascript">
	function memberOk() {
		const f = document.memberForm;
		let str;
		
		str = f.userId.value;
		if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
			alert("아이디를 다시 입력 하세요. ");
			f.userId.focus();
			return;
		}
	
		let mode = "${mode}";
		if(mode === "member" && f.userIdValid.value === "false") {
			str = "아이디 중복 검사가 실행되지 않았습니다.";
			$("#userId").parent().find(".help-block").html(str);
			f.userId.focus();
			return;
		}
		
		str = f.userPwd.value;
		if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
			alert("패스워드를 다시 입력 하세요. ");
			f.userPwd.focus();
			return;
		}
	
		if( str !== f.userPwd2.value ) {
	        alert("패스워드가 일치하지 않습니다. ");
	        f.userPwd.focus();
	        return;
		}
		
	    str = f.userName.value;
	    if( !/^[가-힣]{2,5}$/.test(str) ) {
	        alert("이름을 다시 입력하세요. ");
	        f.userName.focus();
	        return;
	    }
	
	    str = f.birth.value;
	    if( !str ) {
	        alert("생년월일를 입력하세요. ");
	        f.birth.focus();
	        return;
	    }
	    
	    str = f.tel1.value;
	    if( !str ) {
	        alert("전화번호를 입력하세요. ");
	        f.tel1.focus();
	        return;
	    }
	
	    str = f.tel2.value;
	    if( !/^\d{3,4}$/.test(str) ) {
	        alert("숫자만 가능합니다. ");
	        f.tel2.focus();
	        return;
	    }
	
	    str = f.tel3.value;
	    if( !/^\d{4}$/.test(str) ) {
	    	alert("숫자만 가능합니다. ");
	        f.tel3.focus();
	        return;
	    }
	    
	    str = f.email1.value.trim();
	    if( !str ) {
	        alert("이메일을 입력하세요. ");
	        f.email1.focus();
	        return;
	    }
	
	    str = f.email2.value.trim();
	    if( !str ) {
	        alert("이메일을 입력하세요. ");
	        f.email2.focus();
	        return;
	    }
	    
	   	f.action = "${pageContext.request.contextPath}/member/${mode}";
	    f.submit();
		
	}
	function changeEmail() {
	    const f = document.memberForm;
		    
	    let str = f.selectEmail.value;
	    if(str !== "direct") {
	        f.email2.value = str; 
	        f.email2.readOnly = true;
	        f.email1.focus(); 
	    }
	    else {
	        f.email2.value = "";
	        f.email2.readOnly = false;
	        f.email1.focus();
	    }
	}
	
	function userIdCheck() {
		// 아이디 중복 검사
		let userId = $('#userId').val();

		if(!/^[a-z][a-z0-9_]{4,9}$/i.test(userId)) { 
			let str = '아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.';
			$('#userId').focus();
			$('.userId-box').find('.help-block').html(str);
			return;
		}
		
		let url = '${pageContext.request.contextPath}/member/userIdCheck';

		// AJAX:POST-JSON
		$.post(url, {userId:userId}, function(data){
			let passed = data.passed;

			if(passed === 'true') {
				let str = '<span style="color:blue; font-weight: bold;">' + userId + '</span> 아이디는 사용가능 합니다.';
				$('.userId-box').find('.help-block').html(str);
				$('#userIdValid').val('true');
			} else {
				let str = '<span style="color:red; font-weight: bold;">' + userId + '</span> 아이디는 사용할수 없습니다.';
				$('.userId-box').find('.help-block').html(str);
				$('#userId').val('');
				$('#userIdValid').val('false');
				$('#userId').focus();
			}
		}, 'json');
	}
</script>

</head>

    <body id="page-top">
		
        
       

        <div class="body-container">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto">                                    
                
                    <div class="body-title">
                        <h3 class="text-center"><i class="bi bi-person-square"></i> ${mode=="member"?"회원가입":"정보수정"} </h3>
                    </div>
                
                    <hr>
                    <div class="body-main">
            
                        <form name="memberForm" method="post">
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label" for="userId"><span class="text-danger">*</span>&nbsp;아이디</label>
								<div class="col-sm-10 userId-box">
									<div class="row">
										<div class="col-5 pe-1">
											<input type="text" name="userId" id="userId" class="form-control radi" value="${dto.userId}" 
													${mode=="update" ? "readonly ":""}
													placeholder="아이디">
										</div>
										<div class="col-3 ps-1">
											<c:if test="${mode=='member'}">
												<button type="button" class="btn btn-light" onclick="userIdCheck();">아이디중복검사</button>
											</c:if>
										</div>
									</div>
									<c:if test="${mode=='member'}">
									<div class="mt-1 help-block" style="font-size:11px; color:#a0a0a0">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</div>
									</c:if>
								</div>
							</div>
                         
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="userPwd"><span class="text-danger">*</span>&nbsp;패스워드</label>
                                <div class="col-sm-10">
                                    <input type="password" name="userPwd" id="userPwd" class="form-control radi" autocomplete="off" placeholder="패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.">
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="userPwd2"><span class="text-danger">*</span>&nbsp;패스워드 확인</label>
                                <div class="col-sm-10">
                                    <input type="password" name="userPwd2" id="userPwd2" class="form-control radi" autocomplete="off" placeholder="패스워드 확인">
                                </div>
                            </div>
                         
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="userName"><span class="text-danger">*</span>&nbsp;이름</label>
                                <div class="col-sm-10">
                                    <input type="text" name="userName" id="userName" class="form-control radi" value="${dto.userName}" 
			            		${mode=="update" ? "readonly ":""}
			            		placeholder="이름">
                                </div>
                            </div>
                         
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="birth"><span class="text-danger">*</span>&nbsp;생년월일</label>
                                <div class="col-sm-10">
                                    <input type="date" name="birth" id="birth" class="form-control radi"  placeholder="생년월일">
                                </div>
                            </div>
                        
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="selectEmail"><span class="text-danger">*</span>&nbsp;이메일</label>
                                <div class="col-sm-10 row">
                                    <div class="col-3 pe-0">
                                        <select name="selectEmail" id="selectEmail" class="form-select radi" onchange="changeEmail();">
                                            <option value="">선 택</option>
                                            <option value="naver.com" ${dto.email2=="naver.com" ? "selected" : ""}>네이버 메일</option>
                                            <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected" : ""}>지 메일</option>
                                            <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected" : ""}>한 메일</option>
                                            <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected" : ""}>핫 메일</option>
                                            <option value="direct">직접입력</option>
                                        </select>
                                    </div>
                                    
                                    <div class="col input-group">
                                        <input type="text" name="email1" class="form-control radi" maxlength="30" value="${dto.email1}" style="border-radius: 20px;">
                                        <span class="input-group-text p-1" style="border: none; background: none;">@</span>
                                        <input type="text" name="email2" class="form-control radi" maxlength="30" value="${dto.email2}"  style="border-radius: 20px;" readonly>
                                    </div>		
                
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="tel1"><span class="text-danger">*</span>&nbsp;전화번호</label>
                                <div class="col-sm-10 row">
                                    <div class="col-sm-3 pe-1">
                                        <input type="text" name="tel1" id="tel1" class="form-control radi" value="${dto.tel1}" maxlength="3">
                                    </div>
                                    <div class="col-sm-1 px-1" style="width: 2%;">
                                        <p class="form-control-plaintext text-center">-</p>
                                    </div>
                                    <div class="col-sm-3 px-1">
                                        <input type="text" name="tel2" id="tel2" class="form-control radi" value="${dto.tel2}" maxlength="4">
                                    </div>
                                    <div class="col-sm-1 px-1" style="width: 2%;">
                                        <p class="form-control-plaintext text-center">-</p>
                                    </div>
                                    <div class="col-sm-3 ps-1">
                                        <input type="text" name="tel3" id="tel3" class="form-control radi" value="${dto.tel3}" maxlength="4">
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="zip">&nbsp;&nbsp;우편번호</label>
                                <div class="col-sm-5">
                                       <div class="input-group">
                                           	<input type="text" name="zip" id="zip" class="form-control radi" style="margin-right: 20px; border-radius: 20px;" placeholder="우편번호" value="${dto.zip}" readonly>
                                       		<button class="btn btn-light" type="button" style="margin-left: 3px;" onclick="daumPostcode();">우편번호 검색</button>
                                       </div>
                                </div>
                            </div>
                    
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="addr1">&nbsp;&nbsp;주소</label>
                                <div class="col-sm-10">
                                       <div>
                                           <input type="text" name="addr1" id="addr1" class="form-control radi" placeholder="기본 주소" value="${dto.addr1}" readonly>
                                       </div>
                                       <div style="margin-top: 5px;">
                                           <input type="text" name="addr2" id="addr2" class="form-control radi" placeholder="상세 주소" value="${dto.addr2}">
                                    </div>
                                </div>
                            </div>
                    
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="agree"><span class="text-danger">*</span>&nbsp;약관 동의</label>
                                <div class="col-sm-9" style="padding-top: 5px;">
                                    <input type="checkbox" id="agree" name="agree"
                                        class="form-check-input"
                                        checked
                                        style="margin-left: 0;"
                                        onchange="form.sendButton.disabled = !checked">
                                    <label class="form-check-label mb-1">
                                        &nbsp;<span class="text-danger">[필수]&nbsp;&nbsp;</span>만 14세 이상이며 모두 동의합니다.
                                    </label>
	                                <div>   
	                                    <input type="checkbox" id="agree" name="agree"
	                                        class="form-check-input"
	                                        checked
	                                        style="margin-left: 0;"
	                                        onchange="form.sendButton.disabled = !checked">
	                                    <label class="form-check-label mb-1">
	                                        &nbsp;<span class="text-danger">[필수]</span>&nbsp;
                                        <a href="#" class="text-decoration-none text-danger" style="color: red;">개인정보 수집 및 이용</a>에 동의합니다.
	                                    </label>
	                                </div>
	                                <div>   
	                                    <input type="checkbox" id="agree" name="agree"
	                                        class="form-check-input"
	                                        style="margin-left: 0;">
	                                    <label class="form-check-label mb-1">
	                                        &nbsp;[선택]&nbsp; 광고성 정보 수신에 모두 동의합니다.
	                                    </label>
	                                </div>
	                                
                                </div>
                            </div>
                             <hr>
                            <div class="row">
                                <div class="text-center">
                                    <button type="button" name="sendButton" class="btn btn-white btn-outline-success" onclick="memberOk();"> ${mode=="update" ? "정보수정":"회원가입"} <i class="bi bi-check2"></i></button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-white btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/';"> ${mode=="update" ? "수정취소":"가입취소"} <i class="bi bi-x"></i></button>
                                    <input type="hidden" name="userIdValid" id="userIdValid" value="false">
                                </div>
                            </div>
                    
                        </form>
            
                    </div>
                </div>
            </div>
        </div>

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
            
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                fullAddr = data.jibunAddress;
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

        
    </body>
</html>