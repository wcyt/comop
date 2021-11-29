package command.user;

import bean.UserBean;
import command.AbstractCommand;
<<<<<<< HEAD
import dao.user.MySQLUserDAO;
=======
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;
<<<<<<< HEAD

=======

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
public class LoginCommand extends AbstractCommand {
	boolean isRegist=false;
<<<<<<< HEAD

=======

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
<<<<<<< HEAD

		String[] mails = reqc.getParameter("mail");
		String[] passwords = reqc.getParameter("password");

=======

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];
<<<<<<< HEAD


		String mail = mails[0];
		String password = passwords[0];
=======
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

<<<<<<< HEAD
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getMySQLUserDAO();

		resc.setResult(msud.login(ub));

=======
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		userDAO.login(mail, password);

		// adminの場合
		if (mail == "admin" && password == "admin") {
			resc.setTarget("admin");
		}

<<<<<<< HEAD
		resc.setTarget("top");
=======
		resc.setTarget("top");
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

		return resc;
	}
}
