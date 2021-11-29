package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class LoginCommand extends AbstractCommand {
	boolean isRegist=false;

	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];

		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

		System.out.println("beanまでは北");

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		userDAO.login(mail, password);

		resc.setTarget("top");

		return resc;
	}
}
