package command.admin;

import bean.ColorBean;
import command.AbstractCommand;
import dao.admin.ColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class AddColorCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] color_names = reqc.getParameter("color_name");

		String color_name = color_names[0];

		ColorBean cb = new ColorBean();

		cb.setColor_name(color_name);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ColorManagementDAO cmd = factory.getColorManagementDAO();
		cmd.addColor(cb);


		resc.setTarget("colorManagement");

		return resc;
	}
}
