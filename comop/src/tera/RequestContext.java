package tera;

import java.util.Map;

public interface RequestContext {
	public String getCommandPath();
	public String[] getParameter(String key);
	public Object getRequest();
	public void setRequest(Object request);
	public Map getParameterMap();

	public Object getAttribute(String key);
	public void setAttribute(String key, Object object);

	public Object getSessionAttribute(String key);
	public void setSessionAttribute(String key,Object o);
	public void invalidateSession();
}
