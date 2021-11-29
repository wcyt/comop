package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveTopCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("top");
		return resc;
	}
}
