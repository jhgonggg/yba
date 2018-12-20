import com.yb.yue.ba.admin.entity.FriendCircleMessage;
import com.yb.yue.ba.admin.mapper.FriendCircleMessageMapper;
import com.yb.yue.ba.admin.mapper.TimeLineMapper;
import com.yb.yue.ba.admin.service.FriendCircleMessageService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class FriendCircleMessageServiceImplTest {
    @Autowired
    private FriendCircleMessageService friendCircleMessageService;

    @Autowired
    private FriendCircleMessageMapper friendCircleMessageMapper;

    @Autowired
    private TimeLineMapper timeLineMapper;
    @Test
    public void getFriendMessage(){
        List<FriendCircleMessage> friendCircleMessages = friendCircleMessageService.getFriendMessageByUid(3L);
        System.out.println(friendCircleMessages);
    }
    @Test
    public void insertMessage(){
        FriendCircleMessage friendCircleMessage=new FriendCircleMessage();
        friendCircleMessage.setContent("3333");
        friendCircleMessage.setImage("1.png");
        friendCircleMessage.setUid(9L);
        friendCircleMessage.setCreated(new Date());
        System.out.println(friendCircleMessage.getId());
        friendCircleMessageMapper.insert(friendCircleMessage);
        System.out.println(friendCircleMessage.getId());
    }

    @Test
    public void sendMessage(){
        FriendCircleMessage friendCircleMessage=new FriendCircleMessage();
        friendCircleMessage.setContent("今天是美好的一天");
        friendCircleMessage.setPicture("1.png");
        friendCircleMessage.setUid(2L);
        friendCircleMessage.setCreated(new Date());
        friendCircleMessageService.sendFriendMessage(friendCircleMessage);
    }
    @Test
    public void delete(){
        friendCircleMessageService.delete(8L);
    }
    @Test
    public void getOwnMessageByUid(){
        List<FriendCircleMessage> ownMessage = friendCircleMessageMapper.getOwnMessageByUid(2L);
        System.out.println(ownMessage);
    }
}
