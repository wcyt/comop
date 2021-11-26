package command.user;

import command.AbstractCommand;
import dao.user.MySQLUserDAO;;
import dao.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class LapseUserCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rqsc = getRequestContext();

		String user_id = (String)rqsc.getSessionAttribute("user_id");


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserDAO msud = factory.getFactory();
		System.out.print(user_id+"を削除しました");
		msud.lapseUser(user_id);

		rqsc.setAttribute("mess",user_id+"を削除しました")

		return resc;
	}

}


