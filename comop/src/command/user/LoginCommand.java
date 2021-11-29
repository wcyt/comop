package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

class LoginCommand  extends AbstractCommand {
	boolean isRegist=false;
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		String[] mails = reqc.getParameter("mail");
		String[] passwords = reqc.getParameter("password");

		String mail = mails[0];
		String password = passwords[0];

		UserBean ub = new UserBean();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getMySQLUserDAO();

		resc.setResult(msud.login(ub));


		return resc;
	}
}
