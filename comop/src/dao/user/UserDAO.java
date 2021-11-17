package dao.user;

public interface UserDAO {
	public void createAccount(User u);
	public void changePassword(String user_id,String pass);
	public void editUserInfo(User u);
	public void lapseUser(String user_id);
	public void updatePoint(String user_id,int point);
	public User getMyUserInfo(String user_id);
}
