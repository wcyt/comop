package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveRewardProductManagementCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("rewardProductManagement");
		return resc;
	}
}