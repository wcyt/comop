package command.user;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class CreateAccountCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータを取得
		String name = reqc.getParameter("name")[0];
		String mail = reqc.getParameter("mail")[0];
		String password = reqc.getParameter("password")[0];

		//トランザクションを開始
		Connector.getInstance().beginTransaction();

		UserBean u = new UserBean();
		u.setName(name);
		u.setMail(mail);
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
		System.out.println("CreateAccount MD5：" + hashedPassword);
		u.setPassword(hashedPassword);

		//アカウントを作成
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO ud = factory.getUserDAO();
		ud.createAccount(u);

		//トランザクションを終了する
		Connector.getInstance().commit();

		System.out.println(name + " " + mail + " " + hashedPassword);

		//signUpComplete.jspに移動
		resc.setTarget("signUpComplete");
		//		if (msud.getMail(mail).equals("nomail") == false) {
		//
		//			reqc.setAttribute("mess", "このメールアドレスは使われています");
		//
		//			resc.setTarget("signUp");
		//
		//		} else {
		//
		//			msud.createAccount(u);
		//			reqc.setAttribute("mess", "ユーザーを登録しました");
		//
		//			resc.setTarget("signUpComplete");
		//		}
		return resc;

	}
}