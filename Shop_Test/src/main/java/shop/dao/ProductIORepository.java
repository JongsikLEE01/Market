package shop.dao;

import java.sql.SQLException;

import shop.dto.Product;

public class ProductIORepository extends JDBConnection {

	/**
	 * 입출고 등록
	 * @param product
	 * @param type
	 * @return result
	 */
	public int insert(Product product) {
		int result = 0;
		String sql = " INSERT INTO product_io ( "
				+ " product_id "
				+ ", order_no "
				+ ", amount "
				+ ", type "
				+ ", io_date "
				+ ", user_id ) "
				+ " VALUES( ?, ?, ?, ?, now(), ?) ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setInt(2, product.getOrderNo());
			psmt.setInt(3, product.getQuantity());
			psmt.setString(4, product.getType());
			psmt.setString(5, product.getUserId());

			result = psmt.executeUpdate();
			
			if(result > 0) return result;
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("상품 등록 중, 에러 발생");
		}
		return result;
	}
}