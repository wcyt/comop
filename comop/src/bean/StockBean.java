package bean;

import java.io.Serializable;

public class StockBean implements Serializable {
	private int stock_change_id;
	private int product_id;
	private int user_id;
	private int old_stock;
	private int new_stock;
	private int stock_change;

	public StockBean() {}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOld_stock() {
		return old_stock;
	}

	public void setOld_stock(int old_stock) {
		this.old_stock = old_stock;
	}

	public int getNew_stock() {
		return new_stock;
	}

	public void setNew_stock(int new_stock) {
		this.new_stock = new_stock;
	}

	public int getStock_change() {
		return stock_change;
	}

	public void setStock_change(int stock_change) {
		this.stock_change = stock_change;
	}

	public int getStock_change_id() {
		return stock_change_id;
	}

	public void setStock_change_id(int stock_change_id) {
		this.stock_change_id = stock_change_id;
	}
}
