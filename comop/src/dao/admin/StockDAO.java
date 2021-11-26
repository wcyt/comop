package dao.admin;

import java.util.List;

import bean.StockBean;

public interface StockDAO {
	public void addStock(StockBean s);
	public List<StockBean> getStockList();
}
