package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		String mail = reqc.getParameter("mailAddress")[0];
		String password = reqc.getParameter("password")[0];
		//TODO パスワードをハッシュ化してからDBに登録されたハッシュと同じか比較
		// adminログイン用if
			if (mail.equals("admin@admin") && password.equals("admin")) { resc.setTarget("admin"); }

		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(password);

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();
		//TODO 未登録の場合に、未登録である旨のメッセージを出すならここいじる
		String passwordHash = userDAO.getPasswordHash(mail);
		System.out.println("Login: passVal.input "+ password +" db "+ passwordHash);
		if(password.equals(passwordHash)) {
			//TODO セッションに必要なユーザー情報を持ったBeanInstを登録
			resc.setTarget("top");
		} else {
			System.out.println("Login: passEquals.else");
			reqc.setAttribute("message", "メールアドレスまたはパスワードが一致しません");
			resc.setTarget("signIn");
		}
		return resc;
	}
}
