package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveModifyPasswordCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("modifyPassword");
		return resc;
	}
}
