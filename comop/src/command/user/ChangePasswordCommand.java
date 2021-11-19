package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class ChangePasswordCommand extends AbstractCommand{

	public ResponseContext execute(ResponseContext resc) {
		RequestContext rqsc = getRequestContext();


		String password = rqsc.getParameter("password");

		UserBean u = new UserBean();

		u.setPassword(password);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDao msud = factory.getFactory();
		msud.changePassword(u);


		resc.setTarget("トップに行くか、編集ページに戻るか選ぶページをはさむ");
		return resc;
	}

}
