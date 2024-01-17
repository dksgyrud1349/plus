<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
<style type="text/css">
.body-container {
	max-width: 860px;
}


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
.message-body .message-body-right { margin-left: auto; margin-right: 3px; margin-bottom: 7px; }
.message-body .message-content { display: flex; align-items: flex-end; }
.message-body .content-left { padding-left: 20px; }
.message-body .message-info { display: flex; flex-direction:column; padding: 3px 5px; align-items: flex-end;}
.message-body .message {
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
 
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="fa-regular fa-comments"></i> 실시간 채팅 문의<small class="fs-6 fw-normal"> chat inquiry</small> </h3>
		</div>
		
		<div class="body-main content-frame">
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
					<div class="room-main-wrap online-main">
					
						<div class="room-user" data-room="1" data-online="1" data-userName="이자바(lee)">
							<div class="room-user-left">
								<div class="user-left"><i class="fa-solid fa-user-large person-circle-icon"></i></div>
								<div class="user-right">
									<div class="room-user-name">이자바(lee)</div>
									<div class="room-user-message">감사합니다.</div>
								</div>
							</div>
							<div class="room-user-right">
								<div>
									<div class="date">12월 29일</div>
									<div class="unread">1</div>
								</div>
								<div>
									<button type="button" class="btn-chatting btn-body btn-dots btn-room-info" title="채팅방 정보"><i class="fa-solid fa-ellipsis-vertical"></i></button>
								</div>
							</div>						
						</div>

						<div class="room-user" data-room="1" data-online="1" data-userName="이자바(lee)">
							<div class="room-user-left">
								<div class="user-left"><i class="fa-solid fa-user-large person-circle-icon"></i></div>
								<div class="user-right">
									<div class="room-user-name">이자바(lee)</div>
									<div class="room-user-message">감사합니다.</div>
								</div>
							</div>
							<div class="room-user-right">
								<div>
									<div class="date">12월 29일</div>
									<div class="unread">1</div>
								</div>
								<div>
									<button type="button" class="btn-chatting btn-body btn-dots btn-room-info" title="채팅방 정보"><i class="fa-solid fa-ellipsis-vertical"></i></button>
								</div>
							</div>						
						</div>
						
					</div>
				</div>
				<div class="chatting-body">
					<div class="room-main-title">답변 대기중인 문의</div>
					<div class="room-main-wrap offline-main">

						<div class="room-user" data-room="2" data-online="0" data-userName="이자바(lee)">
							<div class="room-user-left">
								<div class="user-left"><i class="fa-solid fa-user-large person-circle-icon"></i></div>
								<div class="user-right">
									<div class="room-user-name">이자바(lee)</div>
									<div class="room-user-message">감사합니다.</div>
								</div>
							</div>
							<div class="room-user-right">
								<div>
									<div class="date">12월 29일</div>
									<div class="unread">1</div>
								</div>
								<div>
									<button type="button" class="btn-chatting btn-body btn-dots btn-room-info" title="채팅방 정보"><i class="fa-solid fa-ellipsis-vertical"></i></button>
								</div>
							</div>						
						</div>
					
					</div>					
				</div>
			</div>

		</div>
	</div>
</div>

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
						<div class="message-header-right">
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
							
							<div class="message-body-date" data-messageDate="20230101">2024년 01월 01일 일요일</div>
							
							<div class="message-body-left">
								<div class="message-user"><i class="fa-regular fa-circle-user"></i> <span>이기자</span></div>
								<div class="message-content content-left">
									<div class="message">반가워요</div>
									<div class="message-info">
										<div class="message-time">오후 2:20</div>
									</div>
								</div>
							</div>
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
</div>

<script type="text/javascript">
$(function(){
	
	
	$('.content-frame').on('click', '.btn-on-line', function() {
		// 웹소켓 객체 생성
		
 
		let out = '';
		out =  '<button type="button" class="btn-chatting btn-body btn-chatting-management" title="채팅관리"><i class="fa-solid fa-user-gear"></i></button>';
		out += '<button type="button" class="btn-chatting btn-body btn-notice-management" title="공지사항 관리"><i class="fa-regular fa-newspaper"></i></button>';
		out += '<button type="button" class="btn-chatting btn-body btn-off-line" title="오프라인"><i class="fa-solid fa-toggle-off"></i></button>';
		$('.room-header-right').html(out);
		
		out =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		out += '<button type="button" class="btn-chatting btn-body btn-connection-user" title="접속된 모든 유저"><i class="fa-solid fa-person-circle-question"></i></button>'; 
		$('.header-left-title').html(out);
	});
	
	$('.content-frame').on('click', '.btn-off-line', function() {
		// 웹 소켓 객체 초기화

		$('.header-left-title').html('<span class="header-left-title">접속 대기 상태</span>');
		let s = '<button type="button" class="btn-chatting btn-body btn-on-line" title="온라인"><i class="fa-solid fa-toggle-on"></i></button>';
		$('.room-header-right').html(s);
		$('.room-main-left-title').html('실시간 문의');
		
		$('.online-main').empty();
		$('.offline-main').empty();
	});
	
	$('.content-frame').on('click', '.btn-chatting-management', function() {
		alert('채팅 관리');
	});
	
	$('.content-frame').on('click', '.room-user', function() {
		let room = $(this).attr('data-room');
		let online = $(this).attr('data-online');
		let userName = $(this).attr('data-userName');
		let title = online === '1' ? '실시간 채팅 상담' : '문의 답변 등록';
		$('#chattingDialogModalLabel').html(title);
		
		// 온라인 회원인 경우 상담가능 상태를 알림
		
		$('.message-header-title').html('<i class="fa-regular fa-comment"></i> 상담고객 : ' + userName);
		// $('.message-body').empty();
		$('#adminChattingDialogModal').modal('show');
	});
	
	$('.content-frame').on('click', '.btn-connection-user', function() {
		// 모든 접속자 리스트 

		
		$('.room-main-left-title').html('온라인 유저');
		let s =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		s += '<button type="button" class="btn-chatting btn-body btn-question-user" title="문의가 있는 유저"><i class="fa-solid fa-solid fa-person "></i></button>'; 
		$('.header-left-title').html(s);
	});

	$('.content-frame').on('click', '.btn-question-user', function() {
		// 접속자 중 문의자 있는 유저 리스트

		
		$('.room-main-left-title').html('실시간 문의');
		let s =  '<button type="button" class="btn-chatting btn-body btn-alarm" title="알림"><i class="fa-regular fa-bell"></i></button>'; 
		s += '<button type="button" class="btn-chatting btn-body btn-connection-user" title="접속된 모든 유저"><i class="fa-solid fa-person-circle-question"></i></button>'; 
		$('.header-left-title').html(s);
	});

	$('.content-frame').on('click', '.btn-alarm', function() {
		alert('모든 접속자에게 알림');
	});
	
	$('.content-frame').on('click', '.btn-notice-management', function() {
		alert('공지 사항 관리');
	});
	
	const chattingModalEl = document.getElementById('adminChattingDialogModal');
	chattingModalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때
		
	});
	
	chattingModalEl.addEventListener('hidden.bs.modal', function(){
		// 모달 대화상자가 안보일때
	});
	
});
</script>

