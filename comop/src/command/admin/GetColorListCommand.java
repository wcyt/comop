package command.admin;

import java.util.List;

import command.AbstractCommand;
import dao.AbstractDaoFactory;
import dao.admin.MySQLColorManagementDAO;
import tera.RequestContext;
import tera.ResponseContext;

public class GetColorListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		MySQLColorManagementDAO mscmd = factory.getMySQLColorManagemantDAO();

		List colors = mscmd.getColorList();


		resc.setResult(colors);
		resc.setTarget("colorManagement");

		return resc;
	}
}
