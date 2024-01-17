<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
<style type="text/css">
.chatting-room-header { display: flex; width: 860px; }
.chatting-room-header .room-header { display: flex; width: 430px; }
.room-header-left .header-left-title { padding-top: 10px;  font-size: 13px; font-weight: 500; color: #0d6efd; }
.room-header-right { display: flex; width: 430px; padding-top: 10px; justify-content: flex-end; }

.chatting-room-main { display: flex; width: 860px; }
.chatting-room-main .chatting-body { width: 430px; border: 1px solid #dee2e6; }

.room-main-title {
	width: 100%;
	padding: 10px 10px;
	border-bottom: 1px solid #c6c7c8;
	font-size: 15px;
	font-weight: 600;
	background-color: #f8f9fa;
}

.room-main-wrap {
	overflow-y: scroll;
	height: 450px;
	padding: 7px;
}

.room-user {
	display: flex;
	width: 100%;
	padding: 7px 10px;
	margin-bottom: 5px;
	align-items: center;
	justify-content: space-between;	
	border: 1px solid #dee2e6;
	box-shadow: 3px 5px 5px 1px rgba(0,0,0,.2);	
	cursor: pointer;
}
.room-user:hover { border-color: #0d58ba; box-shadow: 3px 5px 5px 1px rgba(0,0,0,.3); }

.person-icon { font-size: 17px; margin-right: 3px; }
.person-circle-icon { font-size: 15px; margin-right: 3px; padding: 7px 3px 5px 7px;  border-radius: 30px; border: 1px solid #cccccc; width: 30px; height: 30px; }

.room-user-left { display: flex; align-items: center; padding: 5px; }
.room-user-left .room-user-name { font-size: 13px; }
.room-user-left .room-user-message { 
	color: #999999;
	font-size: 10px;
	width: 270px;
	white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
}
.room-user-right { display: flex; align-items: flex-end; }
.room-user-right .date { font-size: 9px; color: #999999;  }
.room-user-right .unread { font-size: 9px; color: #f28011; font-weight: 600; text-align: right;  }

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
.btn-body { border: 1px solid #ffffff; background-color: #ffffff; padding: 5px 5px; }
.btn-body:hover, .btn-body:active, .btn-body:focus { font-weight: 600; color: #0d58ba; }
.btn-dots { padding-left: 3px; padding-right: 3px; }

.message-main { background: #fefefe; padding: 0; }

.message-main .message-header {
	display: flex;
	width: 100%;
	padding: 7px 10px 7px 0;
	align-items: center;
	justify-content: space-between;
}

.message-main .message-header-left { display: flex; align-items: center; font-weight: 600; }

.message-main .message-body {
	overflow-y: scroll;
	height: 385px;
	border: 1px solid #c6c7c8;
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
.message-body .message-body-right { margin-left: auto; margin-right: 5px; margin-bottom: 7px; }
.message-body .message-content { display: flex; align-items: flex-end; }
.message-body .content-left { padding-left: 20px; }
.message-body .message-info { display: flex; flex-direction:column; padding: 3px 5px; align-items: flex-end; }

.message-body .message, .message-body .add-information {
	max-width: 320px;
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

.message-body .add-information {
/*
	display: flex; flex-direction:column; 
	padding: 3px 5px; 
	background: #f8f9fa;
	font-size: 12px; color: #333333;
	margin: 5px;
*/
	font-size: 12px; color: #335553;
	background: #f8f9fa;
    padding: 3px;
    margin-right: auto;
    margin-left: 8px;
    margin-bottom: 5px;
}

.message-main .message-footer {
	display: flex;
	width: 100%;
	padding: 0;
	align-items: center;
	justify-content: space-between;
	border: 1px solid #c6c7c8;
	border-top: none;
}

.message-main .message-footer-right { display: flex; width: 100%; border-left: 1px solid #c6c7c8; }
.message-footer textarea { width: 420px; resize: none; height: 45px; padding: 5px; border: none ; }
.message-footer textarea:focus { outline: none; }

.btn-msg-send { border: 1px solid #ffffff; background-color: #ffffff; padding: 13px 13px; border-radius: 0; }
.btn-msg-send:hover, .btn-msg-send:active, .btn-msg-send:focus { font-weight: 600; color: #0d58ba; }

.consulting { color : #ff00ff;}
</style>

<main class="wrapper" style="margin:0 auto; width:100%;">
	<div id="layoutSidenav_content">
		<div class="container-fluid px-5">
			<div class="body-container" style="width:80%; margin:5% auto; ">
				<div class="body-main">
				
				<h3 class="mb-3 p-2" style="border-bottom:3px solid black;">
					<i class="fa-regular fa-comments"></i> 실시간 채팅 문의<small class="fs-6 fw-normal"> chat inquiry</small> 
				</h3>
		
				<div class="content-frame" style="margin-left:10%">
					<div class="chatting-room-header">
						<div class="room-header room-header-left">
							<span class="header-left-title">접속 대기 상태</span>
						</div>
						<div class="room-header room-header-right">
							<button type="button" class="btn-chatting btn-body btn-on-line" title="온라인"><i class="fa-solid fa-toggle-on"></i></button>
						</div>
					</div>
			
					<div class="chatting-room-main">
						<div class="chatting-body">
							<div class="room-main-title room-main-left-title">실시간 문의</div>
							<div class="room-main-wrap online-main" data-listDivision="question">
							</div>
						</div>
						<div class="chatting-body">
							<div class="room-main-title">답변 대기중인 문의</div>
							<div class="room-main-wrap offline-main">
							</div>					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>

<!-- 채팅 대화상자  -->
<div class="modal fade" id="adminChattingDialogModal" tabindex="-1" aria-labelledby="adminChattingDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="adminChattingDialogModalLabel">실시간 채팅 상담</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				
				<div class="message-main" data-room="" data-userName="" data-online="">
					<div class="message-header">
						<div class="message-header-left">
							<label class="message-header-title"></label>
						</div>
						<div class="message-header-right"></div>
					</div>
					<div class="message-body">
						<div class="message-body-list"></div>
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
</div>

<script type="text/javascript">
$(function(){
	var socket = null;
	var host = '${ws_host}/manage';
	
	// 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {
		// 서버 접속이 성공 하면 회원뱐호와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = 'online';
	    obj.aidx = '${sessionScope.member.memberIdx}';
	    obj.nickName = '${sessionScope.member.userName}';
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		socket = null;
		
		$('#adminChattingDialogModal').modal('hide');
		
		$('.header-left-title').html('<span class="header-left-title">접속 대기 상태</span>');
		let s = '<button type="button" class="btn-chatting btn-body btn-on-line" title="온라인"><i class="fa-solid fa-toggle-on"></i></button>';
		$('.room-header-right').html(s);
		$('.room-main-left-title').html('실시간 문의');
		
		$('.online-main').empty();
		$('.offline-main').empty();
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	// 전송 받은 문자열을 JSON으로 변환
    	let data = JSON.parse(evt.data); // JSON 파싱
    	let cmd = data.type;
    	
    	if(cmd === 'onlineOk') { // 서버에 접속한 경우
    		onlineOk(data);
    	} else if(cmd === 'inquiry') { // 질문을 전달 받은 경우
    		inquiry(data);
    	} else if(cmd === 'answerOk') { // 답변 등록 완료
    		answerOk(data);
    	} else if(cmd === 'roomInquiry') { // 질문이 있는 채팅룸을 전달 받은 경우
    		roomInquiry(data);
    	} else if(cmd === 'onlineQuestionUsers') { // 질문이 있는 온라인 유저들을 전달 받은 경우
    		onlineQuestionUsers(data);
    	} else if(cmd === 'onlineAllUsers') { // 모든 온라인 유저들을 전달 받은 경우
    		onlineAllUsers(data);
    	} else if(cmd === 'startChatting') { // 채팅 시작을 전달 받은 경우
    		startChatting(data);
    	} else if(cmd === 'noChat') { // 다른 관리자와 채팅 중인 경우
    		noChat(data);
    	} else if(cmd === 'userConsulting') { // 유저가 다른 관리자와 상담을 시작/종료한 경우
    		userConsulting(data);
    	} else if(cmd === 'endChatting') { // 채팅 종료를 전달 받은 경우
    		endChatting(data);
    	} else if(cmd === 'userConn') { // 유저가 접속한 경우
    		userConn(data);	
    	} else if(cmd === 'userDisConn') { // 유저가 접속 해제한 경우
    		userDisConn(data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {
	}	
	
	// 온라인 버튼을 클릭한 경우 - 서버에 Connection -----
	$('.content-frame').on('click', '.btn-on-line', function() {
		
		// 웹소켓 객체 생성 -----
		if ('WebSocket' in window) {
			socket = new WebSocket(host);
	    } else if ('MozWebSocket' in window) {
	    	socket = new MozWebSocket(host);
	    } else {
	        return false;
	    }
		
		socket.onopen = function(evt) { onOpen(evt) };
		socket.onclose = function(evt) { onClose(evt) };
		socket.onmessage = function(evt) { onMessage(evt) };
		socket.onerror = function(evt) { onError(evt) };
		
		let out = '';
		out =  '<button type="button" class="btn-chatting btn-body btn-chatting-management" title="채팅관리"><i class="fa-solid fa-user-gear"></i></button>';
		out += '<button type="button" class="btn-chatting btn-body btn-notice-management" title="공지사항 관리"><i class="fa-regular fa-newspaper"></i></button>';
		out += '<button type="button" class="btn-chatting btn-body btn-off-line" title="오프라인"><i class="fa-solid fa-toggle-off"></i></button>';
		$('.room-header-right').html(out);
		
		$('.online-main').attr('data-listDivision', 'question');
		out =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		out += '<button type="button" class="btn-chatting btn-body btn-connection-user" title="접속된 모든 유저"><i class="fa-solid fa-person-circle-question"></i></button>'; 
		$('.header-left-title').html(out);
	});
	
	// 오프라인 버튼을 클릭한 경우 - 서버와 연결을 종료 한경우 -----
	$('.content-frame').on('click', '.btn-off-line', function() {
		
	    let obj = {};
	    obj.type = "offline";
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
		
		socket = null;
		
		$('.header-left-title').html('<span class="header-left-title">접속 대기 상태</span>');
		let s = '<button type="button" class="btn-chatting btn-body btn-on-line" title="온라인"><i class="fa-solid fa-toggle-on"></i></button>';
		$('.room-header-right').html(s);
		$('.room-main-left-title').html('실시간 문의');
		
		$('.online-main').empty();
		$('.offline-main').empty();
	});
	
	// 채팅 관리 -----
	$('.content-frame').on('click', '.btn-chatting-management', function() {
		alert('채팅 관리');
	});
	
	// 채팅방 리스트에서 채팅방을 클릭한 경우 ----- 
	$('.content-frame').on('click', '.room-user', function() {
		let consulting = $(this).attr('data-consulting');
		if(consulting == '1') {
			alert('다른 관리자와 상담중입니다.');
			return false;
		}
		
		let roomIdx = $(this).attr('data-room');
		let online = $(this).attr('data-online');
		let userName = $(this).attr('data-userName');
		let title = online === '1' ? '실시간 채팅 상담' : '문의 답변 등록';
		$('#chattingDialogModalLabel').html(title);
		// $('.message-body-list').empty();
		
		// 채팅 시작을 알림 -----
	    let obj = {};
	    obj.type = "startChatting";
	    obj.roomIdx = roomIdx;
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
		
		$('.message-header-title').html('<i class="fa-regular fa-comment"></i> 상담고객 : ' + userName);
		
		$('#adminChattingDialogModal .message-main').attr('data-room', roomIdx);
		$('#adminChattingDialogModal .message-main').attr('data-userName', userName);
		$('#adminChattingDialogModal .message-main').attr('data-online', online);
		
		$('#adminChattingDialogModal').modal('show');
	});
	
	// 모든 접속자 리스트 요청 -----
	$('.content-frame').on('click', '.btn-connection-user', function() {
	    let obj = {};
	    obj.type = "onlineAllUsers";
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
		
	    $('.online-main').attr('data-listDivision', 'all');
		$('.room-main-left-title').html('온라인 유저');
		let s =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		s += '<button type="button" class="btn-chatting btn-body btn-question-user" title="문의가 있는 유저"><i class="fa-solid fa-solid fa-person "></i></button>'; 
		$('.header-left-title').html(s);
	});

	// 접속자 중 문의가 있는 유저 리스트 요청 -----
	$('.content-frame').on('click', '.btn-question-user', function() {
	    let obj = {};
	    obj.type = "onlineQuestionUsers";
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
		
	    $('.online-main').attr('data-listDivision', 'question');
		$('.room-main-left-title').html('실시간 문의');
		let s =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		s +=     '<button type="button" class="btn-chatting btn-body btn-connection-user" title="접속된 모든 유저"><i class="fa-solid fa-person-circle-question"></i></button>'; 
		$('.header-left-title').html(s);
	});

	// 알림 -----
	$('.content-frame').on('click', '.btn-alarm', function() {
		alert('모든 접속자에게 알림');
	});
	
	// 채팅 공지사항 관리 -----
	$('.content-frame').on('click', '.btn-notice-management', function() {
		alert('공지 사항 관리');
	});
	
	// 문의에 대한 답변 전송 -----
	$('.btn-msg-send').click(function(){
		if(! socket) {
			alert('서버와 연결이 종료 되었습니다.')
			return false;
		}
		
		let msg = $('.send-message').val().trim();
		if(! msg ) {
	    	$('.send-message').focus();
	    	return false;
	    }
		
		let roomIdx = $('#adminChattingDialogModal .message-main').attr('data-room');
		let userName = $('#adminChattingDialogModal .message-main').attr('data-userName');
		
	    let obj = {};
        obj.type = 'answer';
        obj.answer = msg;
        obj.roomIdx = roomIdx;
        obj.userName = userName;
        
        let jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
		
        $('.send-message').val('');
        $('.send-message').focus();
        
        let date = new Date();
        let h = date.getHours();
        let m = date.getMinutes();
        let s = h >= 12 && h < 24 ? '오후 ' + (h - 12) : '오전 ' + (h == 24 ? 0 : h);
        s += ':' + m;
        
        let out;
        out = senderMessageHTML('1', s, msg);
        
        messageToScreen(out);
	});
	
	// 모달 대화상자 -----
	const chattingModalEl = document.getElementById('adminChattingDialogModal');
	chattingModalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때 : show () 메소드를 부를때 바로 실행 
		$('.message-body-list').empty();
	});
	
	chattingModalEl.addEventListener('shown.bs.modal', function(){
		// 모달이 사용자에게 표시될 때 발생
		const $bodyEL = $('.message-body');
		$bodyEL.scrollTop($bodyEL.prop('scrollHeight'));
	});
	
	chattingModalEl.addEventListener('hidden.bs.modal', function(){
		// 모달 대화상자가 안보일때
		let roomIdx = $('#adminChattingDialogModal .message-main').attr('data-room');
		if(! roomIdx) {
			return false;
		}
		
		$('#adminChattingDialogModal .message-main').attr('data-room', '');
		$('#adminChattingDialogModal .message-main').attr('data-userName', '');
		$('#adminChattingDialogModal .message-main').attr('data-online', '');
		
		$('.message-body-list').empty();
		
		// 채팅 종료를 알림 -----
	    let obj = {};
	    obj.type = "endChatting";
	    obj.roomIdx = roomIdx;
		
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
	});
});

// 서버에 접속을 성공한 경우 -----
function onlineOk(data) {
	let listOnline = data.listOnline;
	let listOffline = data.listOffline;
	
	for(let userRoom of listOnline) {
		appendChattingRoom(userRoom, '0', '.online-main');
	}
	
	for(let userRoom of listOffline) {
		appendChattingRoom(userRoom, '0', '.offline-main');
	}
}

// 문의를 전달 받은 경우 -----
function inquiry(data) {
	let fromIdx = data.msg.fromIdx;
	let fromName = data.msg.fromName;
	let classify = data.msg.classify;
	let content = data.msg.content;
	let date = data.msg.date;
	let dateWeek = data.msg.dateWeek;
	let time = data.msg.time;
	
	let out;
	out = receverMessageHTML(fromName, content, time);
	
	let b = false;
	$('.message-body-list .message-body-date').each(function(){
		let messageDate = $(this).attr('data-messageDate');
		if(date == messageDate) {
			b = true;
			return false;
		}
	});
	
	if(! b) {
		let s = '<div class="message-body-date" data-messageDate="' + date + '">' + dateWeek + '</div>';
		messageToScreen(s);
	}
	
	messageToScreen(out);
}

// 답변 등록 완료 -----
function answerOk(data) {
	let unread = data.unread;
	
	if(unread == 0) { // 모든 메시지를 읽은 상태로 변경
		$('.message-body-list .message-unread').each(function(){
			$(this).html('');
		});
	}
}

// 문의가 있는 채팅룸을 전달 받은 경우(룸)
function roomInquiry(data) {
	let roomIdx = data.userRoom.roomIdx;

	let b = false;
	$('.online-main .room-user').each(function(){
		let room = $(this).attr('data-room');
		if(room == roomIdx) {
			b = true;
			return false;
		}
	});
	
	if(b) return;
	
	b = false;
	$('.offline-main .room-user').each(function(){
		let $el = $(this);
		let room = $el.attr('data-room');
		if(room == roomIdx) {
			$el.clone(true).appendTo(".online-main");
			$el.remove();
			
			b = true;
			return false;
		}
	});
	
	if(b) return;
	
	let userRoom = data.userRoom;
	userRoom.consulting = "0";
	
	appendChattingRoom(userRoom, '1', '.online-main');
}

// 질문이 있는 온라인 유저들의 룸을 전달 받은 경우(룸)
function onlineQuestionUsers(data) {
	let listOnline = data.listOnline;
	
	$('.online-main').empty();
	for(let userRoom of listOnline) {
		appendChattingRoom(userRoom, '1', '.online-main');
	}
}

// 모든 온라인 유저들의 룸을 전달 받은 경우(룸)
function onlineAllUsers(data) {
	let listOnline = data.listOnline;
	
	$('.online-main').empty();
	for(let userRoom of listOnline) {
		appendChattingRoom(userRoom, '1', '.online-main');
	}
}

// 채팅 시작을 전달 받은 경우
function startChatting(data) {
	let nowDate = data.nowDate;
	let nowFullDate = data.nowFullDate;
	let userOnline = data.userOnline;
	let messageList = data.messageList;
	
	let title = userOnline == 1 ? '실시간 채팅 상담' : '문의 답변 등록';
	$('#chattingDialogModalLabel').html(title);
	
	let out;
	if(messageList.length == 0) {
		out = '<div class="message-body-date" data-messageDate="' + nowDate + '">' + nowFullDate + '</div>';
		messageToScreen(out);
		
		return;
	}
	
	for(let msg of messageList) {
		let fromIdx = msg.fromIdx;
		let fromName = msg.fromName;
		let classify = msg.classify;  //1:유저질문, 2:관리자답변
		let content = msg.content;
		let toIdx = msg.toIdx;
		let toName = msg.toName;
		let readIdx = msg.readIdx;
		let date = msg.date;
		let dateWeek = msg.dateWeek;
		let time = msg.time;
		
		let out;
		if(classify == 1) {
			out = receverMessageHTML(fromName, content, time);
		} else {
			let unread = readIdx == toIdx ? '' : '1';
			let aidx = '${sessionScope.member.memberIdx}'
			if(fromIdx != aidx) {
				content += '<br>(' + toName + ')';
			}
			
			out = senderMessageHTML(unread, time, content);
		}
		
		let b = false;
		$('.message-body-list .message-body-date').each(function(){
			let messageDate = $(this).attr('data-messageDate');
			if(date == messageDate) {
				b = true;
				return false;
			}
		});
		
		if(! b) {
			let s = '<div class="message-body-date" data-messageDate="' + date + '">' + dateWeek + '</div>';
			messageToScreen(s);
		}
		
		messageToScreen(out);
	}
}

// 유저와 상담을 시작했지만 다른 관리자와 상담중임을 잔달 받은 경우 - 상담 불가
function noChat(data) {
	let roomIdx = data.roomIdx;
	alert('다른 관리자와 상담을 진행하고 있습니다.');
}

// 유저가 다른 관리자와 상담을 시작/종료에 대한 상태를 전달 받은 경우
function userConsulting(data) {
	let roomIdx = data.roomIdx;
	let state = data.state; // 0:상담종료, 1:상담시작
	let question = data.question; // state가 1인 상태에서 0:문의 없음, 1:문의 있음
	
	let b = false;
	$('.online-main .room-user').each(function(){
		let room = $(this).attr('data-room');
		let name = $(this).attr('data-userName');
		
		if(room == roomIdx) {
			let s = state == 1 ? '<span class="consulting"> - 상담중</span>' : '';
			name = name + s;
			$(this).find('.room-user-name').html(name);
			$(this).attr('data-consulting', state);
			b = true;
			return false;
		}
	});
	
	if(b) return;

	$('.offline-main .room-user').each(function(){
		let room = $(this).attr('data-room');
		let name = $(this).attr('data-userName');
		
		if(room == roomIdx) {
			let s = state == 1 ? '<span class="consulting"> - 상담중</span>' : '';
			name = name + s;
			$(this).find('.room-user-name').html(name);
			$(this).attr('data-consulting', state);
			return false;
		}
	});
}

// 채팅 종료를 전달 받은 경우 -----
function endChatting(data) {
	let roomIdx = data.roomIdx;
	let question = data.question;
	let online = data.online;
	
	let s = $('.online-main').attr('data-listDivision');
	if(online == 1 && s == 'all') { // 온라인 유저인 경우
		return;
	} else if (question == 0) { // 질문이 없는 경우
		$('.chatting-room-main .room-user').each(function(){
			let $el = $(this);
			let room = $el.attr('data-room');
			
			if(roomIdx === room) {
				$el.remove();
				return false;
			}
		});
		
		return;
	} else if(question == 1 && online == 0) {
		$('.online-main .room-user').each(function(){
			let $el = $(this);
			let room = $el.attr('data-room');

			let name = $el.attr('data-userName');
			$el.attr('data-consulting', '0');
			$(this).find('.room-user-name').html(name);
			
			if(roomIdx === room) {
				$el.clone(true).appendTo(".offline-main");
				$el.remove();
				return false;
			}
		});
	}
}

// 유저가 채팅 서버에 접속한 경우 -----
function userConn(data) {
	let roomIdx = data.roomIdx;
	let userId = data.userId;
	let userName = data.userName;
	
	let b = false;
	$('.offline-main .room-user').each(function(){
		let $el = $(this);
		let room = $el.attr('data-room');
		if(room == roomIdx) {
			$el.clone(true).appendTo(".online-main");
			$el.remove();
			
			b = true;
			return false;
		}
	});
	
	if(b) return;
	
	let s = $('.online-main').attr('data-listDivision');
	
	if(s == 'all') {
		let userRoom = {};
		userRoom.roomIdx = roomIdx;
		userRoom.userId = userId;
		userRoom.userName = userName;
		userRoom.question = 0;
		userRoom.content = '';
		userRoom.dateTime = '';
		userRoom.consulting = '';
	
		appendChattingRoom(userRoom, '1', '.online-main');
	}
}

// 유저가 접속을 해제한 경우 -----
function userDisConn(data) {
	let question = data.question;
	let roomIdx = data.roomIdx;

	let room = $('#adminChattingDialogModal .message-main').attr('data-room');
	let userName = $('#adminChattingDialogModal .message-main').attr('data-userName');
	
	if(room) {
		let s = '<div class="add-information">' + userName + '님이 채팅방을 나갔습니다.</div>';
		messageToScreen(s);
	}
	
	$('.online-main .room-user').each(function(){
		let room = $(this).attr('data-room');
		if(room == roomIdx) {
			$(this).remove();
			return false;
		}
	});
	
	if(question == 1) {
		let userRoom = data.userRoom;
		userRoom.consulting = '0';
		appendChattingRoom(userRoom, '0', '.offline-main');
	}
}

// ----------------------------------------------
function receverMessageHTML(name, content, time) {
	let out;

	out =  '<div class="message-body-left">';
	out += '  <div class="message-user"><i class="fa-regular fa-circle-user"></i> <span>' + name + '</span></div>';
	out += '  <div class="message-content content-left">';
	out += '    <div class="message">' + content + '</div>';
	out += '    <div class="message-info">';
	out += '      <div class="message-time">' + time + '</div>';
	out += '    </div>';
	out += '  </div>';
	out += '</div>';
	
	return out;
}

function senderMessageHTML(unread, time, content) {
	let out;
	
	out =  '<div class="message-body-right">';
	out += '  <div class="message-content">';
	out += '    <div class="message-info">';
	out += '      <div class="message-unread">' + unread + '</div>';
	out += '      <div class="message-time">' + time + '</div>';
	out += '    </div>';
	out += '    <div class="message message-right">' + content + '</div>';
	out += '  </div>';
	out += '</div>';
	
	return out;
}

// 채팅방 목록 출력 -----
function appendChattingRoom(userRoom, online, selector) {
	console.log(userRoom);
	
	let roomIdx = userRoom.roomIdx;
	let userId = userRoom.userId;
	let userName = userRoom.userName;
	let name = userName + '(' + userId + ')';
	let question = userRoom.question;
	let unread = question == 1 ? '1' : '';
	let content = userRoom.content;
	if(! content) content = '';
	let dateTime = userRoom.dateTime;
	if(! content) dateTime = '';
	let consulting = userRoom.consulting; // 다른 관리자와 상담 여부
	if(! consulting) consulting = '';

	let out;
	out =  '<div class="room-user" data-room="'+roomIdx+'" data-online="'+online+'" data-consulting="'+consulting+'" data-userName="'+userName+'">';
	out += '  <div class="room-user-left">';
	out += '    <div class="user-left"><i class="fa-solid fa-user-large person-circle-icon"></i></div>';
	out += '    <div class="user-right">';
	out += '      <div class="room-user-name">' + name + '</div>';
	out += '      <div class="room-user-message">' + content + '</div>';
	out += '    </div>';
	out += '  </div>';
	out += '  <div class="room-user-right">';
	out += '    <div>';
	out += '      <div class="date">' + dateTime + '</div>';
	out += '      <div class="unread">' + unread + '</div>';
	out += '    </div>';
	out += '    <div>';
	out += '      <button type="button" class="btn-chatting btn-body btn-dots btn-room-info" title="채팅방 정보"><i class="fa-solid fa-ellipsis-vertical"></i></button>';
	out += '    </div>';
	out += '  </div>';
	out += '</div>';
	
	const $EL = $(selector);
    $EL.append(out);
}

// 채팅 메시지 출력 -----
function messageToScreen(data) {
	const $listEL = $('.message-body-list');
	$listEL.append(data);
    
	// 스크롤을 최상단에 있도록 설정함
	const $bodyEL = $('.message-body');
	$bodyEL.scrollTop($bodyEL.prop('scrollHeight'));
}
</script>
