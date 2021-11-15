package tera;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

/**
 * Servlet implementation class FrontServlet
 */
@WebServlet("/FrontServlet")
public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		//		String path = request.getServletPath(); // /members
		//        String newUrl = "test".concat(path); // test/members
		//        String result = "/".concat(newUrl.replace("/", "")); // /testmembers
		//		String url = "/WEB-INF/jsp" + result + ".jsp";
		//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		//		dispatcher.forward(request, response);

		//		// Mapとしてパラメータを取得
		//		Map data = request.getParameterMap();
		//
		//		// サーブレットパスを取得し、ConcreteCommandを取得する
		//		String path = request.getServletPath();
		//
		//		// プロパティファイルを読み込んで、中身に一致するやつに飛ばす
		//		AbstractCommand command = CommandFactory.getCommand(path);
		//		command.init(data); // コア処理に入力パラメータを渡す
		//
		//		// コア処理の実行し、戻り値としてViewの情報を取得する、
		//		String url = command.execute(); // ここでコマンドが呼ばれて、サーブレットに飛ばされる
		//
		//		// コア処理の実行結果を取得し、登録処理を行う（JSP）
		//		Object result = command.getResult();
		//		request.setAttribute("result", result);

		//		Set map_ite1 = data.keySet();
		//		Iterator i = map_ite1.iterator();
		//		while (i.hasNext()) {
		//			String key = (String) i.next();
		//			String par[] = (String[]) data.get(key);
		//			System.out.println(key + "=" + par[0]);
		//		}

		//		System.out.println("Path: " + path);
		//		System.out.println("URL: " + url);
		//
		//		System.out.println("-- FrontServlet --");
		//		System.out.println("");

		//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		//		dispatcher.forward(request, response);

		// Context Object
		//		request.setCharacterEncoding("UTF-8");
		//
		//		RequestContext requestContext = new WebRequestContext();
		//		requestContext.setRequest(request);
		//
		//		AbstractCommand command = CommandFactory.getCommand(requestContext);
		//		command.init(requestContext);
		//
		//		// コマンドを実行する
		//		// 戻り値としてResponseContextのインスタンスを得る
		//		ResponseContext responseContext = command.execute();
		//
		//		// ResponseContextから処理結果を取得する
		//		Object bean = responseContext.getResult();
		//
		//		request.setAttribute("data", bean);
		//
		//		RequestDispatcher dispatcher = request.getRequestDispatcher(responseContext.getTarget());
		//		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-- FrontServlet --");
		request.setCharacterEncoding("UTF-8");

		// ApplicationControllerの実装クラスのインスタンスを取得する
		ApplicationController applicationController = new WebApplicationController();

		// FactoryMethodを呼び出して、具象クラスのインスタンスを取得する
		RequestContext requestContext = applicationController.getRequest(request);

		// FactoryMethodを呼び出し、RequestContextを渡してResponseContextを取得する
		ResponseContext responseContext = applicationController.handleRequest(requestContext);

		// ResponseContextにHttpServletResponseインターフェースを実装するくらすのインスタンスを格納する
		responseContext.setResponse(response);

		applicationController.handleResponse(requestContext, responseContext);
		System.out.println("-- FrontServlet --");
	}
}
