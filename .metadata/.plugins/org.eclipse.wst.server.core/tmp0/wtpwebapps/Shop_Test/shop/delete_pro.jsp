<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String productId = request.getParameter("productId");

	ProductRepository productDAO = new ProductRepository();
	int result = productDAO.delete(productId);
	
	// 결과에 따른 응답 페이지 리다이렉션
    if (result > 0) {
        // 상품삭제 성공
        response.sendRedirect("editProducts.jsp");
    } else {
        // 상품삭제 실패
        out.println("<script>alert('상품 삭제 실패. 다시 시도해 주세요.'); history.back();</script>");
    }
%>