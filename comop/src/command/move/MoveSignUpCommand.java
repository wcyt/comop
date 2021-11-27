package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveSignUpCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("signUp");
		return resc;
	}
}
