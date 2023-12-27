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
	.box{
		width: 200px;
		height: 50px;
		color: white;
		background-color: #333;
		border: none; 
		font-weight: bold;
		font-size: 18px;
	}
	.inBox{
		color: black;
		width: 200px;
		height: 50px;
		font-weight: bold;
	}
</style>

<div class="sidebar dropdown">
	<a style="border:3px solid #fff; margin-bottom:10px; margin-right: 1px; color: white;">고객센터</a>
  	<a href="${pageContext.request.contextPath}/faq/main">자주 묻는 질문(FAQ)</a>
  	<a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
  	<button class="btn btn-secondary dropdown-toggle box" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
    	신고/제안/문의
  	</button>
  		<ul class="dropdown-menu dropdown-menu-dark inBox" aria-labelledby="dropdownMenuButton2" style="background-color: #333">
    		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/declaration/article" style="background-color: #333">신고하기</a></li>
    		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/proposal/list">제안하기</a></li>
    		<li><a class="dropdown-item" href="${pageContext.request.contextPath}/inquiry/list">문의하기</a></li>
  		</ul>
  	<a href="${pageContext.request.contextPath}/etc/list">연락처/위치 안내</a>
</div>





