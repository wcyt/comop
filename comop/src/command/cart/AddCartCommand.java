package command.cart;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import command.AbstractCommand;
import daofactory.AbstractDaoFactory;
import dao.cart.CartDAO;
import tera.RequestContext;
import tera.ResponseContext;

class AddCartCommand  extends AbstractCommand {

	public ResponseContext execute(ResponseContext resc) {

		RequestContext reqc = getRequestContext();

		String[] uids = reqc.getParameter("uid");
		String[] pids = reqc.getParameter("pid");


		String uid = uids[0];
		String pid = pids[0];


		Product p = new Product();
		p.setUid(uid);
		p.setPid(pid);


		AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
		CartDAO cd = factory.getCartDAO();
		cd.addCart(p);

		resc.setTarget("cart");


		return resc;
	}
}
