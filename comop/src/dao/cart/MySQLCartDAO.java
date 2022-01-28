package dao.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CartBean;
import dao.Connector;

public class MySQLCartDAO implements CartDAO {
	private PreparedStatement st = null;

	//カートに追加
	public void addCart(CartBean c) {
		try {
			Connection cn = Connector.getInstance().connect();

			String select = "SELECT user_id, product_id, buy_count FROM cart_table WHERE user_id=? AND product_id=?";
			st = cn.prepareStatement(select);
			st.setInt(1, c.getUser_id());
			st.setInt(2, c.getProduct_id());

			ResultSet rs = st.executeQuery();

			String sql = null;

			//既にカートに追加されていたらbuy_countを増やす
			//カートに追加したときに動く
			if (rs.next()) {
				int buy_count = rs.getInt(3);

				rs.close();

				sql = "UPDATE cart_table SET buy_count=buy_count+1 WHERE user_id=? AND product_id=?";

				st = cn.prepareStatement(sql);

				st.setInt(1, c.getUser_id());
				st.setInt(2, c.getProduct_id());

				st.executeUpdate();
				//カートに追加されてなかったらinsertする
			} else {
				rs.close();

				sql = "INSERT into cart_table(user_id,product_id,buy_count) values(?,?,1)";

				st = cn.prepareStatement(sql);

				st.setInt(1, c.getUser_id());
				st.setInt(2, c.getProduct_id());
				//				st.setInt(3, c.getBuy_count());

				st.executeUpdate();
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
	}

	//カートの中身を削除
	public void removeCart(int user_id, int product_id) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "DELETE FROM cart_table WHERE user_id=? AND product_id=?";

			st = cn.prepareStatement(sql);

			st.setInt(1, user_id);
			st.setInt(2, product_id);

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

	//自分のカートの一覧を取得
	public List<CartBean> getCartList(int user_id) {
		ArrayList<CartBean> carts = new ArrayList<CartBean>();
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "SELECT product_id,p.product_name,p.product_image,p.price,c.buy_count FROM cart_table c JOIN product_table p USING(product_id) WHERE c.user_id=?";
			st = cn.prepareStatement(sql);
			st.setInt(1, user_id);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				CartBean c = new CartBean();

				c.setProduct_id(rs.getInt(1));
				c.setProduct_name(rs.getString(2));
				c.setProduct_image(rs.getString(3));
				c.setPrice(rs.getInt(4));
				c.setBuy_count(rs.getInt(5));

				carts.add(c);
			}
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

		return carts;
	}

	//buy_countを増加
	public void increaseBuyCount(CartBean cartBean) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE CART_TABLE SET BUY_COUNT = BUY_COUNT + 1 WHERE USER_ID = ? AND PRODUCT_ID = ?";

			st = cn.prepareStatement(sql);

			st.setInt(1, cartBean.getUser_id());
			st.setInt(2, cartBean.getProduct_id());

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

	//buy_countを減少
	public void decreaseBuyCount(CartBean cartBean) {
		try {
			Connection cn = Connector.getInstance().connect();

			String sql = "UPDATE CART_TABLE SET BUY_COUNT = BUY_COUNT - 1 WHERE USER_ID = ? AND PRODUCT_ID = ?";

			st = cn.prepareStatement(sql);

			st.setInt(1, cartBean.getUser_id());
			st.setInt(2, cartBean.getProduct_id());

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
}
