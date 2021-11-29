package command.user;

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
