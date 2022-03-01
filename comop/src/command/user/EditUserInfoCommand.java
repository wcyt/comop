package command.user;

import bean.UserBean;
import command.AbstractCommand;
import dao.Connector;
import dao.user.UserDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class EditUserInfoCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		// パラメータを取得
		String name = reqc.getParameter("name")[0];
		String mail = reqc.getParameter("mail")[0];
		String firstName = reqc.getParameter("firstName")[0];
		String lastName = reqc.getParameter("lastName")[0];
		String firstNameKana = reqc.getParameter("firstNameKana")[0];
		String lastNameKana = reqc.getParameter("lastNameKana")[0];
		String address = reqc.getParameter("address")[0];
		String postalCode = reqc.getParameter("postalCode")[0];
		String tel = reqc.getParameter("tel")[0];
		String user_id = reqc.getParameter("user_id")[0];

		System.out.println("name" + name);
		System.out.println("mail" + mail);
		System.out.println("firstName" + firstName);
		System.out.println("firstNameKana" + firstNameKana);
		System.out.println("lastName" + lastName);
		System.out.println("lastNameKana" + lastNameKana);
		System.out.println("address" + address);
		System.out.println("postalCode" + postalCode);
		System.out.println("tel" + tel);
		System.out.println("user_id" + user_id);

		UserBean userBean = new UserBean();
		userBean.setName(name);
		userBean.setMail(mail);
		userBean.setAddress(address);
		userBean.setFirst_name(firstName);
		userBean.setLast_name(lastName);
		userBean.setFirst_name_kana(firstNameKana);
		userBean.setLast_name_kana(lastNameKana);
		userBean.setTel(tel);
		userBean.setPostal_code(postalCode);
		userBean.setUser_id(Integer.parseInt(user_id));

		Connector.getInstance().beginTransaction();

		//ユーザー情報の変更
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		UserDAO userDAO = factory.getUserDAO();
		userDAO.editUserInfo(userBean);

		//sessionの更新
		if (reqc.getSessionAttribute("user") != null) {
			//TODO セッションに必要なユーザー情報を持ったBeanInstを登録
			String smail = ((UserBean) reqc.getSessionAttribute("user")).getMail();
			UserBean u = new UserBean();
			u = userDAO.getMyUserInfo(smail);
			reqc.setSessionAttribute("user", u);
		}

		Connector.getInstance().commit();

		reqc.setAttribute("message","ユーザー情報を変更しました");

		//default.jspに移動
		resc.setTarget("default");
		return resc;
	}
}

