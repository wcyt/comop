package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.UserBean;
import dao.Connector;

public class MySQLUserManagementDAO implements UserManagementDAO {
	private PreparedStatement st = null;

	//ユーザーの一覧を取得
	public List<UserBean> getUserList(){
		ArrayList<UserBean> users = new ArrayList<UserBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT * FROM user_table";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				UserBean u = new UserBean();

				u.setUser_id(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setMail(rs.getString(3));
				u.setAddress(rs.getString(4));
				u.setFirst_name(rs.getString(5));
				u.setFirst_name_kana(rs.getString(6));
				u.setLast_name(rs.getString(7));
				u.setLast_name_kana(rs.getString(8));
				u.setTel(rs.getString(9));
				u.setPostal_code(rs.getString(10));
				u.setPoint(rs.getInt(11));
				u.setUser_lapse(rs.getInt(12));

				users.add(u);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	//登録しているユーザーを削除
	public void lapseUser(String user_id) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE user_table SET user_lapse=1 WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, user_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
