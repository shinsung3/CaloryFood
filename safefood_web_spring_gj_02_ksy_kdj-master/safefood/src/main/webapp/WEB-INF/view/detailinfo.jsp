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
	<!-- Page Content -->
	<div class="container">

		<!-- Jumbotron Header -->
		<header class="detail_header">
			<h1>제품 정보</h1>
			<c:url value="/static/img/shopping-bag.png" var="logo"/>
			<img class="detail_logo_img" src="${logo}">
		</header>
		<!-- Page Features -->
		<div class="detail_block row">
			<div class="col-lg-3 detail_img_box">
			<c:url value="${food.getImg()}" var="img"/>
				<img class="detail_img" style="margin: auto;" src="${img}">
			</div>
			<div class="col-lg-9">
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>제품명</h3>
					</div>
					<div class="detail_b col-lg-10 detail_name">
						<h3>${food.getName()}</h3>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>제조사</h3>
					</div>
					<div class="detail_b col-lg-10 detail_com">
						<h3>${food.getMaker()}</h3>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2">
						<h3>원재료</h3>
					</div>
					<div class="detail_b col-lg-10 detail_mat">
						<a>${food.getMaterial()}</a>
					</div>
				</div>
				<div class="border_line row">
					<div class="detail_f col-lg-2 detail_allergy">
						<h3>알레르기성분</h3>
					</div>
					<div class="detail_b col-lg-10">
						<c:if test="${!empty allergy}">
							<a>${allergy}</a>
						</c:if>
					</div>
				</div>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-lg-4">
						<h2>Quantity</h2>
					</div>
				</div>
				<div class="row" style="height: 40px;">
					<div class="col-lg-4">
						<input type="number" class="form-control" aria-label="Large"
							aria-describedby="inputGroup-sizing-sm" placeholder="1">
					</div>
				</div>
				<div class="row" style="margin: 10px">
					<div class="info_bt col-lg-4">
					<c:url value="/eatfood" var="eat"/>
						<button type="button"
							onclick="location.href='${eat}?code=${food.getCode()}'"
							class="btn btn_d btn-outline-info">추가</button>
						<button type="button" class="btn btn_d btn-outline-info">찜</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			<h2>영양 정보</h2>
		</div>
		<div class="row chart_block">
			<div id="chartdiv" class="col-lg-8"></div>
			<div id="nut_info" class="col-lg-4">
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">Serving Size</div>
					<div class="col-lg-6 ss_info">${food.getSupportpereat()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">Kcal</div>
					<div class="col-lg-6 k_info">${food.getCalory()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">carbohydrate</div>
					<div class="col-lg-6 c_info">${food.getCarbo()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">protein</div>
					<div class="col-lg-6 p_info">${food.getProtein()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">fat</div>
					<div class="col-lg-6 f_info">${food.getFat()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6">sugars</div>
					<div class="col-lg-6 s_info">${food.getSugar()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">natrium</div>
					<div class="col-lg-6 n_info">${food.getNatrium()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">cholesterol</div>
					<div class="col-lg-6 chole_info">${food.getChole()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">saturated fat</div>
					<div class="col-lg-6 satu_info">${food.getFattyacid()}</div>
				</div>
				<div class="mat_info_table row border_line">
					<div class="col-lg-6 ">trans fat</div>
					<div class="col-lg-6 tran_info">${food.getTransfat()}</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"></jsp:include>
</body>
<script>
	// <!-- Chart code -->
	// Themes begin
	am4core.useTheme(am4themes_frozen);
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.PieChart);

	$.ajax({
		<c:url value="/detail/chart" var="chart"/>
		url : "${chart}",
		type : "POST",
		dataType : "json",
		data : "code=${food.getCode()}",
		success : function(res) {
			console.log(res);
			chart.data = [ {
				"nutrition" : "Kcal",
				"kcal" : res.calory
			}, {
				"nutrition" : "carbo",
				"kcal" : res.carbo
			}, {
				"nutrition" : "protein",
				"kcal" : res.protein
			}, {
				"nutrition" : "fat",
				"kcal" : res.fat
			}, {
				"nutrition" : "sugars",
				"kcal" : res.sugar
			}, {
				"nutrition" : "natrium",
				"kcal" : res.natrium
			}, {
				"nutrition" : "chole",
				"kcal" : res.chole
			}, {
				"nutrition" : "supportpereat",
				"kcal" : res.supportpereat
			}, {
				"nutrition" : "transfat",
				"kcal" : res.transfat
			} ];
		}
	});

	console.log(chart.data);
	// Add data
	// chart.data = [{
	// 		"nutrition": "Lithuania",
	// 		"kcal": 301.9
	// 	}, {
	// 		"nutrition": "Czech Republic",
	// 		"kcal": 301.9
	// 	},
	// 	{
	// 		"nutrition": "Ireland",
	// 		"kcal": 201.1
	// 	}, {
	// 		"nutrition": "Germany",
	// 		"kcal": 165.8
	// 	}, {
	// 		"nutrition": "Australia",
	// 		"kcal": 139.9
	// 	}, {
	// 		"nutrition": "Austria",
	// 		"kcal": 128.3
	// 	}, {
	// 		"nutrition": "UK",
	// 		"kcal": 99
	// 	}, {
	// 		"nutrition": "Belgium",
	// 		"kcal": 60
	// 	},
	// 	{
	// 		"nutrition": "The Netherlands",
	// 		"kcal": 50
	// 	}];
	// console.log(chart.data);

	// Add and configure Series
	var pieSeries = chart.series.push(new am4charts.PieSeries());
	pieSeries.dataFields.value = "kcal";
	pieSeries.dataFields.category = "nutrition";
	pieSeries.slices.template.stroke = am4core.color("#fff");
	pieSeries.slices.template.strokeWidth = 2;
	pieSeries.slices.template.strokeOpacity = 1;

	// This creates initial animation
	pieSeries.hiddenState.properties.opacity = 1;
	pieSeries.hiddenState.properties.endAngle = -90;
	pieSeries.hiddenState.properties.startAngle = -90;



</script>

</html>