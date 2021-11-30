package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveUserManagementCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("userManagement");
		return resc;
	}
}
