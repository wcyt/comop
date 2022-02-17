package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	private static Connector connector = null;
	private static Connection cn = null;
	private Connector() {}

	//Singleton pattern
	public static Connector getInstance() {
		if(connector == null) {
			connector = new Connector();
		}
		return connector;
	}

	public  Connection connect() {
		if(cn == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				//cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/comopdb?characterEncoding=UTF-8&serverTimezone=JST","comop","comop");
				cn = DriverManager.getConnection("jdbc:mysql://comop-db.cppu9iuxooqv.ap-northeast-1.rds.amazonaws.com:3306/comopdb?characterEncoding=UTF-8&serverTimezone=JST","comop","comop");
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		return cn;
	}

	public void close() {
		try {
			if(cn != null) {
				cn.close();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void beginTransaction() {
		if(cn == null) {
			connect();
		}
		try {
			cn.setAutoCommit(false);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void commit() {
		try {
			cn.commit();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void rollback() {
		try {
			cn.rollback();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
