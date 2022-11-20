<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="<c:url value='/templates/web/css/base.css' />">
    <link rel="stylesheet" href="<c:url value='/templates/web/css/grid.css' />">
    <link rel="stylesheet" href="<c:url value='/templates/web/css/header.css' />">
    <link rel="stylesheet" href="<c:url value='/templates/web/css/footer.css' />">
    <link rel="stylesheet" href="<c:url value='/templates/web/css/responsive.css' />">
    <dec:title default="EGO.WEAR"></dec:title>
</head>
<body>
	<div class='app'>
	<!-- header start -->
	<%@ include file="/common/web/header.jsp" %>
	<!-- header end -->
	<!-- container start -->
	<div class='container'>
	<dec:body></dec:body>
	</div>
	<!-- container end -->
	<!-- footer start -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer end -->
	</div>
</body>
</html>