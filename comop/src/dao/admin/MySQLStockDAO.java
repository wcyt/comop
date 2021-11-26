package dao.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.StockBean;
import dao.Connector;

public class MySQLStockDAO implements StockDAO {
	private PreparedStatement st = null;

	//
	public void addStock(StockBean s) {
		try {
			Connection cn = Connector.connect();

			String sql = "INSERT into stock_table(user_id,product_id,old_stock,new_stock,stock_change) values(?,?,?,?,?)";

			st = cn.prepareStatement(sql);

			st.setInt(1, s.getUser_id());
			st.setInt(2, s.getProduct_id());
			st.setInt(3, s.getOld_stock());
			st.setInt(4, s.getNew_stock());
			st.setInt(5, s.getStock_change());

			st.executeUpdate();

			cn.commit();
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//
	public List<StockBean> getStockList(){
		ArrayList<StockBean> stocks = new ArrayList<StockBean>();
		try {
			Connection cn = Connector.connect();

			String sql = "SELECT stock_change_id,user_id,product_id,old_stock,new_stock,stock_change FROM stock_table";
			st = cn.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				StockBean s=new StockBean();

				s.setStock_change_id(rs.getInt(1));
				s.setUser_id(rs.getInt(2));
				s.setProduct_id(rs.getInt(3));
				s.setOld_stock(rs.getInt(4));
				s.setNew_stock(rs.getInt(5));
				s.setStock_change(rs.getInt(6));

				stocks.add(s);
			}
			cn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return stocks;
	}
}
