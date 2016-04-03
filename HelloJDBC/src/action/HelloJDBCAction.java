package action;
import dao.dao;

import java.util.List;
import model.language;
/**
 * Created by Administrator on 2016/4/2.
 */
public class HelloJDBCAction {
    public static void main(String [] args) throws Exception{
        dao d = new dao();
        List<language> list = d.find();

        for(language l:list){
            System.out.println(l.getId()+" "+l.getName());
        }

    }
}
