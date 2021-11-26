package dao.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PointRewardBean;
import dao.Connector;

public class MySQLPointProductDAO {
	private PreparedStatement st = null;

	//ポイント商品の一覧を取得
	public List<PointRewardBean> getRewardProductsList() {

		ArrayList<PointRewardBean> point_rewards = new ArrayList<PointRewardBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT reward_product_name,reward_product_image,reward_product_description,stock_quantity,point_price,reward_product_id FROM point_reward_table";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				PointRewardBean pr=new PointRewardBean();

				pr.setReward_product_name(rs.getString(1));
				pr.setReward_product_image(rs.getString(2));
				pr.setReward_product_description(rs.getString(3));
				pr.setStock_quantity(rs.getInt(4));
				pr.setPoint_price(rs.getInt(5));
				pr.setReward_product_id(rs.getInt(6));

				point_rewards.add(pr);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return point_rewards;
	}
	//ポイント商品の検索
	public List<PointRewardBean> searchRewardProducts(String key) {
		ArrayList<PointRewardBean> point_rewards = new ArrayList<PointRewardBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT reward_product_name,reward_product_image,reward_product_description,stock_quantity,point_price,reward_product_id FROM point_reward_table WHERE  reward_product_name LIKE '%\"+key+\"%' || reward_product_description LIKE '%\"+key+\"%'";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				PointRewardBean pr=new PointRewardBean();

				pr.setReward_product_name(rs.getString(1));
				pr.setReward_product_image(rs.getString(2));
				pr.setReward_product_description(rs.getString(3));
				pr.setStock_quantity(rs.getInt(4));
				pr.setPoint_price(rs.getInt(5));
				pr.setReward_product_id(rs.getInt(6));

				point_rewards.add(pr);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return point_rewards;
	}
}
