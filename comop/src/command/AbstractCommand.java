package command;

import tera.RequestContext;
import tera.ResponseContext;

public abstract class AbstractCommand {
	// RequestContextを格納するインスタンス変数
	private RequestContext requestContext;

	public void init(RequestContext requestContext) {
		this.requestContext = requestContext;
	}

	public RequestContext getRequestContext() {
		return requestContext;
	}

	public abstract ResponseContext execute(ResponseContext responseContext);
}
