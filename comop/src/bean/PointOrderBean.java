package bean;

import java.io.Serializable;

public class PointOrderBean implements Serializable {
	private int point_order_id;
	private int user_id;
	private String order_date;
	private int total_point_price;
	private int reward_product_id;
	private int buy_count;

	public PointOrderBean() {}

	public int getPoint_order_id() {
		return point_order_id;
	}

	public void setPoint_order_id(int point_order_id) {
		this.point_order_id = point_order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getTotal_point_price() {
		return total_point_price;
	}

	public void setTotal_point_price(int total_point_price) {
		this.total_point_price = total_point_price;
	}

	public int getReward_product_id() {
		return reward_product_id;
	}

	public void setReward_product_id(int reward_product_id) {
		this.reward_product_id = reward_product_id;
	}

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
}
