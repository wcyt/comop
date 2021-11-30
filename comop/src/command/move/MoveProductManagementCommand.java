package command.move;

import command.AbstractCommand;
import command.admin.GetProductsListCommand;
import tera.ResponseContext;

public class MoveProductManagementCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		// 商品一覧の取得
		GetProductsListCommand getProductsListCommand = new GetProductsListCommand();
		getProductsListCommand.execute(resc);

		// productManagement.jspに移動
		resc.setTarget("productManagement");
		return resc;
	}
}
