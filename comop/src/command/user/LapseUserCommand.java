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
		msud.lapseUser(user_id);


		return resc;
	}

}


