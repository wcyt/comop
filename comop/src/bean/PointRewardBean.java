package bean;

import java.io.Serializable;

public class PointRewardBean implements Serializable {
	private int reward_product_id;
	private String reward_product_name;
	private String reward_product_image;
	private String reward_product_description;
	private int stock_quantity;
	private int point_price;

	public PointRewardBean() {}

	public int getReward_product_id() {
		return reward_product_id;
	}

	public void setReward_product_id(int reward_product_id) {
		this.reward_product_id = reward_product_id;
	}

	public String getReward_product_name() {
		return reward_product_name;
	}

	public void setReward_product_name(String reward_product_name) {
		this.reward_product_name = reward_product_name;
	}

	public String getReward_product_image() {
		return reward_product_image;
	}

	public void setReward_product_image(String reward_product_image) {
		this.reward_product_image = reward_product_image;
	}

	public String getReward_product_description() {
		return reward_product_description;
	}

	public void setReward_product_description(String reward_product_description) {
		this.reward_product_description = reward_product_description;
	}

	public int getStock_quantity() {
		return stock_quantity;
	}

	public void setStock_quantity(int stock_quantity) {
		this.stock_quantity = stock_quantity;
	}

	public int getPoint_price() {
		return point_price;
	}

	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
}
