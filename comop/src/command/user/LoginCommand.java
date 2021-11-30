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
		String passwordHash = userDAO.getPasswordHash(mail);
		if(password.equals(passwordHash)) {
			resc.setTarget("top");
		} else {
			//TODO setAttribute("message", "まちがってるよ的なやつ") と ハッシュ化関連

			resc.setTarget("signIn");
		}

		// adminに飛ぶ場合
		if (mail.equals("admin@admin") && password.equals("admin")) { resc.setTarget("admin"); }
		else { resc.setTarget("top"); }

		return resc;
	}
}
