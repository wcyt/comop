package tera;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FavoriteBean;
import bean.ProductBean;
import bean.UserBean;
import command.AbstractCommand;
import command.CommandFactory;
import dao.favorite.FavoriteDAO;
import dao.product.ProductDAO;
import daofactory.AbstractDaoFactory;

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

		String uri = httpServletRequest.getRequestURI();
		if (uri.equals("/comop/top")) {
			AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
			FavoriteDAO favoritedao = factory.getFavoriteDAO();
			ProductDAO prodao = factory.getProductDAO();

			List<ProductBean> sortFavoriteCountList = prodao.sortFavoriteCount();
			requestContext.setAttribute("favoriteCountList", sortFavoriteCountList);

			List randomProductList = prodao.randomProduct();
			requestContext.setAttribute("randomProductList", randomProductList);

			//ログインしてるときは自分のお気に入りを表示
			if (requestContext.getSessionAttribute("user") != null) {
				String user_id = String.valueOf(((UserBean) requestContext.getSessionAttribute("user")).getUser_id());
				List<FavoriteBean> favoriteList = favoritedao.getFavoriteList(user_id);
				requestContext.setAttribute("favoriteList", favoriteList);
			}
		}

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
