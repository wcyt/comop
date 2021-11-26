package dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PointOrderBean;
import dao.Connector;

public class MySQLPointOrderDAO {
	private PreparedStatement st = null;

	//ポイント注文テーブルに追加
	public void addPointOrder(PointOrderBean po) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into point_order_table(user_id,total_point_price,reward_product_id,buy_count) values(?,?,?,?)";

			st = cn.prepareStatement(sql);

			st.setInt(1, po.getUser_id());
			st.setInt(2, po.getTotal_point_price());
			st.setInt(3, po.getReward_product_id());
			st.setInt(4, po.getBuy_count());

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//自分のポイント注文テーブルの一覧を取得
	public List<PointOrderBean> getPointOrderList(String user_id) {
		ArrayList<PointOrderBean> point_orders = new ArrayList<PointOrderBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT po.order_date,po.total_point_price,reward_product_id,po.buy_count,pr.reward_product_name,pr.reward_product_image,pr.point_price FROM point_order_table JOIN point_reward_table USING(reward_product_id) WHERE user_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, user_id);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				PointOrderBean po=new PointOrderBean();

				po.setOrder_date(rs.getString(1));
				po.setTotal_point_price(rs.getInt(2));
				po.setReward_product_id(rs.getInt(3));
				po.setBuy_count(rs.getInt(4));
				po.setReward_product_name(rs.getString(5));
				po.setReward_product_image(rs.getString(6));
				po.setPoint_price(rs.getInt(7));

				point_orders.add(po);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return point_orders;
	}
}
