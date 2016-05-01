<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CLAP</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/customer.css"
	rel="stylesheet">
<style>
#dialog {
	background: rgba(255, 255, 255, 0.5);
	width: 100%;
	height: 300px;
	color: #000;
	border-radius: 5px;
	border: 1px #fff solid;
}

button {
	color: #000;
}
</style>



</head>
<body>
	<header>
		<jsp:include page="/header.jsp" />
	</header>
	<section id="wrap">
		<div class="container">
			<div class="row">

				<div class="col-md-2">
					<c:choose>
						<c:when test="${login.type==2}">
							<jsp:include page="/sidenavadmin.jsp" />
						</c:when>
						<c:otherwise>
							<jsp:include page="/sidenav.jsp" />
						</c:otherwise>
					</c:choose>
				</div>

				<div class="col-md-10" id="chatBackgroundWhole">
					<img src="../resource/images/chatbg.jpg" />
					<h2>Customer Online Service</h2>
					<P>what can we help you with? Please tell us more about your
						issue.</P>
					<p id="u_name">

						<em style="color: #47BED9;">Hello,</em>

						<c:choose>
							<c:when test="${empty login}">
								<input id="username" placeholder="Your Name" autofocus>
							</c:when>
							<c:when test="${login.type==2}">
								<input id="username" value="admin" readonly>
							</c:when>
							<c:when test="${login.type!=2}">
								<input id="username" value="${login.name}">
							</c:when>
						</c:choose>
						<c:if test="${empty login || login.type!=2}">
										<button id="connect">Chat</button>
										<button id="disconnect" disabled>Leave</button>
									</c:if>
									<c:if test="${login.type==2}">
										<button id="connect" style="display: none">Chat</button>
										<button id="disconnect" disabled style="display: none">Leave</button>
									</c:if>

					</p>
					<div class="col-md-2 l_side">
						<c:if test="${login.type==2}">
							<h5>Online User(s)</h5>
							<ul id="userList">

							</ul>
						</c:if>
						<c:if test="${empty login || login.type!=2}">
							<li><button type="button"
									class="btn btn-success btn-circle btn-lg">
									<a href="callto:123" id="phoneicon"><i
										class="glyphicon glyphicon-earphone"></i></a>
								</button></li>
							<li><button id="connect" type="button"
									class="btn btn-success btn-circle btn-lg">
									<i class="glyphicon glyphicon-headphones"></i>
								</button></li>
							<li><button id="disconnect" type="button"
									class="btn btn-success btn-circle btn-lg">
									<i class="glyphicon glyphicon-eye-close"></i>
								</button></li>
						</c:if>
					</div>
					<div class="col-md-8 r_side" id="chatBackground">


						<div class="row" style="margin: 20px 0px">
							<div class="col-md-12">
								<article>
									<div class="row">

										<div class="col-md-12" id="dialog">
											<c:if test="${empty login || login.type!=2}">
												<p style="margin-top: 10px;">
													<span>You are chatting to <span id="chatTo">Customer
															Service</span></span>
												</p>
												<div id="message-board"></div>
												<hr>
											</c:if>
											<c:if test="${login.type==2}">
												<p style="margin-top: 10px;">
													<span>You are chatting to <span id="chatTo"></span></span>
												</p>
												<div id="message-board"></div>
												<hr>
											</c:if>


										</div>
										<div class="col-md-12" style="margin: 20px 0px;">
											<div class="row">
												<div class="col-md-10">
													<textarea id="message" placeholder="message.."
														style="width: 100%;"></textarea>
												</div>
												<div class="col-md-2">
													<button id="send" type="button" class="btn btn-success"
														style="width: 90%; height: 100;">Send</button>
												</div>

											</div>
										</div>
									</div>
								</article>
							</div>
						</div>

						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 載入js -->
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery-1.12.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//DOM Element

		var usernameInputEl = document.querySelector("#username");
		var connectBtnEl = document.querySelector('#connect');
		var disconnectBtnEl = document.querySelector('#disconnect');
		var usernameListEl = document.querySelector("#userList");
		var articleEl = document.querySelector('article');
		var messageBoardEl = articleEl.querySelector('#message-board');
		var messageInputEl = articleEl.querySelector('#message');
		var sendBtnEl = articleEl.querySelector('#send');
		//label in the message board title
		var chatToEl = articleEl.querySelector('#chatTo');
		// admin btn, to chat to admin people in the room
		var chatToAllEl = document.querySelector('#admin');

		// current chat destination
		var chatTo = 'admin';

		//Chat room that holds every conversation
		var chatRoom = {
			'admin' : []
		};

		//socket object.
		var socket = undefined;

		connectBtnEl.onclick = connect;
		disconnectBtnEl.onclick = disconnect;

		function connect() {
			//ws is a websocket protocol
			//location.host + location.pathname is the current url
			//new WebSocket(url) will immediately open a websocket connection
			socket = new WebSocket("ws://" + location.host
					+ "/Clap/chat.c?username=" + usernameInputEl.value);

			//add the event listener for the socket object
			socket.onopen = socketOnOpen;
			socket.onmessage = socketOnMessage;
			socket.onclose = socketOnClose;
		}
		$(document).ready(function() {
			if (usernameInputEl.value == "admin") {
				connect();
			}

		});
		function disconnect() {
			//close the connection and the reset the socket object
			socket.close();
			socket = undefined;
		}

		function socketOnOpen(e) {
			usernameInputEl.disabled = true;
			connectBtnEl.disabled = true;
			disconnectBtnEl.disabled = false;
		}

		function socketOnMessage(e) {
			var eventName = e.data.substr(0, e.data.indexOf("|"));
			var data = e.data.substr(e.data.indexOf("|") + 1);

			var fn;
			if (eventName == 'newUser')
				fn = newUser;
			else if (eventName == 'removeUser')
				fn = removeUser;
			else if (eventName == 'message')
				fn = getMessage;

			fn.apply(null, data.split('|'));
		}

		function socketOnClose(e) {
			usernameInputEl.disabled = false;
			connectBtnEl.disabled = false;
			disconnectBtnEl.disabled = true;
			usernameInputEl.value = '';
			messageBoardEl.innerHTML = '';
			chatToEl.innerHTML = 'admin';
			usernameListEl.innerHTML = '';
		}

		function newUser() {
			//if there is no users, return from the function
			if (arguments.length == 1 && arguments[0] == "")
				return;
			var usernameList = arguments;

			//Loop through all online users and create a list from it
			var documentFragment = document.createDocumentFragment();
			for (var i = 0; i < usernameList.length; i++) {
				var username = usernameList[i];
				var liEl = document.createElement("li");
				liEl.id = username;
				liEl.textContent = username;
				liEl.onclick = chatToFn(username);

				if (username != usernameInputEl.value)
					liEl.classList.add('hoverable');
				documentFragment.appendChild(liEl);
			}
			;
			usernameListEl.appendChild(documentFragment);
		}

		function getMessage(sender, message, to) {
			to = to || sender;
			console.log(sender + "   " + message + "   " + to);
			var newChatEl = createNewChat(sender, message);
			if (chatTo == to) {

				messageBoardEl.appendChild(newChatEl);
			} else {
				var toEl;
				if (usernameInputEl.value.toLowerCase() != "admin") {
					toEl = usernameListEl.querySelector('#admin');
				} else {
					toEl = usernameListEl.querySelector('#' + to);
				}

				addCountMessage(toEl);
			}

			if (chatRoom[to]) {
				chatRoom[to].push(newChatEl);

			} else {
				console.log(newChatEl);
				chatRoom[to] = [ newChatEl ];
			}
		}

		function removeUser(removedUsername) {
			var usernameList = usernameListEl.children;
			for (var i = 0; i < usernameList.length; i++) {
				var username = usernameList[i].textContent;
				if (username == removedUsername) {
					usernameListEl.removeChild(usernameList[i]);
				}
			}
		}

		function createNewChat(sender, message) {
			var newChatDivEl = document.createElement('div');
			var senderEl = document.createElement('span');
			var messageEl = document.createElement('span');

			if (sender == usernameInputEl.value)
				sender = 'me';

			senderEl.textContent = sender + "    :  ";
			messageEl.textContent = message;

			newChatDivEl.appendChild(senderEl);
			newChatDivEl.appendChild(messageEl);
			return newChatDivEl;
		}

		function addCountMessage(toEl) {
			var countEl = toEl.querySelector('.count');
			if (countEl) {
				var count = countEl.textContent;
				count = +count;
				countEl.textContent = count + 1;
				countEl.style.color = "red";
			} else {
				var countEl = document.createElement('span');
				countEl.classList.add('count');
				countEl.textContent = ' 1';
				countEl.style.color = "red";
				toEl.appendChild(countEl);
			}
		}

		sendBtnEl.onclick = sendMessage;
		chatToAllEl.onclick = chatToFn('admin');

		function sendMessage() {
			var message = messageInputEl.value;
			if (message == '')
				return;
			socket.send(chatTo + '|' + message);
			messageInputEl.value = '';

			var sender = usernameInputEl.value;
			getMessage(sender, message, chatTo);
			messageBoardEl.scrollTop = messageBoardEl.scrollHeight;
		}

		function chatToFn(username) {
			console.log(username);
			return function(e) {
				if (username == usernameInputEl.value)
					return;
				var countEl;
				if (usernameInputEl.value.toLowerCase() == "admin") {
					countEl = usernameListEl.querySelector('#' + username
							+ '>.count');
				} else {
					countEl = usernameListEl.querySelector('#' + "admin"
							+ '>.count');
				}

				if (countEl) {
					countEl.remove();
				}

				chatToEl.textContent = username;
				chatTo = username;
				messageBoardEl.innerHTML = '';
				console.log(chatRoom);
				var conversationList = chatRoom[chatTo];
				if (!conversationList)
					return;
				var df = document.createDocumentFragment();
				console.log(conversationList);
				conversationList.forEach(function(conversation) {
					console.log(conversation);
					// 	                	var con = document.createTextNode(conversation);
					df.appendChild(conversation);
				});
				messageBoardEl.appendChild(df);
			}
		}
	</script>

	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>


</body>
</html>

