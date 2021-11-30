package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];

		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		userDAO.login(mail, password);

		// adminに飛ぶ場合
		if (mail.equals("admin@admin") && password.equals("admin")) { resc.setTarget("admin"); }
		else { resc.setTarget("top"); }

		return resc;
	}
}
