import com.yb.yue.ba.admin.entity.Comment;
import com.yb.yue.ba.admin.service.CommentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-context*.xml")
public class CommentServiceImplTest {
    @Autowired
    private CommentService commentService;
    @Test
    public void getAllCommentByFcmId(){
        List<Comment> allCommentByFcmId = commentService.getAllCommentByFcmId(1L);
        System.out.println(allCommentByFcmId);
    }
}
