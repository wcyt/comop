package dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PointOrderBean;
import dao.Connector;

public class MySQLPointOrderDAO implements PointOrderDAO {
	private PreparedStatement st = null;

	//ポイント注文テーブルに追加
	public void addPointOrder(PointOrderBean po) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "INSERT INTO point_order_table(user_id,total_point_price,reward_product_id,buy_count) VALUES(?,?,?,1)";

			st = cn.prepareStatement(sql);

			st.setInt(1, po.getUser_id());
			st.setInt(2, po.getTotal_point_price());
			st.setInt(3, po.getReward_product_id());

			st.executeUpdate();

		} catch (SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//自分のポイント注文テーブルの一覧を取得
	public List<PointOrderBean> getPointOrderList(int user_id) {
		ArrayList<PointOrderBean> point_orders = new ArrayList<PointOrderBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = " SELECT po.order_date,po.total_point_price,reward_product_id,po.buy_count,pr.reward_product_name,pr.reward_product_image,pr.point_price FROM point_order_table po JOIN point_reward_table pr USING(reward_product_id) WHERE user_id=? AND shipped=0";
			st = cn.prepareStatement(sql);
			st.setInt(1, user_id);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				PointOrderBean po = new PointOrderBean();

				po.setOrder_date(rs.getString(1));
				po.setTotal_point_price(rs.getInt(2));
				po.setReward_product_id(rs.getInt(3));
				po.setBuy_count(rs.getInt(4));
				po.setReward_product_name(rs.getString(5));
				po.setReward_product_image(rs.getString(6));
				po.setPoint_price(rs.getInt(7));

				point_orders.add(po);
			}
		} catch (SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return point_orders;
	}

	public void minusPoint(PointOrderBean pointOrderBean, int user_id) {
		try {
			Connection cn = Connector.getInstance().connect();

			//ユーザーのポイントを減らす
			String sql = "UPDATE user_table SET point = point - ? WHERE user_id = ?";

			st = cn.prepareStatement(sql);

			st.setInt(1, pointOrderBean.getTotal_point_price());
			st.setInt(2, user_id);

			st.executeUpdate();
		} catch (SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void updateShipped(int user_id, PointOrderBean pOrderBean) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE point_order_table SET shipped = 1 WHERE point_order_id = ? and user_id = ?";

			st = cn.prepareStatement(sql);

			st.setInt(1, pOrderBean.getPoint_order_id());
			st.setInt(2, user_id);

			st.executeUpdate();
		} catch (SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<PointOrderBean> getShippedOrderList(int user_id) {
		ArrayList<PointOrderBean> orders = new ArrayList<PointOrderBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT o.order_date,o.total_point_price,o.shipped,reward_product_id,o.buy_count,p.reward_product_name,p.reward_product_image,p.point_price, o.point_order_id "
						+ "FROM point_order_table o JOIN point_reward_table p USING(reward_product_id) "
						+ "WHERE o.user_id=? AND SHIPPED = 1;";

			st = cn.prepareStatement(sql);
			st.setInt(1, user_id);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				PointOrderBean o = new PointOrderBean();

				o.setOrder_date(rs.getString(1));
				o.setTotal_point_price(rs.getInt(2));
				o.setShipped(rs.getBoolean(3));
				o.setReward_product_id(rs.getInt(4));
				o.setBuy_count(rs.getInt(5));
				o.setReward_product_name(rs.getString(6));
				o.setReward_product_image(rs.getString(7));
				o.setPoint_price(rs.getInt(8));
				o.setPoint_order_id(rs.getInt(9));

				orders.add(o);
			}
		} catch (SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return orders;
	}

}
