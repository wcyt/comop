package tera;

import javax.servlet.http.HttpServletResponse;

public class WebResponseContext implements ResponseContext {
	private Object result; // Object型の代わりにBeanのスーパークラスでも可
	private String target;
	private HttpServletResponse response; // HttpServletResponseインターフェースの実装クラスのインスタンスを格納する

	public WebResponseContext() {}

	@Override
	public void setTarget(String transferInfo) {
		target = "/WEB-INF/JSP/" + transferInfo + ".jsp";
	}

	// 転送先のViewに関する情報を返す
	@Override
	public String getTarget() {
		return target;
	}

	@Override
	public void setResult(Object bean) {
		result = bean;
	}

	// 処理結果を返す
	@Override
	public Object getResult() {
		return result;
	}

	@Override
	public Object getResponse() {
		return response;
	}

	@Override
	public void setResponse(Object object) {
		response = (HttpServletResponse) object;
	}
}
