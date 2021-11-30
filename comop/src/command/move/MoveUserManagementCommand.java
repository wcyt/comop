package command.move;

import command.AbstractCommand;
import command.admin.GetUserListCommand;
import tera.ResponseContext;

public class MoveUserManagementCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		// ユーザー一覧の取得
		GetUserListCommand getUserListCommand = new GetUserListCommand();
		getUserListCommand.execute(resc);

		// userManagement.jspに移動
		resc.setTarget("userManagement");
		return resc;
	}
}
