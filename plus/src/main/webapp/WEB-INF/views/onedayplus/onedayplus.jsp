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
	.checkbox-container input[type="checkbox"]:checked + .checkbox-button .hover-content {
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
	
	input[type="checkbox"] {
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
                                <h3 style="text-align: center;">어떤 목적의 원데이 클레스를 추천 받으시겠습니까?</h3>
                                <hr style="color: #cccccc;">
                    
								
                                <label class="checkbox-container">
                                    <input type="checkbox" id="hobby" value="hobby" name="hobby">
                                    <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="Hobby">
                                        <div class="hover-content">취미</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="experience" value="experience" name="experience">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="experience">
                                        <div class="hover-content">새로운 경험</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="date" value="date" name="date">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="date">
                                        <div class="hover-content">데이트</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="present" value="present" name="present">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="present">
                                        <div class="hover-content">선물</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="stress" value="stress" name="stress">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="stress">
                                        <div class="hover-content">스트레스 해소</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="exercise" value="exercise" name="exercise">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="exercise">
                                        <div class="hover-content">운동/건강</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="beauty" value="beauty" name="beauty">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="beauty">
                                        <div class="hover-content">뷰티</div>
                                    </div>
                                </label>

                                <label class="checkbox-container">
                                    <input type="checkbox" id="study" value="study" name="study">
                                   <div class="checkbox-button">
                                        <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="study">
                                        <div class="hover-content">학업</div>
                                    </div>
                                </label>
                            </div>
                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(1)">다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
                        </form>
                     

                        <form name="memberForm2" method="post" style="display: none;">
                            <div class="text-start">
                                <h3 style="text-align: center;">어떤 카테고리의 원데이 클레스를 추천 받으시겠습니까?</h3>
                                <hr style="color: #cccccc;">

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">핸드메이드</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">드로잉</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">음악</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">쿠킹</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">공예</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">미용</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">스포츠</div>
                                        </div>
                                    </label>

                                    <label class="checkbox-container">
                                        <input type="checkbox" id="name" value="name" name="name">
                                    <div class="checkbox-button">
                                            <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                            <div class="hover-content">상관없음</div>
                                        </div>
                                    </label>
                                
                                    
                            
                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="toggleForms(0)"> 이전 <i class="bi bi-x"></i></button>
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(2)"> 다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
                    
                        </form>
                    </div>


                        <form name="memberForm3" method="post" style="display: none;">
                                <div class="text-start">
                                        <h3 style="text-align: center;">어느 지역의 원데이 클레스를 추천 받으시겠습니까 ?</h3>
                                        <hr style="color: #cccccc;">
        
                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                            <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">서울</div>
                                            </div>
                                        </label>
                                        
                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                            <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">경기도</div>
                                            </div>
                                        </label>
                                        
                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">인천</div>
                                            </div>
                                        </label>

                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">강원도</div>
                                            </div>
                                        </label>

                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">충청도</div>
                                            </div>
                                        </label>

                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">경상도</div>
                                            </div>
                                        </label>

                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">전라도</div>
                                            </div>
                                        </label>

                                        <label class="checkbox-container">
                                            <input type="checkbox" id="name" value="name" name="name">
                                        <div class="checkbox-button">
                                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                                <div class="hover-content">제주도</div>
                                            </div>
                                        </label>

                                    <div class="row">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary" onclick="toggleForms(1)"> 이전 <i class="bi bi-x"></i></button>
                                            <button type="button" class="btn btn-danger" onclick="toggleForms(3)"> 다음 <i class="bi bi-check2"></i></button>
                                        </div>
                                    </div>
                            
                                </form>
                            </div>

                    <form name="memberForm4" method="post" style="display: none;">
                        <div class="text-start">
                            <h3 style="text-align: center;">어느 가격대의 원데이 클레스를 추천 받으시겠습니까 ?</h3>
                            <hr style="color: #cccccc;">

                            <label class="checkbox-container">
                                <input type="checkbox" id="name" value="name" name="name">
                                <div class="checkbox-button">
                                    <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                    <div class="hover-content">상관없음</div>
                                </div>
                            </label>

                            <label class="checkbox-container">
                                <input type="checkbox" id="name" value="name" name="name">
                                <div class="checkbox-button">
                                    <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                    <div class="hover-content">1만원 ~ 5만원</div>
                                </div>
                            </label>

                            <label class="checkbox-container">
                                <input type="checkbox" id="name" value="name" name="name">
                                <div class="checkbox-button">
                                    <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                    <div class="hover-content">5만원 ~ 10만원</div>
                                </div>
                            </label>

                            <label class="checkbox-container">
                                <input type="checkbox" id="name" value="name" name="name">
                                <div class="checkbox-button">
                                    <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                    <div class="hover-content">10만원 이상</div>
                                </div>
                            </label>

                            <div class="row">
                                <div class="text-center">
                                    <button type="button" class="btn btn-primary" onclick="toggleForms(2)"> 이전 <i class="bi bi-x"></i></button>
                                    <button type="button" class="btn btn-danger" onclick="toggleForms(4)"> 다음 <i class="bi bi-check2"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>

                <form name="memberForm5" method="post" style="display: none;">
                    <div class="text-start">
                        <h3 style="text-align: center;">어느 나이대의 원데이 클레스를 추천 받으시겠습니까 ?</h3>
                        <hr style="color: #cccccc;">

                        <label class="checkbox-container">
                            <input type="checkbox" id="name" value="name" name="name">
                            <div class="checkbox-button">
                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                <div class="hover-content">상관없음</div>
                            </div>
                        </label>
                        
                        <label class="checkbox-container">
                            <input type="checkbox" id="name" value="name" name="name">
                            <div class="checkbox-button">
                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                <div class="hover-content">10대 / 20대</div>
                            </div>
                        </label>

                        <label class="checkbox-container">
                            <input type="checkbox" id="name" value="name" name="name">
                            <div class="checkbox-button">
                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                <div class="hover-content">30대 / 40대</div>
                            </div>
                        </label>

                        <label class="checkbox-container">
                            <input type="checkbox" id="name" value="name" name="name">
                            <div class="checkbox-button">
                                <img src="${pageContext.request.contextPath}/resources/images/keyimage3.jpg" alt="name">
                                <div class="hover-content">50대 이상</div>
                            </div>
                        </label>


                        <div class="row">
                            <div class="text-center">
                                <button type="button" class="btn btn-primary" onclick="toggleForms(3)"> 이전 <i class="bi bi-x"></i></button>
                                <button type="button" class="btn btn-danger" onclick="toggleForms(5)"> 완료 <i class="bi bi-check2"></i></button>
                            </div>
                        </div>
                    </form>
                </div>