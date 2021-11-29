package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.admin.MySQLColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetColorListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLColorManagementDAO mscmd = factory.getMySQLColorManagemantDAO();

		List colors = mscmd.getColorList();


		resc.setResult(colors);
		resc.setTarget("colorManagement");

		return resc;
	}
}
