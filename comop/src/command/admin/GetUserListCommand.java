package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.MySQLUserManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetUserListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLUserManagementDAO msumd = factory.getMySQLUserManagemantDAO();

		List users = msumd.getUserList();


		resc.setResult(users);
		resc.setTarget("userManagement");

		return resc;
	}
}




