package command.cart;

import java.util.List;

import bean.CartBean;
import command.AbstractCommand;
import dao.cart.CartDAO;
import daofactory.AbstractDaoFactory;
import tera.RequestContext;
import tera.ResponseContext;

public class GetCartListCommand extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

<<<<<<< HEAD
		//パラメータを取得
		String[] user_ids = reqc.getParameter("user_id");
		String user_id = user_ids[0];

		//カートの中身を取得
=======
		String user_id = reqc.getParameter("user_id")[0];

>>>>>>> branch 'main' of git@github.com:wcyt/comop.git
		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
<<<<<<< HEAD
		List carts = cd.getCartList(user_id);

=======
		List<CartBean> carts = cd.getCartList(user_id);
>>>>>>> branch 'main' of git@github.com:wcyt/comop.git

		resc.setResult(carts);

		//cart.jspに移動
		resc.setTarget("cart");

		return resc;
	}
}