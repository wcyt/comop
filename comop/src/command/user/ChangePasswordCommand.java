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

		int user_id = Integer.parseInt(rqsc.getParameter("user_id")[0]);
		String password = rqsc.getParameter("password")[0];

		UserBean u = new UserBean();
		u.setUser_id(user_id);
		u.setPassword(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.changePassword(user_id, password);

//		reqc.setAttribute("mess","パスワードを変更しました");

		resc.setTarget("index");
		return resc;
	}
}
