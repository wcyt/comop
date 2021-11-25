package dao.admin;

import java.util.List;

import bean.UserBean;

public interface UserManagementDAO {
	public List<UserBean> getUserList();
	public void lapseUser(String user_id);
}
