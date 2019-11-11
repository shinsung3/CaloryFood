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
	<div class="container main_block">
		<div class="jumbotron my-4 row"
			style="display: block; clear: both; align-content: center; text-align: center;">
			<div class="row"
				style="margin: auto; text-align: center; align-content: center; display: block;">
				<h2>섭취정보</h2>
			</div>
			<c:if test="${!empty list}">
				<c:forEach var="f" begin="0" end="${list.size()-1}">
					<div class="card my-4 col-md-5"
						style="text-align: center; align-content: center; display: inline-block; margin: 10px;">
						<c:url value="${list[f].getImg()}" var="img"/>
						<img src="${img}" alt="Avatar" style="width: 50%">
						<div class="container">
							<h4>
								<a
									href="detailinfo.food?action=detail&code=${list[f].getCode()}">${list[f].getName()}</a>
							</h4>
							<p>섭취날짜: ${foods[f].getDate()}</p>
							<c:if test="${!empty user }">
								<c:set var="doneLoop" value="false" />
								<c:forEach var="a" items="${loginId.getAllergy()}">
									<c:if test="${not doneLoop}">
										<c:if test="${fn:contains(list[f].getMaterial(), a)}">
											<span class="label label-danger">알레르기주의</span>
											<c:set var="doneLoop" value="true" />
										</c:if>
									</c:if>
								</c:forEach>
							</c:if>
							<c:url value="/deleteEat" var="deat"/>
							<button type="button"
								onclick="location.href='${deat}?eatcode=${foods[f].getEatcode()}'"
								class="btn btn_d btn-outline-info">삭제</button>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>