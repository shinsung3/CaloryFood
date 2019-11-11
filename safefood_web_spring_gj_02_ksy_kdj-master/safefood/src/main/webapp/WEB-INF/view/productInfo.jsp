<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.label {
	height: 25px;
	display: inline;
	padding: .2em .6em .3em;
	font-size: medium;
	font-weight: 700;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: .25em;
	line-height: 18px;
	margin: 8px 5px;
}

.label-danger {
	background-color: #d9534f;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container">
		<!-- Page Features -->
		<div id="infodesk" class="row text-center">
			<c:if test="${!empty food}">
				<c:forEach var="f" items="${food}">
					<div class="col-lg-6">
						<div class="infoblock">
							<c:url value="${f.getImg()}" var="img" />
							<span class="imgblock"> <img class=infoimg src="${img}">
							</span>
							<div>
								<div style="margin-top: 10px; margin-bottom: 10px;">
									<h4 class="p_name">
										<c:url value="/detail?code=${f.getCode()}" var="detail"></c:url>
										<a href="${detail}">${f.getName()}</a>
									</h4>
									<div class="infomat">
										<a class="font_fix">${f.getMaterial()}</a>
									</div>

								</div>
							</div>
							<div class="info_bt">
								<c:if test="${!empty allergy}">
									<c:set var="doneLoop" value="false" />
									<c:forEach var="a" items="${ allergy}">
										<c:if test="${not doneLoop}">
											<c:if test="${fn:contains(f.getMaterial(), a)}">
												<span class="label label-danger">알레르기주의</span>
												<c:set var="doneLoop" value="true" />
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<c:url value="/eatfood" var="eat"/>
								<button type="button"
									onclick="location.href='${eat}?code=${f.getCode()}'"
									class="btn btn_d btn-outline-info">추가</button>
								<button type="button" class="btn btn-outline-info"
									style="margin-left: 5px;">찜</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>

</body>
<script>

$(document).on('click','#search_bt',function(){
	var name = $("#search_input").val();
	var option = $("#selected option:selected").val();
	if(name){
		$.ajax({
			<c:url value="/search/ajax" var="ajax"/>
			url:"${ajax}",
			type:"post",
			data: "by="+option+"&name="+name,
			success:function(data){
				$("#infodesk").empty();
				$.each(data,function(idx, data) {
					console.log(data);
					<c:url value="/detail?code=" var="fdetail"></c:url>
					var str2 = '<div class="col-lg-6"> <div class="infoblock"><span class="imgblock">'
									+ '<img class="infoimg" src="/SF_WS_03' + data.img + '"></span>'
									+ '<div><div><h4 class="p_name" style="margin-top:10px; margin-bottom:10px;">'
									+'<a href="${fdetail}'+data.code
									+ '">'
									+ data.name
									+'</a>'
									+ '</h4>'
									+ '<div class="infomat"><a class="font_fix">'
									+ data.material
									+ '</a></div></div>'
									+ '<div class="info_bt"><button type="button" class="btn btn-outline-info" style="margin-left:5px;">추가</button><button type="button" class="btn btn-outline-info" style="margin-left:5px;">찜</button></div></div>'
									+ '</div> </div>';
					$("#infodesk").append(str2);
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
</script>
</html>