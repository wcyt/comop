package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import tera.ResponseContext;

class GetUserInfoCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		UserBean u;
		MySQLUserDAO msud = new MySQLUserDAO();
		resc.setResult(msud.getUserInfo(u));

		return resc;
	}
}