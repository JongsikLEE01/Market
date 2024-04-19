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
	// 데이터 베이스에서 상품 목록 가져와서 그리드로 뿌려야될듯
%>
<body>   
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 등록</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				
				<!--  미니 프로젝트 했던거 사장님 상품 추가 코드 보면 될듯? -->
			</div>
		</div>
	</div>
	<div class="container">
	    <div class="row justify-content-between">
	        <div class="col-auto">
	            <a href="<%= root %>/shop/products.jsp" class="btn btn-secondary btn-lg">목록</a>
	        </div>
	        <div class="col-auto">
	            <a href="<%= root %>/shop/add_pro.jsp" class="btn btn-primary btn-lg">등록</a>
	        </div>
	    </div>
	</div>


	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





