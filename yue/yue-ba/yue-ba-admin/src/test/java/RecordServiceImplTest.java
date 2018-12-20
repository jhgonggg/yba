import com.yb.yue.ba.admin.entity.Record;
import com.yb.yue.ba.admin.service.RecordService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class RecordServiceImplTest {

    @Autowired
    private RecordService recordService;

    @Test
    public void getRecord(){
        Record rec = new Record();
        rec.setSenderId(2L);
        rec.setReceiverId(3L);

        List<Record> recordList = recordService.getRecordList(rec);
        for (Record record : recordList) {
            System.out.println(record);
        }

    }

    @Test
    public void saveRecord(){
        Record record = new Record();
        record.setMessage("gg");
        record.setSenderId(6L);
        record.setReceiverId(7L);
        recordService.save(record);



    }
}
