package daofactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	private static Connection cn = null;
	public static Connection connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/comopdb?characterEncoding=UTF-8&serverTimezone=JST","comop","comop");
			cn.setAutoCommit(false);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
	public static void close() {
		try {
			cn.close();

		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}