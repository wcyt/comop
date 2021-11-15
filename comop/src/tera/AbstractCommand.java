package tera;

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


//private Map<String,String> parameters;
//private Object result;
//
//protected Map<String,String> getParameters() {
//	return parameters;
//}
//
//public void init(Map<String,String> parameters) {
//	this.parameters = parameters;
//}
//
//public Object getResult() {
//	return result;
//}
//
//protected void setResult(Object data) {
//	this.result = data;
//}
//
//public abstract String execute();