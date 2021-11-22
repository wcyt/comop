
package dao.product;

import java.util.List;
import java.util.Map;

public interface ProductDAO {
	 public List getProductsList(Map parameters);
	 public List getProductDetail(String product_id);
	 public List searchProducts(String key);

}
