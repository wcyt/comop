package dao.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bean.ProductBean;
import dao.Connector;

public class MySQLProductDAO implements ProductDAO {
	private PreparedStatement st = null;

	//商品一覧の取得
	public List<ProductBean> getProductsList(Map<String,String[]> parameters) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.connect();

			String where="";	//sql文のWHERE句以降を格納

			Iterator<String> it = parameters.keySet().iterator();
			while (it.hasNext()) {
				String key = (String)it.next();
				String[] val = (String[])parameters.get(key);

				//カテゴリーの絞り込み
				if(key=="size" || key=="material" || key=="packing_type"){
					where += "(";
					for (int i = 0;i<val.length;i++) {
						if(i==val.length-1){
							where += key + "='" + val[i] +"'";
						}else{
							where += key + "='" + val[i] + "'||";
						}
					}
					where += ")";
				//何円以上
				}else if(key=="pmin"){
					where += "(price >=" + val[0] + ")";
				//何円以下
				}else if(key=="pmax"){
					where += "(price <=" + val[0] + ")";
				//カラーの絞り込み
				}else if(key=="color_id"){
					where += "(";
					for (int i = 0;i<val.length;i++) {
						if(i==val.length-1){
							where += key + "='" + val[i]+"'";
						}else{
							where += key + "='" + val[i] + "'||";
						}
					}
					where += ")";
				}
				where += "&&";
			}
			//最後の&&を消す
			where=where.substring(0,where.length()-3);

			String sql = "SELECT product_id,product_name,product_image,price FROM product_table WHERE "+where;

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				ProductBean p = new ProductBean();

				p.setProduct_name(rs.getString(1));
				p.setProduct_image(rs.getString(2));
				p.setPrice(rs.getInt(3));

				products.add(p);

			}

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	//商品詳細の取得
	public List<ProductBean> getProductDetail(String product_id) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		try {
			Connection cn = Connector.connect();

			String sql = "SELECT p.product_name,p.product_image,p.stock_quantity,p.product_description,p.price,c.color_name,p.size,p.material,p.packing_type FROM product_table p JOIN color_table c USING(color_id) WHERE p.product_id="+product_id;

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			rs.next();

			ProductBean p = new ProductBean();

			p.setProduct_name(rs.getString(1));
			p.setProduct_image(rs.getString(2));
			p.setStock_quantity(rs.getInt(3));
			p.setProduct_description(rs.getString(4));
			p.setPrice(rs.getInt(5));
			p.setColor_name(rs.getString(5));
			p.setSize(rs.getString(6));
			p.setMaterial(rs.getString(7));
			p.setPacking_type(rs.getString(8));

			products.add(p);

			//色違いの商品の一覧を取得
			String sql2 = "SELECT p.product_id,p.product_image,c.color_name FROM product_table p JOIN color_table c USING(color_id) WHERE product_name="+p.getProduct_name();

			st = cn.prepareStatement(sql2);

			ResultSet rs2 = st.executeQuery();

			while(rs2.next()) {
				ProductBean p2 = new ProductBean();

				p.setProduct_id(rs2.getInt(1));
				p.setProduct_image(rs2.getString(2));
				p.setColor_name(rs2.getString(3));

				products.add(p2);

			}

			cn.commit();
			cn.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	//商品検索
	public List<ProductBean> searchProducts(String key) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT product_id,product_name,product_image,price FROM product_table WHERE product_name LIKE '%"+key+"%' || product_description LIKE '%"+key+"%'";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductBean p = new ProductBean();

				p.setProduct_id(rs.getInt(1));
				p.setProduct_name(rs.getString(2));
				p.setProduct_image(rs.getString(3));
				p.setPrice(rs.getInt(4));

				products.add(p);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	//在庫数を取得
	public int getStock_quantity(String product_id) {
		int stock=0;
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT stock_quantity FROM product_table WHERE product_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, product_id);

			ResultSet rs = st.executeQuery();
			rs.next();

			stock=rs.getInt(1);

			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return stock;
	}



}
