package dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.OrderBean;
import bean.OrderDetailBean;
import dao.Connector;

public class MySQLOrderDAO implements OrderDAO {
	private PreparedStatement st = null;

	//注文テーブルに追加
	public void addOrder(OrderBean o,List<OrderDetailBean> order_details) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "INSERT into order_table(user_id,total_price) values(?,?)";

			st = cn.prepareStatement(sql);

			st.setInt(1, o.getUser_id());
			st.setInt(2, o.getTotal_price());

			st.executeUpdate();

			String sql2 = "INSERT into order_detail(order_id,product_id,buy_count) values(last_insert_id(),?,?)";


			for(int i=0; i<order_details.size(); i++) {
				OrderDetailBean od=(OrderDetailBean)order_details.get(i);

				st = cn.prepareStatement(sql2);

				st.setInt(1, od.getProduct_id());
				st.setInt(2, od.getBuy_count());

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
	//自分の注文テーブルの一覧の取得
	public List<OrderBean> getOrderList(String user_id) {
		ArrayList<OrderBean> orders = new ArrayList<OrderBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT o.order_date,o.total_price,o.shipped,product_id,od.buy_count,p.product_name,p.product_image,p.price FROM order_table o JOIN order_detail od USING(order_id) JOIN product_table p USING(prodct_id) WHERE o.user_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, user_id);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				OrderBean o=new OrderBean();

				o.setOrder_date(rs.getString(1));
				o.setTotal_price(rs.getInt(2));
				o.setShipped(rs.getBoolean(3));
				o.setProduct_id(rs.getInt(4));
				o.setBuy_count(rs.getInt(5));
				o.setProduct_name(rs.getString(6));
				o.setProduct_image(rs.getString(7));
				o.setPrice(rs.getInt(8));

				orders.add(o);
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

		return orders;
	}

}
