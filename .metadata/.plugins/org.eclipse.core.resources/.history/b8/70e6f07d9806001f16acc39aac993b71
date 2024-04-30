<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	// 삭제 구현해야됨
	// 삭제 버튼 클릭 후 이벤트니까
	// productRepository 하나 새로 만들고, .delete로 하고, result 반환 하면 될듯 ?
	String productId = request.getParameter("productId");

	ProductRepository productDao = new ProductRepository();
	
	int result = productDao.delete(productId);
	
	if(result > 0) {
		response.sendRedirect("editProducts.jsp");
	}
	else {
	    out.println("<script>alert('제품 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
	}
	
%>
<body>

</body>
</html>