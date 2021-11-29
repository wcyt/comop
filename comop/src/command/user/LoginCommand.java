package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.MySQLUserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

<<<<<<< HEAD
public class LoginCommand  extends AbstractCommand {
	boolean isRegist=false;
=======
public class LoginCommand extends AbstractCommand {

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

<<<<<<< HEAD
		String[] mails = reqc.getParameter("mail");
		String[] passwords = reqc.getParameter("password");
=======
		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

<<<<<<< HEAD
		String mail = mails[0];
		String password = passwords[0];

		UserBean ub = new UserBean();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getMySQLUserDAO();

		resc.setResult(msud.login(ub));

=======
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		userDAO.login(mail, password);

		// adminの場合
		if (mail == "admin" && password == "admin") {
			resc.setTarget("admin");
		}

		resc.setTarget("top");
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

		return resc;
	}
}
