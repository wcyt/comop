package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveModifyAddressCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("modifyAddress");
		return resc;
	}
}
