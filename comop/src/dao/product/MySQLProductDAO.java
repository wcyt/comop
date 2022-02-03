package dao.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bean.OrderDetailBean;
import bean.ProductBean;
import dao.Connector;

public class MySQLProductDAO implements ProductDAO {
	private PreparedStatement st = null;

	//商品一覧を取得
	public List<ProductBean> getProductsList() {
		List<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_IMAGE, PRICE FROM PRODUCT_TABLE";
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
		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	//絞り込み検索
	public List<ProductBean> refineSearch(Map<String,String[]> parameters) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String where="";	//sql文のWHERE句以降を格納
			String orderby="";	//sql文のORDER BY句以降を格納

			Iterator<String> it = parameters.keySet().iterator();
			while (it.hasNext()) {
				String key = (String)it.next();
				String[] val = (String[])parameters.get(key);

				//カテゴリーの絞り込み
				if(key.equals("size") || key.equals("material") || key.equals("packing_type")){
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
				}else if(key.equals("pmin") && val[0]!=""){
					where += "(price >=" + val[0] + ")";
				//何円以下
				}else if(key.equals("pmax") && val[0]!=""){
					where += "(price <=" + val[0] + ")";
				//カラーの絞り込み
				}else if(key.equals("color_id")){
					where += "(";
					for (int i = 0;i<val.length;i++) {
						if(i==val.length-1){
							where += key + "='" + val[i]+"'";
						}else{
							where += key + "='" + val[i] + "'||";
						}
					}
					where += ")";
				//ソート	※Map内でソートが一番上あると動かない(今のところ価格より下にあればいい)
				}else if(key.equals("sort")) {
					where=where.substring(0,where.length()-2);
					if(val[0].equals("asc"))
						orderby+=" ORDER BY price";
					else if(val[0].equals("desc"))
						orderby+=" ORDER BY price DESC";
					else
						orderby+=" ORDER BY favorite_count DESC";
				}
				where += "&&";
			}
			//最後の&&を消す
			where=where.substring(0,where.length()-2);

			String sql = "SELECT product_id,product_name,product_image,price FROM product_table WHERE "+where+orderby;

			System.out.println("MySQLProductDAO,select文:"+sql);

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				ProductBean p = new ProductBean();

				p.setProduct_id(Integer.parseInt(rs.getString(1)));
				p.setProduct_name(rs.getString(2));
				p.setProduct_image(rs.getString(3));
				p.setPrice(rs.getInt(4));

				products.add(p);
			}
		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	//商品詳細の取得
	public List<ProductBean> getProductDetail(String product_id) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT p.product_name,p.product_image,p.stock_quantity,p.product_description,p.price,c.color_name,p.size,p.material,p.packing_type, p.product_id FROM product_table p JOIN color_table c USING(color_id) WHERE p.product_id="+product_id;

			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();

			rs.next();

			ProductBean p = new ProductBean();

			p.setProduct_name(rs.getString(1));
			p.setProduct_image(rs.getString(2));
			p.setStock_quantity(rs.getInt(3));
			p.setProduct_description(rs.getString(4));
			p.setPrice(rs.getInt(5));
			p.setColor_name(rs.getString(6));
			p.setSize(rs.getString(7));
			p.setMaterial(rs.getString(8));
			p.setPacking_type(rs.getString(9));
			p.setProduct_id(Integer.parseInt(rs.getString(10)));

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

		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}
	//商品検索
	public List<ProductBean> searchProducts(String key) {
		ArrayList<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

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
		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}
	//在庫数を取得
	public int getStock_quantity(String product_id) {
		int stock=0;
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT stock_quantity FROM product_table WHERE product_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, product_id);

			ResultSet rs = st.executeQuery();
			rs.next();

			stock=rs.getInt(1);

		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return stock;
	}

	//価格でソート(価格が低い順)
	public List<ProductBean> sortProducts() {
		List<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_IMAGE, PRICE FROM PRODUCT_TABLE ORDER BY PRICE";
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
		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}

	//お気に入り数でソート
	public List<ProductBean> sortFavoriteCount() {
		List<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_IMAGE, PRICE FROM PRODUCT_TABLE ORDER BY FAVORITE_COUNT DESC";
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
		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;
	}
	//在庫を減らす
	public void reduceStock(List<OrderDetailBean> order_details) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE product_table SET stock_quantity=stock_quantity-? WHERE product_id=?";

			for (int i = 0; i < order_details.size(); i++) {
				OrderDetailBean od = (OrderDetailBean) order_details.get(i);

				st = cn.prepareStatement(sql);

				st.setInt(1, od.getBuy_count());
				st.setInt(2, od.getProduct_id());

				st.executeUpdate();
			}

		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

	}
	public List randomProduct() {
		List<ProductBean> products = new ArrayList<ProductBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_IMAGE, PRICE FROM PRODUCT_TABLE ORDER BY RAND()";
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

		}catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		}finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return products;

	}


}
