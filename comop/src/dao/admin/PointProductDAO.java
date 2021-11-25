package dao.admin;

import java.util.List;

import bean.PointRewardBean;

public interface PointProductDAO {
	public List<PointRewardBean> getRewardProductsList();
	public void editRewardProduct(PointRewardBean p);
	public void addRewardProduct();
	public void removeRewardProduct(String reward_product_id);
}
