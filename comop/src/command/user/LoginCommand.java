package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		// パラメータの取得
		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];

		//TODO パスワードをハッシュ化してからDBに登録されたハッシュと同じか比較

		// Beanにセット
		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();

		//TODO 未登録の場合に、未登録である旨のメッセージを出すならここいじる
		String passwordHash = userDAO.getPasswordHash(mail);
		System.out.println("Login: passVal.input " + password + " db " + passwordHash);
		// メールアドレスがadmin@adminかつパスワードがadminの時にadmin.jspに移動する
		if (mail.equals("admin@admin") && password.equals("admin")) {
			resc.setTarget("admin");
		} else if (password.equals(passwordHash) && reqc.getSessionAttribute("user") == null) {
			//TODO セッションに必要なユーザー情報を持ったBeanInstを登録
			UserBean u = new UserBean();
			u = userDAO.getMyUserInfo(mail);
			reqc.setSessionAttribute("user", u);
			System.out.println("Login: loginsuccess");

			resc.setTarget("top");
		} else {
			//TODO setAttribute("message", "まちがってるよ的なやつ") と ハッシュ化関連
			System.out.println("Login: passEquals.else");
			reqc.setAttribute("message", "メールアドレスまたはパスワードが一致しません");
			resc.setTarget("signIn");
		}

		//トランザクションを終了
		Connector.getInstance().commit();
		//コネクションを切断
		Connector.getInstance().close();

		return resc;
	}
}