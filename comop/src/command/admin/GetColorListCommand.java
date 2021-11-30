package command.admin;

import java.util.List;

import bean.ColorBean;
import command.AbstractCommand;
import dao.admin.ColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetColorListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ColorManagementDAO cmd = factory.getColorManagementDAO();

		List<ColorBean> colors = cmd.getColorList();

		resc.setResult(colors);
		resc.setTarget("colorManagement");

		return resc;
	}
}
