package dao.admin;

import java.util.List;

import bean.PointRewardBean;

public interface PointProductManagementDAO {
	public List<PointRewardBean> getRewardProductsList();
	public void editRewardProduct(PointRewardBean p);
<<<<<<< HEAD
	public void addRewardProduct();
	public void removeRewardProduct(String reward_product_id);
=======
	public void addRewardProduct(PointRewardBean p);

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
}
