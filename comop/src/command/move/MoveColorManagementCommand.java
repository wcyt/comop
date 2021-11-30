package command.move;

import command.AbstractCommand;
import command.admin.GetColorListCommand;
import tera.ResponseContext;

public class MoveColorManagementCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		// カラーIDとカラー名を全て取得
		GetColorListCommand getColorListCommand = new GetColorListCommand();
		getColorListCommand.execute(resc);

		// colorManagement.jspに移動
		resc.setTarget("colorManagement");
		return resc;
	}
}
