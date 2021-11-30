package tera;

import java.util.Map;

public interface RequestContext {
	public String getCommandPath();
	public String[] getParameter(String key);
	public Object getRequest();
	public void setRequest(Object request);
	public Map getParameterMap();
}
