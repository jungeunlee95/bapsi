<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery CDN-->
<script src="https://code.jquery.com/jquery-1.9.0.js" integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM=" crossorigin="anonymous"></script>
<!-- Web socket CDN -->
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/chat/main.css" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/css/assets/images/bapsi-logo31-1-134x134.png"
	type="image/x-icon">
</head>
<!-- <script>
if( ${ empty userVO}){
   alert("로그인이 필요합니다");
   location.href = "${pageContext.request.contextPath}/login";      
} 
</script> --> 
<body>
    <div id="chat-page">
        <div class="chat-container">
            <div class="chat-header">
                <h2>Bapsi Chatting Room</h2>
            </div>
<!-- 
            <div class="connecting">
                Connecting...
            </div>
 -->
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm" nameForm="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="메세지를 입력하세요" autocomplete="off" class="form-control"/>
                        <button type="submit" id="sendBtn" class="primary">Send</button>
                    </div>
                </div>
            </form>
            <input type="hidden" id="nickname" value="${userVO.nickname}" />
        </div>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/chat/main.js"></script> --%>  
<script type="text/javascript">
$(document).ready(function() {
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
		return false;
	});

	$("#message").keydown(function(key) {
		if (key.keyCode == 13) { // 엔터
			sendMessage();
			$('#message').val('')
			return false;
		}
	});
});

// 웹소켓을 지정한 url로 연결한다.
let sock = new SockJS("<c:url value="/echo"/>");
sock.onopen = onOpen;
sock.onmessage = onMessage;
sock.onclose = onClose;

//서버와 연결되었을 때 호출될 함수 
function onOpen(){
	nickname = document.getElementById("nickname").value;
	//<li class="event-message"><p>'+nickname+'님이 입장하였습니다.</p></li>
	$("#messageArea").append('<li class="event-message"><p>입장하였습니다.</p></li>');
}

// 메시지 전송
function sendMessage() {
	sock.send($("#message").val());
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
	var messageArea = msg.data;
	$("#messageArea").append(messageArea);
	return false;
}

// 서버와 연결을 끊었을 때
function onClose(evt) {
	nickname = document.getElementById("nickname").value;
	//'<li class="event-message"><p>'+nickname+'님이 퇴장하였습니다.</p></li>'
	$("#messageArea").append('<li class="event-message"><p>연결이 끊겼습니다.</p></li>');
}
</script>
</html>
