<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap core CSS -->
<c:url value="/static/vendor/bootstrap/css/bootstrap.min.css"
	var="vendor" />
<link href="${vendor }" rel="stylesheet">

<!-- Custom styles for this template -->
<c:url value="/static/css/heroic-features.css" var="heroic" />
<link href="${heroic}" rel="stylesheet">
<c:url value="/static/css/main.css" var="maincss" />
<link href="${maincss}" rel="stylesheet">
<c:url value="/static/css/modal.css" var="modalcss" />
<link href="${modalcss }" rel="stylesheet">
<c:url value="/static/css/signUp.css" var="signupcss" />
<link href="${signupcss }" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<c:url value="/static/vendor/jquery/jquery.min.js" var="jq" />
<script src="${jq}"></script>
<c:url value="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"
	var="js" />
<script src="${js}"></script>

<!-- Pie Chart Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/frozen.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<nav id="login_place">
	<div class="container">
		<div id="login_nav">
			<c:if test="${empty loginId}">
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					data-toggle="modal" data-target="#myModal">Login</button>
				<c:url value="/user/signup" var="signup" />
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					onclick="location.href='${signup}'">회원가입</button>
			</c:if>
			<c:if test="${!empty loginId }">
				<a style="color:white">${loginId.getId()}님 환영합니다.  </a>
				<c:url value="/user/godetailUser" var="deuser"/>
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					onclick="location.href='${deuser}'">회원정보</button>
					<c:url value="/user/logout" var="logout"/>
				<button type="button"
					class="btn btn-outline-light login_btn login_nav_btn"
					onclick="location.href='${logout}'">Logout</button>
			</c:if>
		</div>
	</div>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				<c:url value="/user/login" var="login" />
					<form action="${login}" method="post" id="loginForm">
						<input type="hidden" name="action" value="login">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" name="id"
									placeholder="Id" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="pw"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group">
							<!-- <button class="btn btn-primary btn-block btn-lg" onclick="location.href='index_login.html' ">ㄴㄴ</button> -->
							<input type="submit" class="btn btn-primary btn-block btn-lg"
								value="로그인">
						</div>
						<p class="hint-text">
						<c:url value="/user/findpw" var="findpw"/>
							<a href="${findpw}">비밀번호를 잊으셨나요?</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					아직 계정이 없으신가요? <a href="${signup }">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</nav>

<nav id="menu_place">
	<div class="container">
		<div id="img_place">
			<c:url value="/static/img/ssafy_Mark.jpg" var="mark" />
			<c:url value="/index" var="index" />
			<a href="${index}"><img src="${mark}" width=100px height=70px></a>
		</div>

		<div id="menu_nav">
			<ul>
				<li><a href="#" class="menu_a">공지 사항</a></li>
				<c:url value="/productInfo" var="pinfo" />
				<li><a href="${pinfo}" class="menu_a">상품 정보</a></li>
				<li><a href="#" class="menu_a">베스트 섭취 정보</a></li>
				<c:if test="${!empty loginId}">
				<c:url value="/user/eatfood" var="eatf"/>
				<li><a href="${eatf}" class="menu_a">내 섭취 정보</a></li>
				<li><a href="#" class="menu_a">예상 섭취 정보</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<c:if test="${empty detail}">

	<div id="top_place">
		<div class="container">
			<div id="top_title">
				<h1>What We Provide</h1>
				<hr>
				<h3>건강한 삶을 위한 먹거리 프로젝트</h3>
			</div>
		</div>
	</div>

	<div id="search_place">
		<div class="container">
			<div id="search_box">
				<div id="condition" class="search_div">
					<h5>검색 조건</h5>
					<select id="selected"
						style="width: 100px; height: 30px; font-size: 15px;">
						<option class="s_option"
							style="width: 100px; height: 30px; font-size: 15px;">상품명</option>
						<option class="s_option"
							style="width: 100px; height: 30px; font-size: 15px;">제조사</option>
						<option class="s_option"
							style="width: 100px; height: 30px; font-size: 15px;">재료명</option>
					</select>
				</div>
				<div id="search_word" class="search_div">
					<h5>검색 단어</h5>
					<div id="text_button">
						<input id="search_input" type="text" class="float_left" size="40"
							style="width: 300px; height: 30px; font-size: 15px;"> <input
							id="search_bt" type="button" class="float_left" value="검색"
							style="width: 80px; height: 30px; margin-left: 15px;">
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
