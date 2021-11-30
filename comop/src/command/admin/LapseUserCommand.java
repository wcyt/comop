package command.admin;

import command.AbstractCommand;
import dao.admin.UserManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;


public class LapseUserCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext rqsc = getRequestContext();

		String user_id = (String)rqsc.getParameter("user_id")[0];


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserManagementDAO msud = factory.getUserManagementDAO();

		msud.lapseUser(user_id);

		return resc;
	}

}


