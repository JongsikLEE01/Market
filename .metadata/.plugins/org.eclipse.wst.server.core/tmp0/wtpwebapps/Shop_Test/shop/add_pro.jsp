<!-- 상품 등록 처리 -->
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 폼 데이터 수신
    String productId = request.getParameter("productId");	  	// 상품아이디
    String name = request.getParameter("name");				  	// 상품명
    String reqUnitPrice = request.getParameter("unitPrice");  	// 단가
    String description = request.getParameter("description"); 	// 설명 
    String manufacturer = request.getParameter("manufacturer");	// 제조사
    String category = request.getParameter("category");			// 카테고리
    String reqUnitsInStock = request.getParameter("unitsInStock"); // 재고수
    String condition = request.getParameter("condition");	// 상태
    String file = request.getParameter("file");				// 파일경로
    
    Integer unitPrice = Integer.parseInt(reqUnitPrice);
    long unitsInStock= Long.parseLong(reqUnitsInStock);
    
    // User 객체 생성 및 값 설정
    Product product = new Product();
    product.setProductId(productId);
    product.setName(name);
    product.setUnitPrice(unitPrice);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(unitsInStock);
    product.setCondition(condition);
    product.setFile(file);

    ProductRepository productDAO = new ProductRepository();
    int result = productDAO.insert(product);

    // 결과에 따른 응답 페이지 리다이렉션
    if (result > 0) {
        // 상품등록 성공
        response.sendRedirect("complete.jsp?msg=1");
    } else {
        // 상품등록 실패
        out.println("<script>alert('상품등록 실패. 다시 시도해 주세요.'); history.back();</script>");
    }
    
%>