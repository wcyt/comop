package tera;

import java.io.IOException;

public interface ResponseContext {
	public Object getResult();
	public String getTarget();
	public void setResult(Object bean);
	public void setTarget(String transferInfo);
	public void setResponse(Object object);
	public Object getResponse();
	public void sendRedirect(String url) throws IOException;
}
