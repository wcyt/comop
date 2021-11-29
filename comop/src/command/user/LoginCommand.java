package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class LoginCommand extends AbstractCommand {
	boolean isRegist=false;

	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();


		String[] mails = reqc.getParameter("mail");
		String[] passwords = reqc.getParameter("password");

		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];

		String mail = mails[0];
		String password = passwords[0];

		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getMySQLUserDAO();

		resc.setResult(msud.login(ub));

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		userDAO.login(mail, password);

		// adminの場合
		if (mail == "admin" && password == "admin") {
			resc.setTarget("admin");
		}

		resc.setTarget("top");

		return resc;
	}
}
