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
integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
crossorigin="anonymous"/>
<link rel="stylesheet" href="<c:url value='/templates/admin/css/base.css' /> ">
<link rel="stylesheet" href="<c:url value='/templates/admin/css/grid.css' /> ">
<link rel="stylesheet" href="<c:url value='/templates/admin/css/header.css' /> ">
<link rel="stylesheet" href="<c:url value='/templates/admin/css/sidebar.css' /> ">
<dec:title>Quản trị</dec:title>
</head>
<body>
<div class='app'>
<!-- header start -->
<%@ include file="/common/admin/header.jsp" %>
<!-- header end -->
<!-- container start -->
<div class='container'>
<div class='grid wide'>
<div class='row'>
<div class='col l-3'>
<%@ include file="/common/admin/sidebar.jsp" %>
</div>
<div class='col l-9'>
<dec:body></dec:body>
</div>
</div>
</div>
</div>
<!-- container end -->

</div>
</body>
</html>