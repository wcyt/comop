package command.user;


import command.AbstractCommand;
import tera.RequestContext;
import tera.ResponseContext;

public class LogoutCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		reqc.invalidateSession();

		return resc;
	}
}
