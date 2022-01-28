package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveLeaveCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		// top.jspに移動
		resc.setTarget("leave");
		return resc;
	}
}
