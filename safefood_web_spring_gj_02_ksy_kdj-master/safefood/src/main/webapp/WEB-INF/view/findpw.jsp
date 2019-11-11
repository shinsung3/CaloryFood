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
	<c:url value="/user/findpwForm" var="pwform" />
	<form method="post" action="${pwform}" id="findPwForm">
		<div class="input_info">
			<span>아이디</span> <input type="text" name="id"
				style="width: 300px; height: 30px; font-size: 15px;"
				placeholder="아이디를 입력해주세요." value="${user.getId() }">
		</div>
		<div class="input_info">
			<span>전화번호</span> <input type="tel" name="tel"
				style="width: 300px; height: 30px; font-size: 15px;"
				placeholder="010-xxxx-xxxx" value="${user.getTel() }">
		</div>
		<input type="submit" value="비밀번호 찾기"
			style="width: 150px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">
	</form>

	<c:if test="${!empty user}">
		<c:url value="/user/changePw" var="chpw" />
		<form method="post" action="${chpw}" id="RePwForm">
			<input type="hidden" name="id" value="${user.getId()}">

			<div class="input_info">
				<span>비밀번호</span> <input type="password" name="pw"
					style="width: 300px; height: 30px; font-size: 15px;"
					placeholder="비밀번호를 입력해주세요.">
			</div>

			<div class="input_info">
				<span>비밀번호 확인</span> <input type="password" name="pwck"
					style="width: 300px; height: 30px; font-size: 15px;"
					placeholder="비밀번호를  다시 입력해주세요.">
			</div>
			<input type="submit" value="비밀번호 바꾸기"
				style="width: 150px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">

		</form>
	</c:if>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>