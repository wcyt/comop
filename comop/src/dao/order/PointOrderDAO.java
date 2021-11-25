package dao.order;

import java.util.List;

import bean.PointOrderBean;

public interface PointOrderDAO {
	public void addPointOrder(PointOrderBean po);
	public List getPointOrderList(String user_id);
}
