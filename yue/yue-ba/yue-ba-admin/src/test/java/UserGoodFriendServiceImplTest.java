import com.yb.yue.ba.admin.service.UserGoodFriendService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class UserGoodFriendServiceImplTest {
    @Autowired
    private UserGoodFriendService userGoodFriendService;
    @Test
    //添加好友
    public void addFriend(){
        userGoodFriendService.save(5L,3L);
    }
}
