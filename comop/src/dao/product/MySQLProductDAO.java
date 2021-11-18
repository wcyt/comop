package dao.product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.Connector;

public class MySQLProductDAO implements ProductDAO {
	public List getProductsList(String _sql) {
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT product_name,product_image,price FROM product_table "+_sql;

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
