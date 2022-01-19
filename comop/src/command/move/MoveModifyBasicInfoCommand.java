package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveModifyBasicInfoCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("modifyBasicInfo");
		return resc;
	}
}
