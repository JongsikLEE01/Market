<!-- 상품 수정 처리 -->
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 폼 데이터 수신
    String productId = request.getParameter("productId");
    String name = request.getParameter("name");
    String reqUnitPrice = request.getParameter("unitPrice");
    String description = request.getParameter("description");
    String manufacturer = request.getParameter("manufacturer");
    String category = request.getParameter("category");
    String reqUnitsInStock = request.getParameter("unitsInStock");
    String reqQuantity = request.getParameter("quantity");
    String file = request.getParameter("file");
	
    int unitPrice = Integer.valueOf(reqUnitPrice);
    int unitsInStock= Integer.valueOf(reqUnitsInStock);
    int quantity= Integer.valueOf(reqQuantity);
   
    // User 객체 생성 및 값 설정
    Product product = new Product();
    product.setProductId(productId);
    product.setName(name);
    product.setUnitPrice(unitPrice);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(unitsInStock);
    product.setQuantity(quantity);
    product.setFile(file);

    // 데이터베이스 연결 및 사용자 추가 로직
    ProductRepository productDAO = new ProductRepository();
    int result = productDAO.insert(product);

    // 결과에 따른 응답 페이지 리다이렉션
    if (result > 0) {
        // 회원 가입 성공
        response.sendRedirect("complete.jsp?msg=1");
    } else {
        // 회원 가입 실패
        out.println("<script>alert('상품등록 실패. 다시 시도해 주세요.'); history.back();</script>");
    }
%>