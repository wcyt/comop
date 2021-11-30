package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveAdminCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("admin");
		return resc;
	}
}
