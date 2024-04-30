<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ship</title>
	<jsp:include page="/layout/meta.jsp" /> <jsp:include page="/layout/link.jsp" />
</head>
<%
	// 로그인 정보 받아와서 비회원인지 회원인지 check
	String loginId = (String) session.getAttribute("loginId");

	boolean checkLogin = false;
	
	if(loginId != null) {
		checkLogin = true;	
	}

	String name = request.getParameter("name");
	String deliveryDate = request.getParameter("deliveryDate");
	String nation = request.getParameter("nation");
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("address");
 	String phone = request.getParameter("phone");
 	int total = 0;
 	int sum = 0;
 	String orderForm = "비회원 주문";
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");

    if (cartList == null) {
        response.sendRedirect("/error/exception.jsp");
    }
%>
<body>   
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	
	<!-- 배송 정보 영역 -->
	<div class="container shop p-5 mb-5" >
		<form action="complete.jsp" name="DeliveryForm" method="post" >
		<div class="input-group mb-3 row">
			<%
			if(checkLogin) {
				orderForm = "회원 주문";
			} else {
				orderForm = "비회원 주문";
			}
			
			%>
			<p> 주문 형태 : &nbsp; &nbsp; &nbsp; &nbsp; 
				<%= orderForm %> </p> <hr>
		</div>
		
		<div class="input-group mb-3 row">
			<p> 성명 : &nbsp; &nbsp; &nbsp; &nbsp; <%= name %> </p> <hr>
		</div>
		
		<div class="input-group mb-3 row">
			<p> 배송일 : &nbsp; &nbsp; &nbsp; &nbsp; <%= deliveryDate %> </p> <hr>
		</div>
		
		<div class="input-group mb-3 row">
			<p> 국가명 : &nbsp; &nbsp; &nbsp; &nbsp; <%= nation %> </p> <hr>
		</div>
		
		<div class="input-group mb-3 row">
		    <p> 우편번호 : &nbsp; &nbsp; &nbsp; &nbsp; <%= zipCode %> </p> <hr>
		</div>
		
		<div class="input-group mb-3 row">
			<p> 주소 : &nbsp; &nbsp; &nbsp; &nbsp; <%= address %> </p> <hr>
		</div>
		
		<div class="input-group mb-6 row">
		    <p> 전화번호 : &nbsp; &nbsp; &nbsp; &nbsp; <%= phone %> </p> <hr>
		</div>
		<%
		 if(!checkLogin) {
		%>
		<div class="input-group mb-3 row">
			<label class="col-md-3" id="">주문 비밀번호 : </label>
			<input type="text" class="form-control col-md-8" 
				   name="password" required>
		</div>
		<% } %>
		
		<div class="container mt-5">
		    <!-- 장바구니 상품 목록 -->
		    <table class="table table-striped table-hover table-bordered text-center align-middle">
		        <thead class="table-primary">
		            <tr>
		                <th>상품</th>
		                <th>가격</th>
		                <th>수량</th>
		                <th>소계</th>
		                <th>비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <% if (cartList != null && !cartList.isEmpty()) {
		                
		                for (Product product : cartList) {
		                    total = product.getUnitPrice() * product.getQuantity();
		                    sum += total;
		            %>
		            <tr>
		                <td><%= product.getName() %></td>
		                <td><%= product.getUnitPrice() %></td>
		                <td><%= product.getQuantity() %></td>
		                <td><%= total %></td>
		                <td></td>
		            </tr>
		            <% }
		            %>
		            <tr>
		                <td colspan="3">총액</td>
		                <td><%= sum %></td>
		                <td></td>
		            </tr>
		            <% } else { %>
		            <tr>
		                <td colspan="5">장바구니에 담긴 상품이 없습니다.</td>
		            </tr>
		            <% } %>
		        </tbody>
		    </table>
	    <!-- 배송 정보 전달을 위한 hidden 타입 -->	
		<input type="hidden" name="orderForm" value="<%= orderForm %>">
		<input type="hidden" name="name" value="<%= name %>">
		<input type="hidden" name="deliveryDate" value="<%= deliveryDate %>">
		<input type="hidden" name="nation" value="<%= nation %>">
		<input type="hidden" name="zipCode" value="<%= zipCode %>">
		<input type="hidden" name="address" value="<%= address %>">
		<input type="hidden" name="phone" value="<%= phone %>">
		<input type="hidden" name="sum" value="<%= sum %>">
		
		</div>
			<div class="d-md-flex justify-content-between mt-5 mb-5">
			    <!-- 왼쪽 버튼 -->
			    <div>
			        <a href="ship.jsp" class="btn btn-lg btn-success">이전</a>
			        <a href="/Shop_Test/" class="btn btn-lg btn-danger">취소</a>
			    </div>
			    <!-- 오른쪽 버튼 -->
			    <div>
			        <input type="submit" class="btn btn-lg btn-primary" value="주문완료" />
			    </div>
			</div>
		</form>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>