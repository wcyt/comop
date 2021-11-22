package dao.favorite;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Connector;
import bean.FavoriteBean;

public class MySQLFavoriteDAO implements FavoriteDAO {
	private PreparedStatement st = null;

	//自分のお気に入りの一覧を取得
	public List getFavoriteList(String user_id) {
		ArrayList favorites = new ArrayList();
		try {
			Connection cn = Connector.connect();


			String sql = "SELECT f.product_id, FROM favorite_table f JOIN product_table p USING(user_id) WHERE user_id=?";
			st = cn.prepareStatement(sql);
			st.setString(1, );

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				FavoriteBean f=new FavoriteBean();

				f.setProduct_id(rs.getInt(1));
				f.setProduct_name(rs.getString(2));
				f.setProduct_image(rs.getString(3));
				f.setPrice(rs.getInt(4));

				favorites.add(f);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return favorites;

	}
	public void addFavorite(FavoriteBean f) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into _table() values()";

			st = cn.prepareStatement(sql);

			st.setString(1, );
			st.setString(2, );
			st.setString(3, );
			st.setString(4, );
			st.setString(5, );
			st.setString(6, );
			st.setString(7, );
			st.setString(8, );
			st.setString(9, );
			st.setString(10, );

			st.executeUpdate();


			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//引数保留
	public void removeFavorite() {

	}
}
