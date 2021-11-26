package dao.user;

import bean.UserBean;

public interface UserDAO {
	public void createAccount(UserBean u);
	public void changePassword(String user_id,String pass);
	public void editUserInfo(UserBean u);
	public void lapseUser(String user_id);
	public void updatePoint(String user_id,String point);
	public UserBean getMyUserInfo(String user_id);
	public boolean login(String user_id,String password);
}
