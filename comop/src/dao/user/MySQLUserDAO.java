package dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.UserBean;
import dao.Connector;

public class MySQLUserDAO implements UserDAO {
	private PreparedStatement st = null;

	//アカウントを作成
	public void createAccount(UserBean u) {
		try {
			Connection cn = Connector.connect();

			String sql = "insert into user_table(name,mail,password) values(?,?,?)";

			st = cn.prepareStatement(sql);
			st.setString(1, u.getName());
			st.setString(2, u.getMail());
			st.setString(3, u.getPassword());
			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	//パスワードを変更(ログイン前)
	public void changePassword(int user_id,String pass) {
		try {
			Connection cn = Connector.connect();

			String sql = "UPDATE user_table SET password=? WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.setInt(1, user_id);
			st.setString(2, pass);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}
	//ユーザー情報の編集
	public void editUserInfo(UserBean u) {
		try {
			Connection cn = Connector.connect();

			String sql = "UPDATE user_table SET name=?,mail=?,address=?,first_name=?,first_name_kana=?,last_name=?,last_name_kana=?,tel=?,postal_code=?,password=? WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.setString(1, u.getName());
			st.setString(2, u.getMail());
			st.setString(3, u.getAddress());
			st.setString(4, u.getFirst_name());
			st.setString(5, u.getFirst_name_kana());
			st.setString(6, u.getLast_name());
			st.setString(7, u.getLast_name_kana());
			st.setString(8, u.getTel());
			st.setString(9, u.getPostal_code());
			st.setString(10, u.getPassword());
			st.setInt(11, u.getUser_id());

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//ユーザーの退会
	public void lapseUser(String user_id) {
		try {
			Connection cn = Connector.connect();

			String sql = "UPDATE user_table SET user_lapse=1 WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.executeUpdate();

			st.setString(1,user_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//ポイントの更新
	public void updatePoint(String user_id,String point) {
		try {
			Connection cn = Connector.connect();

			String sql = "UPDATE user_table SET point=? WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.executeUpdate();

			st.setString(1, point);
			st.setString(2, user_id);

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//自分のユーザー情報の取得
	public UserBean getMyUserInfo(String user_id) {
		UserBean u = new UserBean();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT user_id,name,mail,address,first_name,first_name_kana,last_name,last_name_kana,tel,postal_code,password,point FROM user_table WHERE user_id=?";

			st = cn.prepareStatement(sql);
			st.setString(1, user_id);

			ResultSet rs = st.executeQuery();

			if(rs.next()) {

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
				u.setPassword(rs.getString(11));
				u.setPoint(rs.getInt(12));
			}

			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	//ログインできるかどうか
	public boolean login(String mail,String password) {
		boolean isRegist=false;
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT password FROM user_table WHERE mail = ?";
			st = cn.prepareStatement(sql);
			st.setString(1, mail);

			ResultSet rs = st.executeQuery();
			//入力されたメールアドレスが登録されてるか
			if(rs.next()) {
				//パスワードがあってるか
				if(password.equals(rs.getString(1))) {
					isRegist=true;
				}
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		System.out.println("ここまでは来ている");

		return isRegist;
	}

}
