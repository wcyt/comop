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

		//パラメータを取得
		String color_name = reqc.getParameter("color_name")[0];

		ColorBean cb = new ColorBean();
		cb.setColor_name(color_name);

		// 色の追加
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ColorManagementDAO cmd = factory.getColorManagementDAO();
		cmd.addColor(color_name);

		// カラーIDとカラー名を全て取得
		GetColorListCommand getColorListCommand = new GetColorListCommand();
		getColorListCommand.execute(resc);

		//colorManagement.jspに移動
		resc.setTarget("colorManagement");

		return resc;
	}
}
