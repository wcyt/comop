package command.user;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import command.AbstractCommand;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

// 現在のパスワードと新しいパスワードを取得
// ハッシュ化した現在のパスワードとDBのパスワードが一致したら
// ハッシュ化した新しいパスワードでDBのパスワードを上書き
public class ChangePasswordCommand extends AbstractCommand{

	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();

		//パラメータを取得
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		String nowpassword = reqc.getParameter("nowPassword")[0];
		String newpassword = reqc.getParameter("newPassword")[0];

		//現在のパスワードのハッシュ化
		// MD5
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] md5_result = md5.digest(nowpassword.getBytes());
		String hashedNowPassword = String.format("%020x", new BigInteger(1, md5_result));
		System.out.println("nowPassword MD5：" + hashedNowPassword);
        //現在のパスワードのハッシュ化ここまで

        //入力された現在のパスワードとDBのパスワードがあってるか UserDAOの取得上にもってきました
        UserDAO ud = factory.getUserDAO();
        if(ud.getPasswordHashByID(user_id) == hashedNowPassword) {
            //新しいパスワードのハッシュ化
            // MD5
            MessageDigest md5 = null;
            try {
                md5 = MessageDigest.getInstance("MD5");
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            byte[] md5_result = md5.digest(newpassword.getBytes());
            String hashedNewPassword = String.format("%020x", new BigInteger(1, md5_result));
            System.out.println("newPassword MD5：" + hashedNewPassword);

            //パスワードを変更
		    AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		    ud.changePassword(user_id, newpassword);
            //これは動くのでしょうか
		    reqc.setAttribute("mess","パスワードを変更しました");

        } else {
            //これは動くのでしょうか
            reqc.setAttribute("mess","パスワードが間違っています");

        }
		//top.jspに移動
		resc.setTarget("top");
		return resc;
	}
}