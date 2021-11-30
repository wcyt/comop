package command.user;

import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class LapseUserCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rqsc = getRequestContext();

		//パラメータを取得
		String user_id = (String)rqsc.getParameter("user_id")[0];

		//ユーザーを退会
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO msud = factory.getUserDAO();
		msud.lapseUser(user_id);

		//default.jspに移動
		resc.setTarget("default");

		return resc;
	}

}





