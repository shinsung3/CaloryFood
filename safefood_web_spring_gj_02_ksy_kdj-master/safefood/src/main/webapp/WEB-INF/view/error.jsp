<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<h1>Error</h1>
	<%=request.getAttribute("msg")%>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
</html>