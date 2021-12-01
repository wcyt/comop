package tera;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebRequestContext implements RequestContext {
	private Map parameters;
	private HttpServletRequest request;
	private HttpSession session;

	public WebRequestContext() {
	}

	@Override
	public String getCommandPath() {
		String servletPath = request.getServletPath(); //	サーブレットパスを取得する
		String commandPath = servletPath.substring(1); // 2文字目以降を取得
		return commandPath;
	}

	@Override
	public String[] getParameter(String key) {
		return (String[]) parameters.get(key);
	}

	@Override
	public Object getRequest() {
		return request;
	}

	@Override
	public void setRequest(Object req) {
		request = (HttpServletRequest) req;
		parameters = request.getParameterMap();
	}

	public Map getParameterMap() {
		return parameters;
	}

	@Override
	public Object getAttribute(String key) {
		return request.getAttribute(key);
	}

	@Override
	public void setAttribute(String key, Object object) {
		request.setAttribute(key, object);
	}

	@Override
	public Object getSessionAttribute(String key) {
		session=request.getSession();
		return session.getAttribute(key);
	}

	@Override
	public void setSessionAttribute(String key, Object o) {
		session = request.getSession();
		session.setAttribute(key, o);
	}

	@Override
	public void invalidateSession() {
		session = request.getSession();
		session.invalidate();
	}

}
