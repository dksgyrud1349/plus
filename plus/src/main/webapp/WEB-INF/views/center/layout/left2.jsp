<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="list-group btn-group">
  <a href="${pageContext.request.contextPath}/faq/list" class="list-group-item list-group-item-action active" aria-current="true">
    자주 묻는 질문(FAQ)
  </a>
  <a href="${pageContext.request.contextPath}/notice/list" class="list-group-item list-group-item-action">공지사항</a>
  <a href="#" class="list-group-item list-group-item-action">채팅(1대1문의)</a>
  <button class="btn btn-secondary dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
    신고/제안/문의
  </button>
  <ul class="dropdown-menu" aria-labelledby="defaultDropdown">
    <li><a class="dropdown-item" href="#">신고하기</a></li>
    <li><a class="dropdown-item" href="#">제안하기</a></li>
    <li><a class="dropdown-item" href="#">문의하기</a></li>
  </ul>
  <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">연락처/위치 안내</a>
</div>





