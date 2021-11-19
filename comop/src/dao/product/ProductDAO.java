
package dao.product;

import java.util.List;
import java.util.Map;

import bean.ProductBean;

public interface ProductDAO {
	 public List getProductsList(Map map);
	 public ProductBean getProductDetail(String product_id);
	 public List searchProducts(String s);

}
