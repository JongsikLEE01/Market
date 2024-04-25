<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    String productId = request.getParameter("productId");
    List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
    if (cartList == null) {
        response.sendRedirect("/error/exception.jsp");
        return;
    }

    boolean result = false; // ���������� �����Ǿ����� Ȯ���ϴ� �÷���

    if (productId != null && !productId.isEmpty()) {
        // productId�� ������ ��� Ư�� ��ǰ ����
        Product toRemove = null;
        for (Product product : cartList) {
            // productId�� null�� �ƴϰ�, ��û���� productId�� ��ġ�ϴ� ��츸 �˻�
            if (product.getProductId() != null && product.getProductId().equals(productId)) {
                toRemove = product;
                break;
            }
        }
        if (toRemove != null)
            result = cartList.remove(toRemove);
    } else {
        // ��ü ��� ����
        cartList.clear();
        result = cartList.isEmpty();
    }
 	// ����� ��ٱ��ϸ� �ٽ� ���ǿ� ����
    session.setAttribute("cartList", cartList);

    if (result)
        response.sendRedirect("cart.jsp");
    else
        out.println("<script>alert('��ǰ ���� �� ������ �߻��Ͽ����ϴ�.'); history.back();</script>");
%>