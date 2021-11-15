package tera;

public interface ResponseContext {
	public Object getResult();
	public String getTarget();
	public void setResult(Object bean);
	public void setTarget(String transferInfo);
	public void setResponse(Object object);
	public Object getResponse();
}
