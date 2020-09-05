package e_jquery_study.service;

import java.util.List;

import e_jquery_study.dao.TitleDao;
import e_jquery_study.dao.impl.TitleDaoImpl;
import e_jquery_study.dto.Title;

public class TitleService {
    private TitleDao dao = TitleDaoImpl.getInstance();


    public List<Title> getTitleList() {
        return dao.selectTitleByAll();
    }

    public int getNextTitleNo() {
        return dao.getNextNo();
    }
    
    public int addTitle(Title title) {
        return dao.insertTitle(title);
    }
}
