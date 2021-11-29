package command.admin;

import command.AbstractCommand;
import dao.admin.ColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveColorCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
			RequestContext rc = getRequestContext();
			String colorId = rc.getParameter("color_id")[0];

			AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
			ColorManagementDAO cmd = factory.getColorManagementDAO();
			System.out.println(colorId + "削除作業中");

			cmd.removeColor(colorId);

			resc.setTarget("getColorList");

		return resc;
	}
}