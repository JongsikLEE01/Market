<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.InputStream"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String productId = request.getParameter("productId");

%>
<script>
 	window.location.href = "cart.jsp?productId=" + encodeURIComponent("<%= productId %>");
 	alert(<%= productId %>);
</script>
<body>
</body>
</html>