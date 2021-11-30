package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.UserManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetUserListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserManagementDAO msumd = factory.getUserManagementDAO();

		List users = msumd.getUserList();


		resc.setResult(users);
		resc.setTarget("userManagement");

		return resc;
	}
}




