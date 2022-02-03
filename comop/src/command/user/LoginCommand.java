package command.user;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import bean.UserBean;
import command.AbstractCommand;
import command.admin.GetUserListCommand;
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

		//パスワードのハッシュ化
				// MD5
				MessageDigest md5 = null;
				try {
					md5 = MessageDigest.getInstance("MD5");
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				byte[] md5_result = md5.digest(password.getBytes());
				String hashedPassword = String.format("%020x", new BigInteger(1, md5_result));
				System.out.println("Login MD5：" + hashedPassword);

		// Beanにセット
		UserBean ub = new UserBean();
		ub.setMail(mail);
		ub.setPassword(hashedPassword);

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		AbstractDaoFactory daoFactory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = daoFactory.getUserDAO();

		//TODO 未登録の場合に、未登録である旨のメッセージを出すならここいじる
		//hashedPassword(登録など入力された値をハッシュ化したもの)
		//passwordHash(DBからHash値をとってきたもの)
		//名前の似た変数が2つできちゃったので追々修正します
		String passwordHash = userDAO.getPasswordHash(mail);
		System.out.println("Login: passVal.input " + password + " db " + passwordHash);

		// メールアドレスがadmin@adminかつパスワードがadminの時にuserManagement.jspに移動する
		if (mail.equals("admin@admin") && password.equals("admin")) {
			GetUserListCommand getUserListCommand = new GetUserListCommand();
			getUserListCommand.execute(resc);
			resc.setTarget("userManagement");
		} else {
			if (hashedPassword.equals(passwordHash)) {
				System.out.println("MailAddress: " + mail + " Password: " + password + " PasswordHash:" + passwordHash);

				if (reqc.getSessionAttribute("user") == null) {
					//TODO セッションに必要なユーザー情報を持ったBeanInstを登録
					UserBean u = new UserBean();
					u = userDAO.getMyUserInfo(mail);
					System.out.println(u.getUser_lapse());
					if(u.getUser_lapse() == 1) {
						//退会済みのユーザーのログインを拒否
						System.out.println("Login: user_lapse");
						reqc.setAttribute("message", "このユーザーは退会しています");
						resc.setTarget("signIn");
					}else {
						reqc.setSessionAttribute("user", u);
						System.out.println("Login: loginsuccess");
						resc.setTarget("top");
					}
				}
			} else {
				//TODO setAttribute("message", "まちがってるよ的なやつ") と ハッシュ化関連
				System.out.println("Login: passEquals.else");
				reqc.setAttribute("message", "メールアドレスまたはパスワードが一致しません");
				resc.setTarget("signIn");
			}
		}
		return resc;
	}
}