package command.admin;

import java.util.List;

import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.admin.UserManagementDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetUserListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		// ユーザー一覧の取得
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserManagementDAO umd = factory.getUserManagementDAO();
		List<UserBean> users = umd.getUserList();

		resc.setResult(users);
		resc.setTarget("userManagement");

		return resc;
	}
}