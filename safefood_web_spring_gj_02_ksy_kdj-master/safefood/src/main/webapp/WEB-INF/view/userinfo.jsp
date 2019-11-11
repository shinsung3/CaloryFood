<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>

	<!-- 회원정보 폼 -->
	<c:url value="/user/modiuser" var="modi" />
	<form method="post" action="${modi}" id="updateForm">
		<input type="hidden" name="action" value="update">
		<div id="signUp_place">
			<div class="container">
				<div id="signUp_box">
					<h2>회원정보</h2>
					<div class="input_info">
						<span>아이디</span> <input type="text"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="아이디를 입력해주세요." value="${loginId.getId()}"
							disabled="disabled"> <input type="hidden" name="id"
							value="${loginId.getId()}">
					</div>
					<div class="input_info">
						<span>비밀번호</span> <input type="password" name="pw"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="영문 숫자 포함 6자리 이상" value="${loginId.getPw()}">
					</div>
					<div class="input_info">
						<span>이름</span> <input type="text" name="name"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="이름을 입력해주세요" value="${loginId.getName()}">
					</div>
					<div class="input_info">
						<span>주소</span> <input type="text" name="addr"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="주소를 입력해주세요" value="${loginId.getAddr()}">
					</div>
					<div class="input_info">
						<span>전화번호</span> <input type="tel" name="tel"
							style="width: 300px; height: 30px; font-size: 15px;"
							placeholder="010-xxxx-xxxx" value="${loginId.getTel()}">
					</div>
					<div class="input_info">
						<span>알레르기</span> <input type="hidden" id="allvalue"
							value="${loginId.getAllergy()}">
						<div id="input_allergy">
							<div class="allergy">
								<c:set var="al" value="${allergy}" />
								<input type="checkbox" id="대두" name="allergy" value="대두"
									${fn:contains(al,'대두')?"checked='checked'":""}> <span>대두</span>
								<input type="checkbox" id="땅콩"
									${fn:contains(al,'땅콩')?"checked='checked'":""} name="allergy"
									value="땅콩"> <span>땅콩</span> <input type="checkbox"
									id="우유" name="allergy" value="우유"
									${fn:contains(al,'우유')?"checked='checked'":""}> <span>우유</span>
								<input type="checkbox" id="게"
									${fn:contains(al,'게')?"checked='checked'":""} name="allergy"
									value="게"> <span>게</span>
							</div>
							<div class="allergy">
								<input type="checkbox" id="새우"
									${fn:contains(al,'새우')?"checked='checked'":""} name="allergy"
									value="새우"> <span>새우</span> <input type="checkbox"
									id="참치" ${fn:contains(al,'참치')?"checked='checked'":""}
									name="allergy" value="참치"> <span>참치</span> <input
									type="checkbox" id="연어"
									${fn:contains(al,'연어')?"checked='checked'":""} name="allergy"
									value="연어"> <span>연어</span> <input type="checkbox"
									id="쑥" ${fn:contains(al,'쑥')?"checked='checked'":""}
									name="allergy" value="쑥"> <span>쑥</span>
							</div>
							<div class="allergy">
								<input type="checkbox" id="소고기"
									${fn:contains(al,'소고기')?"checked='checked'":""} name="allergy"
									value="소고기"> <span>소고기</span> <input type="checkbox"
									id="닭고기" ${fn:contains(al,'닭고기')?"checked='checked'":""}
									name="allergy" value="닭고기"> <span>닭고기</span> <input
									type="checkbox" id="돼지고기"
									${fn:contains(al,'돼지고기')?"checked='checked'":""} name="allergy"
									value="돼지고기"> <span>돼지고기</span>
							</div>
							<div class="allergy">
								<input type="checkbox" id="복숭아"
									${fn:contains(al,'복숭아')?"checked='checked'":""} name="allergy"
									value="복숭아"> <span>복숭아</span> <input type="checkbox"
									id="민들레" ${fn:contains(al,'민들레')?"checked='checked'":""}
									name="allergy" value="민들레"> <span>민들레</span> <input
									type="checkbox" id="계란흰자"
									${fn:contains(al,'계란흰자')?"checked='checked'":""} name="allergy"
									value="계란흰자"> <span>계란흰자</span>
							</div>
						</div>
					</div>
					<div class="input_info signUp_submit">
						<input type="submit" value="수정"
							style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;">
						<c:url value="/user/singout" var="singout" />
						<button type="button"
							style="width: 50px; height: 30px; font-size: 15px; background: #343a40; color: white; border-radius: 5px;"
							onclick="location.href='${singout}'">탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>