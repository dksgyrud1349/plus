<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
   function toggleForms(currentFormIndex) {
       const forms = document.querySelectorAll('form');
   
       for (let i = 0; i < forms.length; i++) {
           forms[i].style.display = (i === currentFormIndex) ? 'block' : 'none';
       }
   }  

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
   
   function sendOk() {
	   let url = "${pageContext.request.contextPath}/onedayplus/question";
	   let query = $('form').serialize(); 
		
	   const fn = function(data){
		location.href = "${pageContext.request.contextPath}/onedayplus/result";
	   };
		
	   ajaxFun(url, 'post', query, 'json', fn);
	
   }
</script>


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
	    max-width: 800px;
	    padding: 20px;
	    background: #fff;
	    border-radius: 15px;
	    box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	    
	}
	
	.text-start {
	    margin-bottom: 20px;
	    text-align: center;
	}
	
	.checkbox-button {
	    background-color: transparent;
	    border: none;
	    cursor: pointer;
	    position: relative;
	    overflow: hidden;
	    margin-left: 30px;
	    
	}
	
	.checkbox-button img {
	    width: 120px;
	    height: 120px;
	    border-radius: 15px;
	}
	
	.hover-content {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: #47a3da;
	    color: white;
	    font-weight: bold;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    opacity: 0;
	    transition: opacity 0.3s ease;
	    border-radius: 15px;
	}
	
	.checkbox-button:hover .hover-content,
	.checkbox-container input[type="radio"]:checked + .checkbox-button .hover-content {
	    opacity: 1;
	}
	
	.checkbox-container {
	    display: inline-block;
	    margin: 5px;
	    padding: 10px;
	    border-radius: 5px;
	    cursor: pointer;
	    position: relative;
	    border: 2px solid transparent;
	}
	
	input[type="radio"] {
	    display: none;
	}
	
	.checkbox-container label {
	    display: block;
	    cursor: pointer;
	}
</style>
    
    <div class="body-container">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto">
                    <div class="body-title">
                        <h3><i class="bi bi-person-square"></i> 원데이 플러스 +  </h3>
                    </div>
                    
                    <div class="alert alert-info" role="alert">
                        <i class="bi bi-person-check-fill"></i> 원데이 플러스 + 만의 사용자 맞춤형 서비스를 이용해보세요.  
                    </div>
                    
                        
                    <div class="body-main">
                        <form name="memberForm1" method="post">
                            <div class="text-start">
                                <h3 style="text-align: center;">${qSubject[0].subject}</h3>
                                <hr style="color: #cccccc;">
                                
                    		<c:forEach var="dto" items="${list}" varStatus="status">
                    			<c:if test="${dto.num == 1}">
	                    			<label class="checkbox-container">
	                                    <input type="radio" value="${dto.plusNum}" name="plusNums">
	                                    <div class="checkbox-button">
	                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
	                                        <div class="hover-content">${dto.content}</div>
	                                    </div>
	                                </label>
                                </c:if>
                    		</c:forEach>
								
                            </div>
                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(1)">다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
                        </form>
                     

                        <form name="memberForm2" method="post" style="display: none;">
                           <div class="text-start">
                                <h3 style="text-align: center;">${qSubject[1].subject}</h3>
                                <hr style="color: #cccccc;">
                                
                    		<c:forEach var="dto" items="${list}" varStatus="status">
                    			<c:if test="${dto.num == 2}">
	                    			<label class="checkbox-container">
	                                    <input type="radio" value="${dto.plusNum}" name="plusNums">
	                                    <div class="checkbox-button">
	                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
	                                        <div class="hover-content">${dto.content}</div>
	                                    </div>
	                                </label>
                                </c:if>
                    		</c:forEach>
                                
                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="toggleForms(0)"> 이전 <i class="bi bi-x"></i></button>
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(2)"> 다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
                    
		                    </div>
                        </form>


                        <form name="memberForm3" method="post" style="display: none;">
                                <div class="text-start">
                                        <h3 style="text-align: center;">${qSubject[2].subject}</h3>
                                        <hr style="color: #cccccc;">
        
                                        <c:forEach var="dto" items="${list}" varStatus="status">
			                    			<c:if test="${dto.num == 3}">
				                    			<label class="checkbox-container">
				                                    <input type="radio" value="${dto.plusNum}" name="plusNums">
				                                    <div class="checkbox-button">
				                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
				                                        <div class="hover-content">${dto.content}</div>
				                                    </div>
				                                </label>
			                                </c:if>
			                    		</c:forEach>
                                        
                                        
                                    <div class="row">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary" onclick="toggleForms(1)"> 이전 <i class="bi bi-x"></i></button>
                                            <button type="button" class="btn btn-danger" onclick="toggleForms(3)"> 다음 <i class="bi bi-check2"></i></button>
                                        </div>
                                    </div>
                            
	                            </div>
                                </form>

                    <form name="memberForm4" method="post" style="display: none;">
                        <div class="text-start">
                            <h3 style="text-align: center;">${qSubject[3].subject}</h3>
                            <hr style="color: #cccccc;">

                            <c:forEach var="dto" items="${list}" varStatus="status">
                    			<c:if test="${dto.num == 4}">
	                    			<label class="checkbox-container">
	                                    <input type="radio" value="${dto.plusNum}" name="plusNums">
	                                    <div class="checkbox-button">
	                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
	                                        <div class="hover-content">${dto.content}</div>
	                                    </div>
	                                </label>
                                </c:if>
                    		</c:forEach>

                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="toggleForms(2)"> 이전 <i class="bi bi-x"></i></button>
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(4)"> 다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
	                    </div>
                     </form>

                <form name="memberForm5" method="post" style="display: none;">
                    <div class="text-start">
                        <h3 style="text-align: center;">${qSubject[4].subject}</h3>
                        <hr style="color: #cccccc;">

                        <c:forEach var="dto" items="${list}" varStatus="status">
                    			<c:if test="${dto.num == 5}">
	                    			<label class="checkbox-container">
	                                    <input type="radio" value="${dto.plusNum}" name="plusNums">
	                                    <div class="checkbox-button">
	                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
	                                        <div class="hover-content">${dto.content}</div>
	                                    </div>
	                                </label>
                                </c:if>
                    		</c:forEach>


                        <div class="row">
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" onclick="toggleForms(3)"> 이전 <i class="bi bi-x"></i></button>
                                <button type="button" class="btn btn-danger" onclick="sendOk();"> 완료 <i class="bi bi-check2"></i></button>
                            </div>
                        </div>
                	</div>
                 </form>
              </div>
             </div>
            </div>
            </div>
          