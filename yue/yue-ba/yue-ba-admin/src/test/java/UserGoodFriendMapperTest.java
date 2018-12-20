import com.yb.yue.ba.admin.mapper.UserGoodFriendMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class UserGoodFriendMapperTest {
    @Autowired
    private UserGoodFriendMapper goodFriendMapper;

    @Test
    public void getAllFriends(){
        List<Long> friends = goodFriendMapper.getAllFriends(2L);
        System.out.println(friends);
    }
}
