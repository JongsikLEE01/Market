package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
		// sql 쿼리 작성
		String sql = " INSERT INTO `order` (ship_name, zip_code, country, address, "
					+ " date, order_pw, user_id, total_price, phone) "
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, order.getShipName());
			psmt.setString(2, order.getZipCode());
			psmt.setString(3, order.getCountry());
			psmt.setString(4, order.getAddress());
			psmt.setString(5, order.getDate());
			psmt.setString(6, order.getOrderPw());
			psmt.setString(7, order.getUserId());
			psmt.setInt(8, order.getTotalPrice());
			psmt.setString(9, order.getPhone());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("주문 등록 시 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		int no = 0;
		String sql = " SELECT MAX(order_no) AS max_no "
					+ " FROM `order` ";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				no = rs.getInt("max_no");
			}
			
		} catch (SQLException e) {
			System.err.println("최근 등록 상품 조회 시 예외 발생");
			e.printStackTrace();
		}
		
		return no;
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 * 주문번호, 상품명, 가격, 수량, 소개, 비고 
	 */
	public List<Product> list(String userId) {
		List<Product> productList = new ArrayList<>();
		
		String sql = " SELECT pio.order_no AS order_no, p.name AS name, p.unit_price AS unit_price, "
		           + " pio.amount AS amount, "
		           + " (p.unit_price * pio.amount) AS total_price "
		           + " FROM `product_io` pio, `order` o, `product` p "
		           + " WHERE pio.order_no = o.order_no "
		           + " AND p.product_id = pio.product_id "
		           + " AND pio.user_id = ? ";  
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
	            Product product = new Product();
	            product.setOrderNo(rs.getInt("order_no"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setQuantity(rs.getInt("amount"));
				productList.add(product); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("주문 내역 조회 중 에러가 발생하였습니다.");
		}
				
		return productList;
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		
		List<Product> productList = new ArrayList<>();
		
		String sql = " SELECT pio.order_no AS order_no, p.name AS name, p.unit_price AS unit_price, "
		           + " pio.amount AS amount, "
		           + " (p.unit_price * pio.amount) AS total_price "
		           + " FROM `product_io` pio, `order` o, `product` p "
		           + " WHERE pio.order_no = o.order_no "
		           + " AND p.product_id = pio.product_id "
		           + " AND o.phone = ? "
		           + " AND o.order_pw = ? ";  
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, phone);
			psmt.setString(2, orderPw);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
	            Product product = new Product();
	            product.setOrderNo(rs.getInt("order_no"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setQuantity(rs.getInt("amount"));
				productList.add(product); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("주문 내역 조회 중 에러가 발생하였습니다.");
		}
				
		return productList;
	}	
}





























