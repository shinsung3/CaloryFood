<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<!-- 회원가입 폼 -->
	<c:url value="/user/signup" var="signup"></c:url>
	<form method="post" action="${signup}" id="signUpForm">
		<div id="signUp_place">
			<div class="container">
				<div id="signUp_box">
					<h2>회원가입</h2>
					<c:if test="${!empty alarm}">
						<div class="input_info">
							<a style="color:red">${alarm}</a>
						</div>
					</c:if>
					<div class="input_info">
						<span>아이디</span> <input type="text" name="id"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="아이디를 입력해주세요." value="${prev.getId()}">
					</div>
					<div class="input_info">
						<span>비밀번호</span> <input type="password" name="pw"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="영문 숫자 포함 6자리 이상">
					</div>
					<div class="input_info">
						<span>이름</span> <input type="text" name="name"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="User Name" value="${prev.getName()}">
					</div>
					<div class="input_info">
						<span>주소</span> <input type="text" name="addr"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="address" value="${prev.getAddr()}">
					</div>
					<div class="input_info">
						<span>전화번호</span> <input type="tel" name="tel"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="010-xxxx-xxxx" value="${prev.getTel()}">
					</div>
					<div class="input_info">
						<span>알레르기</span>
						<div id="input_allergy">
							<div class="allergy">
								<input type="checkbox" name="allergy" value="대두"><span>대두</span>
								<input type="checkbox" name="allergy" value="땅콩"><span>땅콩</span>
								<input type="checkbox" name="allergy" value="우유"><span>우유</span>
								<input type="checkbox" name="allergy" value="게"><span>게</span>
							</div>
							<div class="allergy">
								<input type="checkbox" name="allergy" value="새우"><span>새우</span>
								<input type="checkbox" name="allergy" value="참치"><span>참치</span>
								<input type="checkbox" name="allergy" value="연어"><span>연어</span>
								<input type="checkbox" name="allergy" value="쑥"><span>쑥</span>
							</div>
							<div class="allergy">
								<input type="checkbox" name="allergy" value="소고기"><span>소고기</span>
								<input type="checkbox" name="allergy" value="닭고기"><span>닭고기</span>
								<input type="checkbox" name="allergy" value="돼지고기"><span>돼지고기</span>
							</div>
							<div class="allergy">
								<input type="checkbox" name="allergy" value="복숭아"><span>복숭아</span>
								<input type="checkbox" name="allergy" value="민들레"><span>민들레</span>
								<input type="checkbox" name="allergy" value="계란흰자"><span>계란흰자</span>
							</div>
						</div>
					</div>
					<div class="input_info signUp_submit">
						<input type="submit" value="등록"
							style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">
					</div>
				</div>
			</div>
		</div>
	</form>


	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>