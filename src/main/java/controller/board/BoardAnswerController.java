package controller.board;

import data.dto.BoardAnswerDto;
import data.service.BoardAnswerService;
import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController //백프로 ajax 로 할 거라서...
@RequestMapping("/board")
public class BoardAnswerController {
    @Autowired
    private BoardAnswerService answerService;
    @Autowired
    private MemberService memberService;

    @PostMapping("/ainsert")
    public ResponseEntity<Void> insertAnswer(
            @RequestParam int num,
            @RequestParam String content,
            HttpSession session
    ){
        System.out.println("num = " + num);
        System.out.println("content = " + content);

        //로그인한 아이디 얻기
        String myid=(String)session.getAttribute("loginid");
        System.out.println("myid = " + myid);
        //아이디에 해당하는 이름 얻기
        String writer=memberService.getDataById(myid).getName();
        //dto에 필요한 데이터 넣기
        BoardAnswerDto dto=BoardAnswerDto.builder()
                .myid(myid)
                .writer(writer)
                .content(content)
                .num(num).build();
        //db insert
        System.out.println("dto = " + dto);
        answerService.insertAnswer(dto);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/alist")
    public List<BoardAnswerDto> alist(@RequestParam int num) {
        System.out.println("nddssadad");
        System.out.println("num = " + num);
        System.out.println(answerService.getAnswerData(num));
        return answerService.getAnswerData(num);
    }

    @GetMapping("/adelete")
    public void deleteAnswer(@RequestParam int aidx){
        answerService.deleteAnswer(aidx);
    }

}
