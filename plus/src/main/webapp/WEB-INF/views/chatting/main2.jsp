<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
<style type="text/css">
.scrollbar-none::-webkit-scrollbar { display: none; }
.scrollbar-none { scrollbar-width: none; overflow: hidden; }

.chatting-container {
	position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9900; }

.chatting-wrap {
	display: flex;
	background-color: rgba(213, 213, 213, 0.2);
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 15px;
}

.chatting-wrap .chatting-content {
	width: 400px;
	height: 550px;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	box-shadow: 3px 5px 5px 1px rgba(0,0,0,.2);
}

.chatting-content .chatting-header {
	display: flex;
	width: 100%;
	padding: 7px 10px;
	border-bottom: 1px solid #c6c7c8;
	align-items: center;
	justify-content: space-between;
	background-color: #f8f9fa;
}
.chatting-header .chatting-title {
	font-size: 16px;
	padding: 10px 7px;
	font-weight: 600;
}

.message-main { background: #fefefe; padding: 0; }

.message-main .message-header {
	display: flex;
	width: 100%;
	padding: 7px 10px;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid #c6c7c8;
}

.message-main .message-header-left { display: flex; align-items: center; font-weight: 500; font-size: 12px; width: 83%; color:#0d58ba; }

.message-main .message-body {
	overflow-y: scroll;
	height: 385px;
	border-bottom: 1px solid #c6c7c8;
}

.message-body .message-body-list {
	display: flex;
	flex-direction:column;
}

.message-body .message-user {
	/* color: #0d6efd;
	font-weight: 700; */
	font-size: 12px;
	margin-left: 3px;
	margin-bottom: 1px;
}

.message-body .message-body-date {
    font-size: 10px; 
    border: 1px solid #c6c7c8;
    background-color: #e8ffff;
    border-radius: 10px;
    padding: 3px 7px;
    margin: 5px auto;
}
.message-body .message-time { font-size: 9px; color: #999999; }
.message-body .message-unread { font-size: 9px; color: #507cd1; font-weight: 600; }
.message-body .message-body-left { margin-right: auto; margin-left: 8px; margin-bottom: 7px; }
.message-body .message-body-right { margin-left: auto; margin-right: 3px; margin-bottom: 7px; }
.message-body .message-content { display: flex; align-items: flex-end; }
.message-body .content-left { padding-left: 20px; }
.message-body .message-info { display: flex; flex-direction:column; padding: 3px 5px; align-items: flex-end;}
.message-body .message {
	max-width: 280px;
	line-height: 1.5;
	font-size: 13px;
    padding: 0.35em 0.65em;
    border: 1px solid #cccccc;
    color: #333333;
    white-space: pre-wrap;
    vertical-align: baseline;
    border-radius: 0.25rem;
}
.message-body .message-right { background-color: #ffffd7; }

.message-main .message-footer {
	display: flex;
	width: 100%;
	padding: 0;
	align-items: center;
	justify-content: space-between;
}

.message-main .message-footer-right { display: flex; width: 100%; border-left: 1px solid #c6c7c8; }
.message-footer textarea { width: 355px; resize: none; height: 45px; padding: 5px; border: none; }
.message-footer textarea:focus{ outline: none; }

.btn-chatting {
	color: #333;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

.btn-icon { border: 1px solid #f8f9fa; background-color: #f6f6f6; }
.btn-icon:hover, .btn-icon:active, .btn-icon:focus { border: 1px solid #adadad; }

.btn-body { border: 1px solid #ffffff; background-color: #ffffff; padding: 5px 5px; }
.btn-body:hover, .btn-body:active, .btn-body:focus { font-weight: 600; color: #0d58ba; }
.btn-dots { padding-left: 3px; padding-right: 3px; }

.btn-footer { border: none; border-right: 1px solid #c6c7c8; background-color: #f8f9fa; padding: 5px 20px; border-radius: 0; }
.btn-footer:hover, .btn-footer:active, .btn-footer:focus { font-weight: 600; }
.btn-footer[disabled] { pointer-events: none; cursor: default; opacity: .65; }

.btn-msg { border: 1px solid #fefefe; background-color: #fefefe; padding: 5px 5px; }
.btn-msg:hover, .btn-msg:active, .btn-msg:focus { font-weight: 600; color: #f28011; }

.btn-msg-send { border: 1px solid #ffffff; background-color: #ffffff; padding: 13px 13px; border-radius: 0; }
.btn-msg-send:hover, .btn-msg-send:active, .btn-msg-send:focus { font-weight: 600; color: #0d58ba; }

.font-11 { font-size: 11px; }
.font-9 { font-size: 9px; }
.bold { font-weight: 600; }

.friend-room, .chatting-room { cursor: pointer; }
.friend-room:hover, .chatting-room:hover { color: #0d58ba; }

</style>

<div class="container-fluid gx-0">
	<img src="${pageContext.request.contextPath}/resources/images/back.jpg" width="100%" height="100%">
</div>

<!-- 채팅 메인 화면 -->
<div class="chatting-container">
	<div class="chatting-wrap">
		<div class="chatting-content">
			<div class="chatting-header">
				<h3 class="chatting-title"><i class="fa-regular fa-comments"></i> 실시간 채팅 문의</h3>
				<button type="button" class="btn-chatting btn-icon btn-chatting-close" > <i class="fa-solid fa-xmark"></i> </button>
			</div>
			
			<div class="message-main" data-room="">
				<div class="message-header">
					<div class="message-header-left">
					</div>
					<div class="message-header-right">
						<button type="button" class="btn-chatting btn-msg btn-message-search" title="검색"><i class="fa-solid fa-magnifying-glass"></i></button>
						<button type="button" class="btn-chatting btn-msg btn-notice" title="공지사항"><i class="fa-regular fa-newspaper"></i></button>
					</div>
				</div>
				<div class="message-body">
					<div class="message-body-list">
						<div class="message-body-date" data-messageDate="20231231">2023년 12월 31일 일요일</div>
						
						<div class="message-body-left">
							<div class="message-user"><i class="fa-regular fa-circle-user"></i> <span>이기자</span></div>
							<div class="message-content content-left">
								<div class="message">반가워요</div>
								<div class="message-info">
									<div class="message-time">오후 2:20</div>
								</div>
							</div>
						</div>
						<div class="message-body-right">
							<div class="message-content">
								<div class="message-info">
									<div class="message-unread">1</div>
									<div class="message-time">오후 2:25</div>
								</div>
								<div class="message message-right">반가워요 2</div>
							</div>
						</div>
						
						<div class="message-body-date" data-messageDate="20240101">2024년 01월 01일 일요일</div>
						
					</div>
				</div>
				
				<div class="message-footer">
					<div class="message-footer-left">
						<textarea class="send-message"></textarea>
					</div>
					<div class="message-footer-right">
						<button type="button" class="btn-chatting btn-msg-send" title="메시지 보내기"><i class="fa-solid fa-play"></i></button>
					</div>
				</div>
			
			</div>
						
		</div>
	</div>
</div>


<script type="text/javascript">
$(function(){
	// 스크롤바 없애기
	$('body').addClass('scrollbar-none');
	
	// 채팅창 종료
	$('.btn-chatting-close').click(function(){
		location.href = '${pageContext.request.contextPath}/';
	});
});

$(function(){
	// -----------------------------------------------
	var socket = null;
	
	var ws_host = '${ws_host}';
	
	/*
	if ('WebSocket' in window) {
		socket = new WebSocket(ws_host);
    } else if ('MozWebSocket' in window) {
    	socket = new MozWebSocket(ws_host);
    } else {
    	// writeToScreen('<div class="chat-info">브라우저의 버전이 낮아 채팅이 불가능 합니다.</div>');
        return false;
    }

	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	*/
	
	
	// -----------------------------------------------
	// 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {

	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {

	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {

	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {

	}
	
	// 채팅 메시지 리스트 : 검색을 클릭한 경우 -> 채팅 문자열 검색
	$('.chatting-wrap').on('click', '.btn-message-search', function(){
		alert('채팅 메시지 검색');
	});

	// 채팅 메시지 리스트 : 하단 우측 메시지 보내기 버튼
	$('.chatting-wrap').on('click', '.btn-msg-send', function(){
		let msg = $('.send-message').val().trim();
		if(! msg) {
			$('.send-message').focus();
			return false;
		}
		
		let room = $(this).closest('.message-main').attr('data-room');
		
		alert(room + ':' + msg);
		
	});
	
	$('.chatting-wrap').on('click', '.btn-notice', function(){
		alert('채팅 공지사항');
	});
	
	// -----------------------------------------------
	// 채팅 메시지 전송
	function sendMessage(data) {

	}
});

function messageToScreen(data) {
	// 채팅 메시지 출력
}
</script>
