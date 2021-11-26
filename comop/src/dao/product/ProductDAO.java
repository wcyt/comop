
package dao.product;

import java.util.List;
import java.util.Map;

import bean.ProductBean;

public interface ProductDAO {
	 public List<ProductBean> getProductsList(Map<String,String[]> parameters);
	 public List<ProductBean> getProductDetail(String product_id);
	 public List<ProductBean> searchProducts(String key);
	 public int getStock_quantity(String product_id);

}
