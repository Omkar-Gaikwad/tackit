<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
we are heer

<%=request.getSession().getAttribute("username") %>

<% 
	List<String> urls = (List<String>)request.getSession().getAttribute("imageUrls");
System.out.println("object check" + urls);
	for (String str: urls) {
		System.out.println("in the jsp" + str);
	}
%>

<c:forEach var="item" items="${imageUrls}">
	juilee @ ${item}
</c:forEach>
</body>
</html>