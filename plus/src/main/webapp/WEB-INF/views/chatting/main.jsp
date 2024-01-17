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

.message-main .message-header-left { display: flex; align-items: center; font-weight: 500; font-size: 11px; color:#0d58ba; }

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
.message-body .message-body-right { margin-left: auto; margin-right: 5px; margin-bottom: 7px; }
.message-body .message-content { display: flex; align-items: flex-end; }
.message-body .content-left { padding-left: 20px; }
.message-body .message-info { display: flex; flex-direction:column; padding: 3px 5px; align-items: flex-end; }

.message-body .message, .message-body .add-information {
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
	<img src="${pageContext.request.contextPath}/resources/images/Image-folder.jpg" width="100%" height="100%">
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
					<div class="message-header-left"></div>
					<div class="message-header-right">
						<button type="button" class="btn-chatting btn-msg btn-message-menu" title="메뉴"><i class="fa-solid fa-ellipsis-vertical"></i></button>
					</div>
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
	var host = '${ws_host}/user';
	
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
	
	// -----------------------------------------------
	// 서버 접속이 성공한 경우 호출되는 콜백함수
	function onOpen(evt) {
		// 서버 접속이 성공 하면 회원뱐호와 이름을 JSON으로 서버에 전송
	    let obj = {};
	    obj.type = 'connect';
	    obj.uidx = '${sessionScope.member.memberIdx}';
	    obj.userId = '${sessionScope.member.userId}';
	    obj.nickName = '${sessionScope.member.userName}';
	    
	    let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);
	}

	// 연결이 끊어진 경우에 호출되는 콜백함수
	function onClose(evt) {
		socket = null;
		messageToScreen('<div class="add-information">서버와 연결이 종료 되었습니다.</div>');
	}

	// 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
	function onMessage(evt) {
    	// 전송 받은 문자열을 JSON으로 변환
    	let data = JSON.parse(evt.data); // JSON 파싱
    	
    	// console.log(data);
    	
    	let cmd = data.type;
    	
    	if(cmd === 'connectOk') { // 서버에 접속한 경우
    		connectOk(data);
    	} else if(cmd === 'inquiryOk') { // 문의 사항을 서버에 등록한 경우
    		inquiryOk(data);
    	} else if(cmd === 'consult') { // 관리자의 실시간 컨설트 가능 여부를 전달 받은 경우
    		consult(data);
    	} else if(cmd === 'answerOk') { // 답변을 전달 받은 경우
    		answerOk(data);
    	} else if(cmd === 'realTimeConsult') { // 유저와 실시간 상담 시작/ 종료를 전달 받은 경우
    		realTimeConsult(data);
    	}
	}

	// 에러가 발생시 호출되는 콜백함수
	function onError(evt) {

	}
	
	// 채팅 메시지 리스트 : 메뉴를 클릭한 경우 -> 채팅 문자열 검색 / 공지사항 등
	$('.chatting-wrap').on('click', '.btn-message-menu', function(){
		alert('메뉴');
	});

	// 채팅 메시지 리스트 : 하단 우측 메시지 보내기 버튼
	$('.chatting-wrap').on('click', '.btn-msg-send', function(){
		if(! socket) {
			alert('서버와 연결이 종료되었습니다.');
			return false;
		}
		
		let msg = $('.send-message').val().trim();
		if(! msg) {
			$('.send-message').focus();
			return false;
		}
		
		let room = $(this).closest('.message-main').attr('data-room');
		
		let obj = {};
        obj.type = 'question';
        obj.inquiry = msg;
        
        let jsonStr = JSON.stringify(obj);  // JSON.stringify() : 자바스크립트 값을 JSON 문자열로 변환
	    socket.send(jsonStr);

        $('.send-message').val('');
        $('.send-message').focus();
        
        let date = new Date();
        let h = date.getHours();
        let m = date.getMinutes();
        let s = h >= 12 && h < 24 ? '오후 ' + (h - 12) : '오전 ' + (h == 24 ? 0 : h);
        s += ':' + m;
        
        let out;
    	out = senderMessageHTML(1, s, msg)    	
        
    	messageToScreen(out);
	});
	
	$('.chatting-wrap').on('click', '.btn-notice', function(){
		alert('채팅 공지사항');
	});
});

function connectOk(data) {
	// 서버에 접속한 경우
	let nowDate = data.nowDate;
	let nowFullDate = data.nowFullDate;
	let realTime = data.realTime;
	let messageList = data.messageList;

	let stateMsg = '실시간 상담이 가능합니다.<br>문의를 남기시면 문의 순서대로 답변해드리겠습니다.';
	if(realTime == '0') {
		stateMsg = '지금은 실시간 상담이 불가능합니다.<br>문의를 남기시면 빠른 시간에 답변해드리겠습니다.';
	}
	$('.message-header-left').html(stateMsg);
	
	out = '';
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
			let unread = readIdx ? '' : '1';
			
			out = senderMessageHTML(unread, time, content);
		} else {
			out = receverMessageHTML('관리자', content, time);
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

function inquiryOk(data) {
	// 문의 사항을 서버에 등록한 경우
	let unread = data.unread;
	
	if(unread == 0) { // 모든 메시지를 읽은 상태로 변경
		$('.message-body-list .message-unread').each(function(){
			$(this).html('');
		});
	}
}

function consult(data) {
	 // 관리자의 실시간 컨설트 가능 여부를 전달 받은 경우
	let state = data.state;
	 
	let stateMsg = '실시간 상담이 가능합니다.<br>문의를 남기시면 문의 순서대로 답변해드리겠습니다.';
	if(state == 0) {
		stateMsg = '지금은 실시간 상담이 불가능합니다.<br>문의를 남기시면 빠른 시간에 답변해드리겠습니다.';
	}
	$('.message-header-left').html(stateMsg);
}

function answerOk(data) {
	// 답변을 전달 받은 경우
	let classify = data.answer.classify;
	let content = data.answer.content;
	let date = data.answer.date;
	let dateWeek = data.answer.dateWeek;
	let time = data.answer.time;
	
	$('.message-body-list .message-unread').each(function(){
		$(this).html('');
	});	
	
	let out;
	out = receverMessageHTML('관리자', content, time);
	
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

function realTimeConsult(data) {
	// 유저와 실시간 상담 시작/종료를 전달 받은 경우
	let state = data.state;
	let userName = data.userName;

	let s;
	if(state == 1) {
		s = userName + '님<br>문의에 대해 실시간으로 답변해 드리겠습니다.';
	} else {
		s = userName + '님<br>실시간 답변을 종료 합니다.';
	}
	
	let out;
	out = '<div class="add-information">' + s +'</div>';
	messageToScreen(out);
}

//----------------------------------------------
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

function messageToScreen(data) {
	// 채팅 메시지 출력
    const $listEL = $('.message-body-list');
    $listEL.append(data);
    
    // 스크롤을 최상단에 있도록 설정함
    const $bodyEL = $('.message-body');
    $bodyEL.scrollTop($bodyEL.prop('scrollHeight'));
}
</script>
