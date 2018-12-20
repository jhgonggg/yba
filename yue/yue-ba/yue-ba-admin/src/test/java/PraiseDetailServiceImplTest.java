import com.yb.yue.ba.admin.service.PraiseDetailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class PraiseDetailServiceImplTest {
    @Autowired
    private PraiseDetailService praiseDetailService;

    @Test
    public void ClickPraise(){
        praiseDetailService.ClickPraise(2L,1L);
    }
}
