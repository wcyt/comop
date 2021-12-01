package dao.user;

import bean.UserBean;

public interface UserDAO {
	public void createAccount(UserBean u);
	public void changePassword(int user_id,String pass);
	public void editUserInfo(UserBean u);
	public void lapseUser(String user_id);
	public void updatePoint(String user_id,String point);
	//user_idからユーザー情報を取得するものは使わなそうなので、mailからユーザ情報を取得するものに変えました
	public UserBean getMyUserInfo(String mail);
	public String getPasswordHash(String mail);
}
