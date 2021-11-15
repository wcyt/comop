package tera;


public class InputCommand extends AbstractCommand {
	public WebResponseContext execute(ResponseContext responseContext) {
		WebResponseContext webResponseContext = new WebResponseContext();
		webResponseContext.setTarget("input");
		return webResponseContext;
	}
}

//String url = "WEB-INF/jsp/input.jsp";
//return url;