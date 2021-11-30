package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class GetUserInfoCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];


		MySQLUserDAO msud = new MySQLUserDAO();
		UserBean ub = msud.getMyUserInfo("user_id");


		resc.setTarget("default");
		return resc;
	}
}