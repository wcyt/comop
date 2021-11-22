package dao.favorite;

import java.util.List;

import bean.FavoriteBean;

public interface FavoriteDAO {
	public List getFavoriteList(String user_id);
	public void addFavorite(FavoriteBean f);
	public void removeFavorite();//引数保留
}

