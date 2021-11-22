package dao.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Iterator;

import dao.Connector;
import bean.ProductBean;

public class MySQLProductDAO implements ProductDAO {
	private PreparedStatement st = null;
	public List getProductsList(Map map) {
		ArrayList products = new ArrayList();
		try {
			Connection cn = Connector.connect();

			//sql文のWHERE句以降を格納
			String where;
			Iterator it = map.keySet().iterator();
			while (it.hasNext()) {
				String key = (String)it.next();
				String[] val = (String[])map.get(key);

				//カテゴリーの絞り込み
				if(key=="size" || key=="material" || key=="packing_type"){
					where += "(";
					for (int i = 0;i<val.length;i++) {
						if(i==val.length-1){
							where += key + "=" + val[i];
						}else{
							where += key + "=" + val[i] + "||";
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
							where += key + "=" + val[i];
						}else{
							where += key + "=" + val[i] + "||";
						}
					}
					where += ")";
				}
				where += "&&";
			}
			//最後の&&を消す
			where.substring(0,where.length()-3);

			String sql = "SELECT product_name,product_image,price FROM product_table "+where;

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				ProductBean p = new ProductBean();

				p.setProduct_name(rs.getString(1));
				p.setProduct_image(rs.getString(2));
				p.setPrice(Integer.parseInt(rs.getString(3)));

				products.add(p);

			}

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return products;
	}
	public ProductBean getProductDetail(String product_id) {
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT product_name,product_image,stock_quantity,product_description,price,size,material,packing_type FROM product_table WHERE product_id="+product_id;

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			ProductBean p = new ProductBean();

			p.setProduct_name(rs.getString(1));
			p.setProduct_image(rs.getString(2));
			p.setPrice(rs.getInt(3));

			cn.commit();
			cn.close();

			}

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return p;
	}
}
