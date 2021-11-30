package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ProductBean;
import dao.Connector;

public class MySQLProductManagementDAO implements ProductManagementDAO {
	private PreparedStatement st = null;

	//商品の一覧を取得
	public List<ProductBean> getProductList(){
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT product_id,color_id,color_name,product_name,product_image,product_description,stock_quantity,price,size,material,packing_type,favorite_count FROM product_table JOIN color_table USING(color_id)";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductBean p=new ProductBean();

				p.setProduct_id(rs.getInt(1));
				p.setColor_id(rs.getInt(2));
				p.setColor_name(rs.getString(3));
				p.setProduct_name(rs.getString(4));
				p.setProduct_image(rs.getString(5));
				p.setProduct_description(rs.getString(6));
				p.setStock_quantity(rs.getInt(7));
				p.setPrice(rs.getInt(8));
				p.setSize(rs.getString(9));
				p.setMaterial(rs.getString(10));
				p.setPacking_type(rs.getString(11));
				p.setFavorite_count(rs.getInt(12));

				products.add(p);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return products;
	}
	//商品を編集
	public void editProduct(ProductBean p) {
		try {
			Connection cn = Connector.connect();

			String sql = "UPDATE product_table SET color_id=?,product_name=?,product_image=?,product_description=?,stock_quantity=?,price=?,size=?,material=?,packing_type=? WHERE product_id=?";

			st = cn.prepareStatement(sql);

			st.setInt(1, p.getColor_id());
			st.setString(2, p.getProduct_name());
			st.setString(3, p.getProduct_image());
			st.setString(4, p.getProduct_description());
			st.setInt(5, p.getStock_quantity());
			st.setInt(6, p.getPrice());
			st.setString(7, p.getSize());
			st.setString(8, p.getMaterial());
			st.setString(9, p.getPacking_type());
			st.setInt(10, p.getProduct_id());

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//商品を追加
	public void addProduct(ProductBean p) {
		try {
			Connection cn = Connector.connect();

			String sql = "insert into product_table(product_name,product_image,product_description,stock_quantity,price,size,material,packing_type,color_id) values(?,?,?,?,?,?,?,?,?)";

			st = cn.prepareStatement(sql);

			st.setString(1, p.getProduct_name());
			st.setString(2, p.getProduct_image());
			st.setString(3, p.getProduct_description());
			st.setInt(4, p.getStock_quantity());
			st.setInt(5, p.getPrice());
			st.setString(6, p.getSize());
			st.setString(7, p.getMaterial());
			st.setString(8, p.getPacking_type());
			st.setInt(9, p.getColor_id());

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//商品を削除
	public void removeProduct(String product_id) {
		try {
			Connection cn = Connector.connect();

			String sql = "DELETE FROM product_table WHERE product_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, product_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
