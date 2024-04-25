<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<% 
	String root = request.getContextPath(); 
	String productId = request.getParameter("productId");
	
	ProductRepository productDAO = new ProductRepository();
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
   
    if (productId != null) {
        Product product = productDAO.getProductById(productId);
        if (product != null) {
            if (cartList == null) {
                cartList = new ArrayList<Product>();
                session.setAttribute("cartList", cartList);
            }
            boolean duplicate = false;
            for (Product item : cartList) {
                if (item.getProductId().equals(productId)) {
                    duplicate = true;
                    item.setQuantity(item.getQuantity() + 1);
                    break;
                }
            }
            
            if (!duplicate) {
                product.setQuantity(1);
                cartList.add(product);
            }

            response.sendRedirect("products.jsp");
	    } else
	        response.sendRedirect("error.jsp");
	}
    
    // 로그인 확인
    String loginId = (String) session.getAttribute("loginId");
	boolean checkLogin = false;
	String loginform = "";
	
	if(loginId != null) checkLogin = true;	
	
	if(checkLogin) loginform = "회원 주문";
	else loginform = "비회원 주문";
	
	String name = request.getParameter("name");
	String deliveryDate = request.getParameter("deliveryDate");
	String nation = request.getParameter("nation");
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("address");
 	String phone = request.getParameter("phone");
 	int sum = 0;
%>
	<jsp:include page="/layout/header.jsp" />
	
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 정보</h1>
	</div>
	<div class="container shop p-5 mb-5" >
		<form action="complete.jsp" method="post">
			<!-- 주문 정보 -->
			<div class="ship-box">
				<table class="table">
					<tbody>
						<tr>
							<td>주문형태 : </td>
							<td><%= loginform %></td>
						</tr>
						<tr>
							<td>성명 : </td>
							<td><%=name %></td>
						</tr>
						<tr>
							<td>우편번호 : </td>
							<td><%=zipCode %></td>
						</tr>
						<tr>
							<td>주소 : </td>
							<td><%=address %></td>
						</tr>
						<tr>
							<td>배송일 : </td>
							<td><%=deliveryDate %></td>
						</tr>
						<tr>
							<td>전화번호 : </td>
							<td><%=phone %></td>
						</tr>
						<tr>
							<td>주문 비밀번호 : </td>
							<td>
								<input type="password" class="form-control" name="orderPw">
							</td>
						</tr>
					</tbody>
				</table>
			</div>			
			<!-- 표 -->
			<div class="container mt-5">
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
				                	int unitPrice = product.getUnitPrice() == null ? 0 : product.getUnitPrice();
				                	
				                    int total = unitPrice * product.getQuantity();
				                    sum += total;
				            %>
				            <tr>
				                <td><%= product.getName() %></td>
				                <td><%= product.getUnitPrice() %></td>
				                <td><%= product.getQuantity() %></td>
				                <td><%= total %></td>
				                <td>
				                </td>
				            </tr>
				            <% } %>
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
				</div>
				<!-- 배송 정보 전달 -->
				<input type="hidden" name="orderForm" value="<%= loginform %>">
				<input type="hidden" name="name" value="<%= name %>">
				<input type="hidden" name="deliveryDate" value="<%= deliveryDate %>">
				<input type="hidden" name="nation" value="<%= nation %>">
				<input type="hidden" name="zipCode" value="<%= zipCode %>">
				<input type="hidden" name="address" value="<%= address %>">
				<input type="hidden" name="phone" value="<%= phone %>">
				<input type="hidden" name="sum" value="<%= sum %>">
				<div class="d-md-flex justify-content-between mt-5 mb-5">
					<div>
					 	<a href="ship.jsp" class="btn btn-lg btn-success">이전</a>
						<a href="../index.jsp" class="btn btn-lg btn-danger">취소</a>
					</div>
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