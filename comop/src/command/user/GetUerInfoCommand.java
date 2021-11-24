package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import tera.ResponseContext;

class GetUserInfoCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		UserBean u = new UserBean();
		MySQLUserDAO msud = new MySQLUserDAO();
		resc.setResult(msud.getUserInfo(u));

		resc.setTarget("default");
		return resc;
	}
}