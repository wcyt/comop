package command.admin;

import java.util.List;

import bean.ColorBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.ColorManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetColorListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		//カラー一覧を取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		ColorManagementDAO cmd = factory.getColorManagementDAO();
		List<ColorBean> colors = cmd.getColorList();

		resc.setResult(colors);

		//トランザクションを終了する
		Connector.getInstance().commit();

		//colorManagement.jspに移動
		resc.setTarget("colorManagement");

		return resc;
	}
}
