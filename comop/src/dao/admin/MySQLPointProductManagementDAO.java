package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PointRewardBean;
import dao.Connector;

public class MySQLPointProductManagementDAO implements PointProductManagementDAO {
	private PreparedStatement st = null;

	//ポイント商品の一覧を取得
	public List<PointRewardBean> getRewardProductsList() {
		ArrayList<PointRewardBean> pointrewards = new ArrayList<PointRewardBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT reward_product_id,reward_product_name,reward_product_image,reward_product_description,stock_quantity,point_price FROM point_reward_table";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				PointRewardBean p = new PointRewardBean();

				p.setReward_product_id(rs.getInt(1));
				p.setReward_product_name(rs.getString(2));
				p.setReward_product_image(rs.getString(3));
				p.setReward_product_description(rs.getString(4));
				p.setStock_quantity(rs.getInt(5));
				p.setPoint_price(rs.getInt(6));

				pointrewards.add(p);
			}
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
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

		return pointrewards;
	}

	//ポイント商品を編集
	public void editRewardProduct(PointRewardBean p) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE point_reward_table SET reward_product_name=?,reward_product_image=?,reward_product_description=?,stock_quantity=?,point_price=? WHERE reward_product_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, p.getReward_product_name());
			st.setString(2, p.getReward_product_image());
			st.setString(3, p.getReward_product_description());
			st.setInt(4, p.getStock_quantity());
			st.setInt(5, p.getPoint_price());
			st.setInt(6, p.getReward_product_id());

			st.executeUpdate();

			cn.commit();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
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

	//ポイント商品を追加
	public void addRewardProduct(PointRewardBean p) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "INSERT into point_reward_table(reward_product_name,reward_product_image,reward_product_description,stock_quantity,point_price) values(?,?,?,?,?)";
			st = cn.prepareStatement(sql);

			st.setString(1, p.getReward_product_name());
			st.setString(2, p.getReward_product_image());
			st.setString(3, p.getReward_product_description());
			st.setInt(4, p.getStock_quantity());
			st.setInt(5, p.getPoint_price());

			st.executeUpdate();

			cn.commit();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
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

	//ポイント商品を削除
	public void removeRewardProduct(String reward_product_id) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "DELETE FROM point_reward_table WHERE reward_product_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, reward_product_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		} catch (SQLException e) {
			e.printStackTrace();
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
}
