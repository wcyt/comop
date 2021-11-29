package command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import command.AbstractCommand;
import tera.RequestContext;
import tera.ResponseContext;

public class LogoutCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {
		//RequestContext reqc = getRequestCotext();

		RequestContext requestContext = getRequestContext();
				HttpServletRequest httpServletRequest = (HttpServletRequest) requestContext.getRequest();
		HttpSession session = httpServletRequest.getSession();

		session.invalidate();


		return resc;
	}
}
