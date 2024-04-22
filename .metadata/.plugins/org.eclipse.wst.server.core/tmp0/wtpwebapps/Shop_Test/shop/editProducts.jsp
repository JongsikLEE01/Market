<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Products</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<% 
	String root = request.getContextPath(); 
	List<Product> productList = new ArrayList<Product>();
	ProductRepository productDAO = new ProductRepository();
	
	productList = productDAO.list();
%>
<body>   
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 편집</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="<%= root %>/shop/add.jsp" class="btn btn-primary btn-lg px-3 gap-2">상품 등록</a>
				<a href="<%= root %>/shop/editProducts.jsp" class="btn btn-success btn-lg px-3 gap-2">상품 편집</a>
			</div>
			
            <div class="container mt-5">
			    <div class="row">
			        <c:forEach var="product" items="<%= productList %>">
			            <div class="col-md-4 mb-3 px-2">
			                <div class="card" style="width: 14rem;">
			                    <img class="card-img-top" src="<%= request.getContextPath() %>${product.file}" alt="${product.name}">
			                    <div class="card-body">
			                        <h5 class="card-title">${product.name}</h5>
			                        <p class="card-text">${product.description}</p>
									<p class="card-price text-end">￦ ${product.unitPrice}</p>
			                        
			                        <div class="d-flex justify-content-between mt-1 mb-1">
   										 <a href="<%= root %>/shop/update.jsp?productId=${product.productId}" class="btn btn-primary btn-lg px-4 gap-3">수정</a>
   										 <form action="<%= root %>/shop/delete_pro.jsp" method="POST">
										 	<input type="hidden" name="productId" value="${ product.productId }">
   										 	<a href="<%= root %>/shop/delete_pro.jsp?productId=${product.productId}" class="btn btn-outline-danger btn-lg px-4">삭제</a>
   										 </form>
									</div>	
			                    </div>
			                </div>
			            </div>
			        </c:forEach>
				</div>
			</div>
			
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>