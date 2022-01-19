package dao.favorite;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import bean.FavoriteBean;
import dao.Connector;

public class MySQLFavoriteDAO implements FavoriteDAO {
	private PreparedStatement st = null;

	//自分のお気に入りの一覧を取得
	public List<FavoriteBean> getFavoriteList(String user_id) {
		ArrayList<FavoriteBean> favorites = new ArrayList<FavoriteBean>();
		try {
			Connection cn = Connector.getInstance().connect();


			String sql = "SELECT product_id,p.product_name,p.product_image,p.price FROM favorite_table f JOIN product_table p USING(product_id) WHERE f.user_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, user_id);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				FavoriteBean f=new FavoriteBean();

				f.setProduct_id(rs.getString(1));
				f.setProduct_name(rs.getString(2));
				f.setProduct_image(rs.getString(3));
				f.setPrice(rs.getInt(4));

				favorites.add(f);
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

		return favorites;

	}
	//お気に入りに追加
	public void addFavorite(FavoriteBean f) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "INSERT into favorite_table(user_id,product_id) values(?,?)";

			st = cn.prepareStatement(sql);

			st.setString(1, f.getUser_id());
			st.setString(2, f.getProduct_id());

			st.executeUpdate();

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
	//お気に入りを削除
	public void removeFavorite(String user_id,Map<String,String[]> product_ids) {
		try {
			Connection cn = Connector.getInstance().connect();

			Iterator<String> it=product_ids.keySet().iterator();

			String key=(String)it.next();

			String[] val = (String[])product_ids.get(key);

			for(int i = 0;i<val.length;i++) {

				String sql = "DELETE FROM favorite_table WHERE user_id=? AND product_id=?";

				st = cn.prepareStatement(sql);

				st.setString(1, user_id);
				st.setString(2, val[i]);

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
}
