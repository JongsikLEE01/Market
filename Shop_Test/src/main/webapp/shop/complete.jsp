<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Order"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
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
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
	String userId = (String) session.getAttribute("loginId");
	String orderForm = request.getParameter("orderForm");
	String phone = request.getParameter("phone");
	String orderPw = request.getParameter("orderPw");
	String address = request.getParameter("address");
	String deliveryDate = request.getParameter("deliveryDate");
	String nation = request.getParameter("nation");
	String zipCode = request.getParameter("zipCode");
	String name = request.getParameter("name");
	int totalPrice = Integer.parseInt(request.getParameter("sum"));
	
	Order order = new Order();
	order.setUserId(userId);
	order.setShipName(name);
	order.setDate(deliveryDate);
	order.setAddress(address);
	order.setCountry(nation);
	order.setZipCode(zipCode);
	
	// 비회원 -> 번호만 저장 
	if(userId == null) order.setPhone(phone);	
			
	order.setOrderPw(orderPw);
	order.setTotalPrice(totalPrice);
		
	OrderRepository orderDAO = new OrderRepository();
		
	int result = orderDAO.insert(order);
		
	int last = orderDAO.lastOrderNo();		
	ProductIORepository productIODao = new ProductIORepository();
		
	if (cartList != null && !cartList.isEmpty()) {
		    
		for (Product cart : cartList) {
		    Product product = new Product();
		    String user = "";
		    	
		    product.setProductId(cart.getProductId());
		    product.setOrderNo(last);
		    product.setQuantity(cart.getQuantity());
		    product.setType("OUT");
		    	
		    if(userId == null) user = phone;
		    else user = userId;
		    	
		    product.setUserId(user);
		    	
		    int add = productIODao.insert(product);
		    	
		    if(add < 0) break;
		   }
	}
	
	// 장바구니 초기화
	if(result > 0) {
		cartList.clear();
		session.setAttribute("cartList", cartList);
	}
%>
	<jsp:include page="/layout/header.jsp" />

	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	<div class="container shop p-5 mb-5" >
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<div class="ship-box">
			<table class="table">
				<tbody>
					<tr>
						<td>주문번호 :</td>
						<td><%=session.getId() %></td>
					</tr>
					<tr>
						<td>배송지 :</td>
						<td><%=request.getParameter("address") %></td>
					</tr>
				</tbody>
			</table>
			<div class="bth-box d-flex justify-content-center">
				<a href="../user/order.jsp" class="btn btn-lg btn-primary">주문내역</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>