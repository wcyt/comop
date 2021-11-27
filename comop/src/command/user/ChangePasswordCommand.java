package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class ChangePasswordCommand extends AbstractCommand{

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rqsc = getRequestContext();

		int userId = Integer.parseInt(rqsc.getParameter("user_id")[0]);
		String password = rqsc.getParameter("password")[0];

		UserBean u = new UserBean();
		u.setUser_id(userId);
		u.setPassword(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.changePassword(userId, password);

//		reqs.setAttribute("mess","パスワードを変更しました");

		resc.setTarget("index");
		return resc;
	}
}
