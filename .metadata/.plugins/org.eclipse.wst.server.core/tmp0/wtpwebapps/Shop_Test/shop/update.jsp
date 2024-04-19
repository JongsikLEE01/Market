<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="container shop p-5 mb-5" >
					<form action="join_pro.jsp" name="joinForm" method="post" >
						<div class="input-group mb-3 row">
							 <img class="w-100 p-2" src="<%= request.getContextPath() %>${product.file}">
						</div>
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">상품 이미지</label>
							<input type="text" class="form-control col-md-10" name="file" placeholder="선택된 파일 없음" required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">상품코드</label>
							<input type="password" class="form-control col-md-8" name="productId" required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">상품명</label>
							<input type="password" class="form-control col-md-8" name="name"  required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">가격</label>
							<input type="text" class="form-control col-md-8" name="unitPrice"  required>
						</div>
						
						<div class="input-group mb-3 row">
							<div class="col-md-12 p-0">
								<label class="input-group-text" id="">상세 정보</label>
							</div>
								<div class="col-md-12">
									<textarea class="form-control" style="heigth: 200px !improtant;" name="description"></textarea>
								</div>
						</div>
						
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">제조사</label>
							<input type="text" class="form-control col-md-8" name="manufacturer"  required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">분류</label>
							<input type="text" class="form-control col-md-8" name="category"  required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">재고 수</label>
							<input type="text" class="form-control col-md-8"  name="unitsInStock"  required>
						</div>
						
						<div class="input-group mb-3 row">
							<label class="input-group-text col-md-2" id="">상태</label>
							<div class="col-md-8 d-flex align-items-center">
							<div class="radio-box d-flex">
								<div class="radio-item mx-3">
									<input type="radio" class="form-check-input" name="quantity" value="신규 제품" id="quantity-new"> 
									<label for="quantity-female">신규 제품</label>
								</div>
								
								<div class="radio-item mx-3">
									<input type="radio" class="form-check-input " name="quantity" value="중고 제품" id="quantity-old"> 
									<label for="quantity-male">중고 제품</label>
								</div>
								
								<div class="radio-item mx-3">
									<input type="radio" class="form-check-input " name="quantity" value="재생 제품" id="quantity-recycled"> 
									<label for="quantity-male">재생 제품</label>
								</div>
							</div>
						</div>
						</div>						
					</form>
				</div>
				
				
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





