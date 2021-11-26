package dao.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.OrderBean;
import bean.OrderDetailBean;
import dao.Connector;

public class MySQLOrderDAO implements OrderDAO {
	private PreparedStatement st = null;

	public void addOrder(OrderBean o,OrderDetailBean od) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into order_table() values()";

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
	public List getOrderList(String user_id) {
		ArrayList user = new ArrayList();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT  FROM _table WHERE ";
			st = cn.prepareStatement(sql);
			st.setString(1, );

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				//User u = new User();

				u.set(rs.getString(1));
				u.set(rs.getString(2));
				u.set(rs.getString(3));
				u.set(rs.getString(4));
				u.set(rs.getString(5));
				u.set(rs.getString(6));
				u.set(rs.getString(7));
				u.sety(rs.getString(8));
				u.set(rs.getString(9));
				u.set(rs.getString(10));
				u.set(rs.getString(11));
				u.set(rs.getInt(12));

				//user.add(u);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return ;
	}

}
