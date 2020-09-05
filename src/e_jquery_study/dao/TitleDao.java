package e_jquery_study.dao;

import java.util.List;

import e_jquery_study.dto.Title;

public interface TitleDao {
	Title selectTitleByNo(Title title);
	List<Title> selectTitleByAll();
	
	int insertTitle(Title title);
	int updateTitle(Title title);
	int deleteTitle(Title title);
	
	int getNextNo();
}