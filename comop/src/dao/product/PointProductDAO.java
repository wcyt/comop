package dao.product;

import java.util.List;

import bean.PointRewardBean;

public interface PointProductDAO {
	public List<PointRewardBean> getRewardProductsList();
	public List<PointRewardBean> searchRewardProducts(String key);
}
