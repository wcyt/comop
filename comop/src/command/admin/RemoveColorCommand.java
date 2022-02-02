package command.admin;

import java.util.List;

import bean.ColorBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.ColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class RemoveColorCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
			RequestContext rc = getRequestContext();

			//パラメータを取得
			String colorId = rc.getParameter("color_id")[0];

			Connector.getInstance().beginTransaction();

			//カラーを削除
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
			ColorManagementDAO cmd = factory.getColorManagementDAO();
			System.out.println(colorId + "削除作業中");
			cmd.removeColor(colorId);

			Connector.getInstance().commit();

			List<ColorBean> colors = cmd.getColorList();
			resc.setResult(colors);

			//colorManagement.jspに移動
			resc.setTarget("colorManagement");

		return resc;
	}
}