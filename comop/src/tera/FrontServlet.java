package tera;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

/**
 * Servlet implementation class FrontServlet
 */
//@WebServlet("/FrontServlet")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-- FrontServletStart --");
		request.setCharacterEncoding("UTF-8");

		// ApplicationControllerの実装インスタンスを取得する
		ApplicationController applicationController = new WebApplicationController();

		// FactoryMethodを呼び出して、具象クラスのインスタンスを取得する
		RequestContext requestContext = applicationController.getRequest(request);

		// FactoryMethodを呼び出し、RequestContextを渡してResponseContextを取得する
		ResponseContext responseContext = applicationController.handleRequest(requestContext);

		// ResponseContextにHttpServletResponseインターフェースの実装インスタンスを格納する
		responseContext.setResponse(response);

		applicationController.handleResponse(requestContext, responseContext);
		System.out.println("-- FrontServletEnd --");
	}
}
