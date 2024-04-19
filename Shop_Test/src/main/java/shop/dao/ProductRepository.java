package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		List<Product> productList = new ArrayList<Product>();
		
		String sql = " SELECT * "
					+ " FROM product ";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
	            Product product = new Product();
	            
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setDescription(rs.getString("description"));
	            product.setManufacturer(rs.getString("manufacturer"));
	            product.setCategory(rs.getString("category"));
	            product.setUnitsInStock(rs.getLong("units_in_stock"));
	            product.setCondition(rs.getString("condition"));
	            product.setFile(rs.getString("file"));
	            product.setQuantity(rs.getInt("quantity"));

				productList.add(product); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("주문 목록 조회 중 에러가 발생하였습니다.");
		}
		return productList;
	}
	
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return productList
	 */
	public List<Product> list(String keyword) {
		List<Product> productList = new ArrayList<Product>();
		
		System.out.println(keyword);
		String sql = " SELECT * "
					+ " FROM product "
					+ " WHERE name Like ? ";
		 String word = "%"+keyword+"%";
//		 System.out.println(word); CONCAT('%', ?, '%')
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, word);
			rs = psmt.executeQuery();
			
			while(rs.next()) {				
				Product product = new Product();
	            
	            product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setDescription(rs.getString("description"));
	            product.setManufacturer(rs.getString("manufacturer"));
	            product.setCategory(rs.getString("category"));
	            product.setUnitsInStock(rs.getLong("units_in_stock"));
	            product.setCondition(rs.getString("condition"));
	            product.setFile(rs.getString("file"));
	            product.setQuantity(rs.getInt("quantity"));

				productList.add(product); 
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("상품 목록 조회 중 에러가 발생하였습니다.");
		}
		return productList;
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		Product product = new Product();
		
		String sql = " SELECT *"
					+ " FROM product "
					+ " WHERE product_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
	        psmt.setString(1, productId);

	        rs = psmt.executeQuery();
	        
	        if(rs.next()) {
	        	product.setProductId(rs.getString("product_id"));
	            product.setName(rs.getString("name"));
	            product.setUnitPrice(rs.getInt("unit_price"));
	            product.setDescription(rs.getString("description"));
	            product.setManufacturer(rs.getString("manufacturer"));
	            product.setCategory(rs.getString("category"));
	            product.setUnitsInStock(rs.getLong("units_in_stock"));
	            product.setCondition(rs.getString("condition"));
	            product.setFile(rs.getString("file"));
	            product.setQuantity(rs.getInt("quantity"));
	            
	    		return product;
	        }
		} catch (SQLException e) {
			System.err.println("상품 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return null;
	}
	
	 
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		int result = 0;
		
		String sql = " INSERT INTO product "
					+ "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString( 1, product.getProductId() );
			psmt.setString( 2, product.getName() );
			psmt.setLong( 3, product.getUnitPrice() );
			psmt.setString( 4, product.getDescription() );
			psmt.setString( 5, product.getManufacturer() );
			psmt.setString( 6, product.getCategory() );
			psmt.setLong( 7, product.getUnitsInStock() );
			psmt.setString( 8, product.getCondition() );
			psmt.setString( 9, product.getFile() );
			psmt.setInt( 10, 0);
			
			result = psmt.executeUpdate();
			
			if(result > 0) {
				return result;
			}
		} catch (SQLException e) {
			System.err.println("로그인 시, 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		int result = 0;
		
		String sql = " UPDATE product` "
				   + " SET "
				   + " product_id = ?"
				   + " , name = ?"
				   + " , unit_price = ? "
				   + " , description = ?"
				   + " , manufacturer = ?"
				   + " , category = ? "
				   + " , units_in_stock = ?"
				   + " , condition = ? "
				   + " , file = ? "
				   + " , quantity = ?"
				   + " WHERE product_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
			// 업데이트 될 값들
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getName());
			psmt.setLong(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			psmt.setString(9, product.getFile());
			psmt.setInt(10, 0);
			// product 테이블에서 where 조건으로 찾는 값들
			psmt.setString(11, product.getProductId());
			
			result = psmt.executeUpdate();
		}catch (SQLException e) {
			System.err.println("회원 정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
		int result = 0;
		
		String sql = " DELETE FROM product "
					+ " WHERE product_id = ? ";
		
		try {
			psmt = con.prepareStatement(sql);
	        psmt.setString(1, productId);

	        result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("상품 조회 중, 에러 발생!");
			e.printStackTrace();
		}
		return result;
	}
}