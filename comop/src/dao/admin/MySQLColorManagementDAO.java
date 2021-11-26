package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ColorBean;
import dao.Connector;

public class MySQLColorManagementDAO implements ColorManagementDAO {
	private PreparedStatement st = null;

	//色の追加
	public void addColor(String color_name) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into color_table(color_name) values(?)";

			st = cn.prepareStatement(sql);

			st.setString(1, color_name);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//色の削除
	public void removeColor(String color_id) {
		try {
			Connection cn = Connector.connect();

			String sql = "DELETE FROM color_table WHERE color_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, color_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//色の一覧を取得
	public List<ColorBean> getColorList() {
		ArrayList<ColorBean> colors = new ArrayList<ColorBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT color_id,color_name FROM color_table";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ColorBean c=new ColorBean();

				c.setColor_id(rs.getInt(1));
				c.setColor_name(rs.getString(2));


				colors.add(c);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return colors;
	}
}

