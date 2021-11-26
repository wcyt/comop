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

		String[] colorIds = reqc.getParameter("color_id");
		String[] colorNames = reqc.getParameter("color_name");

		String colorId = colorIds[0];
		String colorName = colorNames[0];

		ColorBean cb = new ColorBean();

		cb.setColor_id(colorId);
		cb.setColor_name(colorName);

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ColorManagementDAO cmd = factory.getColorManagementDAO();
		cmd.addColor(colorName);

		if (cmd.getColor(cb.getColor_id()) != null) {

			rqsc.setAttribute("mess", (Object) "このIDはすでに使用されています");

		} else {

			cmd.addColor(cb);
			rqsc.setAttribute("mess", (Object) "新しいカラーを追加しました");

		}

		resc.setTarget("colorManagement");

		return resc;
	}
}
