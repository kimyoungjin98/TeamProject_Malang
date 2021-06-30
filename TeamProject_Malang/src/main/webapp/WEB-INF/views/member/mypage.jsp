<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap");

@font-face {
	font-family: 'TmoneyRoundWindRegular';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindRegular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "Noto Sans KR", sans-serif;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	margin: 0;
}

/* div.login{ */
div.mypage {
	display: flex;
	justify-content: center;
	position: relative;
	width: 70%;
	margin: 40px auto;
	animation: login_down 0.5s;
}

@keyframes login_down {
	0%
	{
		transform: translateY(-50%);
		opacity: 0.3;
	}
	
	100%	{
		transform : translateY(0);
		opacity : 1;
	}
}

a#logo {
	cursor: pointer;
	text-decoration: none;
	font-family: 'TmoneyRoundWindRegular';
	color: rgba(235, 164, 123, 0.993);
	font-size: 40px;
	margin-top: 45px;
	margin-left: -490px;
}

div.logo {
	position: relative;
	width: 70%;
	margin: 40px auto;
	display: flex;
}

/* div.main {
	position: absolute;
    top: 100px;
    left: 50%;
    width: 500px;
    padding: 15%;
    margin: 0 -335px;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-top: 2px solid rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
} */
div.my_info {
	position: absolute;
	top: 100px;
	left: 50%;
	padding: 7%;
	margin: 0 -335px;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-top: 2px solid rgba(0, 0, 0, 0.7);
	display: flex;
	justify-content: center;
}

/* input#user, input#pw, input#name { */
.id, .name, .addr, .tel {
	display: inline-block;
	width: 200px;
	padding: 6%;
	margin: 2px;
	outline: none;
	font-size: 15px;
	text-align: center;
}

div.input ul {
	font-size: 16px;
	display: flex;
	list-style: none;
	justify-content: space-between;
	vertical-align:middle;
	align-items: center;
	margin: 8px;
	font-weight: bold;
	background-color: 
}

div.input ul li img{
	width: 28px;
	margin-right: 15px;
}

.btn_wrap button {
	padding: 12px;
	color: white;
	background-color: rgba(235, 164, 123, 0.8);
	font-size: 17px;
	font-weight: bold;
	/* }

.btn_wrap button{ */
	border: none;
	display: block;
	width: 98%;
	margin-left: 5px;
	margin-top: 8px;
}

.btn_wrap button:hover {
	background-color: rgba(235, 148, 122, 0.9);
	cursor: pointer;
	transition: 0.5s;
}
</style>
</head>
<body>
	<div class="mypage">
		<a href="${rootPath}" id=logo>MALANG</a>
		<div class="my_info">
			<form method="post">
				<div class="input">
					<ul>
						<li><img src="${rootPath}/static/icons/my_icon.png"/></li>
						<li>아이디(ID)</li>
						<li class="id">${MEMBER.mb_id}</li>
					</ul>

					<ul>
					<li><img src="${rootPath}/static/icons/my_icon.png"/></li>
						<li>이름</li>
						<li class="name">${MEMBER.mb_name}</li>
					</ul>
					
					<ul>
					<li><img src="${rootPath}/static/icons/my_icon.png"/></li>
						<li>전화번호</li>
						<li class="tel">${MEMBER.mb_tel}</li>
					</ul>
					
					<ul>
					<li><img src="${rootPath}/static/icons/my_icon.png"/></li>
						<li>주소</li>
						<c:if test="${empty MEMBER.mb_addr}">
							<li class="tel">없음</li>
						</c:if>
						<li class="addr">${MEMBER.mb_addr}</li>
					</ul>

				</div>

				<div class="btn_wrap">
					<button id="update">정보수정</button>
					<button id="cart">장바구니</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>