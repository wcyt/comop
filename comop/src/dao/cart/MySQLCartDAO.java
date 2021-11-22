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

	public void addCart(CartBean c) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into cart_table(user_id,product_id,buy_count) values(?,?,?)";

			st = cn.prepareStatement(sql);

			st.setString(1, );
			st.setString(2, );
			st.setString(3, );


			st.executeUpdate();


			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void removeCart(String user_id) {

	}
	public List getCartList() {

	}
}
