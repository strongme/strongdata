<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.ico">
<title>StrongData</title>
</head>
<body>
 <img alt="" src="<%=request.getContextPath()%>/resources/img/bg.jpg" style="position: fixed;left: 0px;top: 0px;z-index: -1000000;width: 100%;opacity:0.24;" >
<div class="container">
<t:insertAttribute name="head"></t:insertAttribute>
</div>
<div class="container">
<t:insertAttribute name="body"></t:insertAttribute>
</div>
</body>
</html>