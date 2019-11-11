<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style>
div.jumbotron:hover div.for_hover {
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/include/header.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container main_block">
		<c:if test="${!empty food}">
			<c:forEach var="f" items="${food}">
				<div class="jumbotron my-4 row">
					<div class="col-lg-3 main_img_box">
						<c:url value="${f.getImg()}" var="img" />
						<img class="main_img" src="${img}">
						<div class="for_hover">
							<h2 style="color: white; margin-top: 14px;">${f.getMaker()}
							</h2>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="main_name border_line row">
							<h2 class="p_name">
								<c:url value="/detail?code=${f.getCode()}" var="detail"></c:url>
								<a href="${detail}">${f.getName()}</a>
							</h2>
							<c:if test="${!empty allergy}">
								<c:set var="doneLoop" value="false" />
								<c:forEach var="a" items="${allergy}">
									<c:if test="${not doneLoop}">
										<c:if test="${fn:contains(f.getMaterial(), a)}">
											<span class="label label-danger">알레르기주의</span>
											<c:set var="doneLoop" value="true" />
										</c:if>

									</c:if>
								</c:forEach>
							</c:if>

						</div>
						<div class="main_mat row">
							<a>${f.getMaterial()}</a>
						</div>
						<div class="main_bt">
							<div class="info_bt row">
								<c:url value="/eatfood" var="eat"/>
								<button type="button"
									onclick="location.href='${eat}?code=${f.getCode()}'"
									class="btn btn_d btn-outline-info">추가</button>
								<button type="button" class="btn btn_d btn-outline-info">찜</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>

<script>

$(document).on('click','#search_bt',function(){
	var name=$('#search_input').val();
	var option=$('#selected option:selected').val();
	console.log(name+" "+option);
	if(name){
		let data={'by':option,'name':name};
		console.log(data);
		$.ajax({
			<c:url value="/search/ajax" var="ajax"/>
			url:"${ajax}",
			type:"post",
			/* contentType:'application/json;charset=utf-8',   */
			data: "by="+option+"&name="+name,	
			success:function(data){
				$(".main_block").empty();
				$.each(data,function(idx, data) {
					console.log(data.img);
					<c:url value="/detail?code=" var="fdetail"></c:url>
							var str2 = '<div class="jumbotron my-4 row">'
									+ '<div class="col-lg-3 main_img_box">'
									+ '<img class="main_img" src="/SF_WS_03' + data.img + '">'
									+ '<div class="for_hover"><h2 style="color:white; margin-top:14px;">'
									+ data.maker
									+ '</h2></div></div>'
									+ '<div class="col-lg-9"><div class="main_name border_line row">'
									+ '<h2 class="p_name"><a href="${fdetail}'+data.code
									+ '">'
									+ data.name
									+ '</a>'
									+ '</h2></div><div class="main_mat row">'
									+ '<a>'
									+ data.material
									+ '</a></div><div class="main_bt">'
									+ '<div class="info_bt row">'
									+ '<button type="button" class="btn btn_d btn-outline-info">추가</button><button type="button" class="btn btn_d btn-outline-info">찜</button></div></div></div></div>';
							$(".main_block").append(str2);
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
