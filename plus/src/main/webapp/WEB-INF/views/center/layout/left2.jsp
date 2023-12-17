<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.sidebar {
	  width: 200px;
	  height: 100%;
	  position: fixed;
	  top: 0;
	  left: 0;
	  background-color: #333; 
	  padding-top: 15px;
	}
	
	.sidebar a {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  height: 50px; /* Adjust the height as needed */
	  text-decoration: none;
	  font-size: 18px;
	  color: #fff;
	  transition: background-color 0.3s; 
	}
	
	.sidebar a:hover {
	  background-color: #555; 
	}
	
	.sidebar a.active {
	  background-color: #4CAF50; 
	  color: #fff; 
	}
	
	.sidebar a.disabled {
	  color: #888; 
	  pointer-events: none; 
	  cursor: not-allowed; 
	}
</style>

<div class="sidebar">
	<a href="#" style="border:3px solid #fff; margin-bottom:10px">고객센터</a>
  	<a href="${pageContext.request.contextPath}/faq/list" class="active">자주 묻는 질문(FAQ)</a>
  	<a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
  	<a href="#">채팅(1대1문의)</a>
  	<a href="#">신고하기</a>
  	<a href="#">제안하기</a>
  	<a href="#">문의하기</a>
  	<a href="#" class="disabled">연락처/위치 안내</a>
</div>





