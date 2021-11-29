package command.move;

import command.AbstractCommand;
import tera.ResponseContext;

public class MoveSignInCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		resc.setTarget("signIn");
		return resc;
	}
}