package tera;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.AbstractCommand;
import command.CommandFactory;

public class WebApplicationController implements ApplicationController {
	// RequestContextのFactoryMethod
	public RequestContext getRequest(Object request) {
		RequestContext requestContext = new WebRequestContext();

		// HttpServletRequestの実装クラスのインスタンスをセットする
		requestContext.setRequest(request);

		return requestContext;
	}

	// ResponseContextのFactoryMethod、コア処理の選択と実行も行う
	public ResponseContext handleRequest(RequestContext requestContext) {

		AbstractCommand abstractCommand = CommandFactory.getCommand(requestContext);
		abstractCommand.init(requestContext);

		// コマンドを実行する
		// ここで具象ResponseContextのインスタンスを渡す
		ResponseContext responseContext = abstractCommand.execute(new WebResponseContext());

		return responseContext;
	}

	// コア処理の結果を取得、Viewの選択と転送を行う
	public void handleResponse(RequestContext requestContext, ResponseContext responseContext) {

		// Objectを返すためキャストする必要がある
		HttpServletRequest httpServletRequest = (HttpServletRequest) requestContext.getRequest();
		HttpServletResponse httpServletResponse = (HttpServletResponse) responseContext.getResponse();

		// コア処理の実行結果を取得して登録を行う
		httpServletRequest.setAttribute("data", responseContext.getResult());

		RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher(responseContext.getTarget());
		try {
			requestDispatcher.forward(httpServletRequest, httpServletResponse);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
