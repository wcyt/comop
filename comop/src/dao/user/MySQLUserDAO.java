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
			Connection cn = Connector.getInstance().connect();

			String sql = "insert into user_table(name,mail,password) values(?,?,?)";

			st = cn.prepareStatement(sql);
			st.setString(1, u.getName());
			st.setString(2, u.getMail());
			st.setString(3, u.getPassword());

			st.executeUpdate();

			//ResultSet rs = st.executeQuery();
			//rs.next();

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

	//パスワードを変更(ログイン前)
	public void changePassword(int user_id, String pass) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE user_table SET password=? WHERE user_id=?";

			st = cn.prepareStatement(sql);
			st.setString(1, pass);
			st.setInt(2, user_id);
			System.out.println("changePass.id"+ user_id + "pass"+ pass);
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

	//ユーザー情報の編集
	public void editUserInfo(UserBean u) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE user_table SET name=?, mail=?, address=?, first_name=?, first_name_kana=?, last_name=?, last_name_kana=?, tel=?, postal_code=? WHERE user_id=?";
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
			st.setInt(10, u.getUser_id());

			st.executeUpdate();

			System.out.println(sql);

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

	//ユーザーの退会
	public void lapseUser(String user_id) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE user_table SET user_lapse=1 WHERE user_id=?";
			st = cn.prepareStatement(sql);

			st.setString(1, user_id);

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

	//ポイントの更新
	public void updatePoint(int user_id, int point) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE user_table SET point = point + ? WHERE user_id=?";

			st = cn.prepareStatement(sql);

			st.setInt(1, point);
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

	//自分のユーザー情報の取得
	//user_idからユーザー情報を取得するものは使わなそうなので、mailからユーザ情報を取得するものに変えました
	public UserBean getMyUserInfo(String mail) {
		UserBean u = new UserBean();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT user_id,name,mail,address,first_name,first_name_kana,last_name,last_name_kana,tel,postal_code,password,point, user_lapse FROM user_table WHERE mail=?";

			st = cn.prepareStatement(sql);
			st.setString(1, mail);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
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
				u.setUser_lapse(rs.getInt(13));
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
		return u;
	}

	//メールアドレスからパスワード取得
	public String getPasswordHash(String mail) {
		String password = null;
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT password FROM user_table WHERE mail = ?";
			st = cn.prepareStatement(sql);
			st.setString(1, mail);

			ResultSet rs = st.executeQuery();
			//入力されたメールアドレスが登録されてるか
			if (rs.next()) {
				password = rs.getString(1);
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
		return password;
	}

	//IDからパスワード取得
	//動く確証なし 動いたらこのコメントは消してください
	public String getPasswordHashByID(int user_id) {
		String password = null;
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT password FROM user_table WHERE user_id = ?";
			st = cn.prepareStatement(sql);

			st.setInt(1, user_id);

			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				password = rs.getString(1);
			}
		} catch(SQLException e) {
			//ロールバックする
			Connector.getInstance().rollback();
		} finally {
			//リソースの解放処理
			try {
				if(st != null) {
					st.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return password;
	}
}