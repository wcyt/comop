package dao.favorite;

import java.util.List;
import java.util.Map;

import bean.FavoriteBean;

public interface FavoriteDAO {
	public List<FavoriteBean> getFavoriteList(String user_id);
	public void addFavorite(FavoriteBean f);
	public void removeFavorite(String user_id,Map<String,String[]> product_ids);
}


