package dao.order;

import java.util.List;

import bean.PointOrderBean;

public interface PointOrderDAO {
	public void addPointOrder(PointOrderBean po);
	public List<PointOrderBean> getPointOrderList(int user_id);
	public void minusPoint(PointOrderBean pointOrderBean, int user_id);
}
