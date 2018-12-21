import com.yb.yue.ba.admin.entity.User;
import com.yb.yue.ba.admin.service.UserGoodFriendService;
import com.yb.yue.ba.admin.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class UserServiceImplTest {
    @Autowired
    private UserService userService;
    @Test
    //添加好友
    public void getFriends(){

        List<User> friends = userService.getFriends(3L);
        for (User user : friends) {
            System.out.println(user);
        }


    }
}
