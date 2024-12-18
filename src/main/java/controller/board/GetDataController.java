package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class GetDataController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/getData")
    public BoardDto getData(@RequestParam(value = "num",defaultValue = "0") int num) {
        System.out.println("num이 "+num);
        if (num <= 0) {
            throw new IllegalArgumentException("Invalid num parameter"); // 잘못된 파라미터 처리
        }
        // num에 해당하는 데이터를 조회하여 반환
        return boardService.getBoardByNum(num);
    }

    @GetMapping("/likePost")
    public String likePost(@RequestParam("num") String num) {
        System.out.println("num");
        System.out.println(num);
        try {
            boardService.increaseLikeCount(Integer.parseInt(num));
            return "{\"success\": true}";
        } catch (Exception e) {
            return "{\"success\": false}";
        }
    }

    @PostMapping("/increaseCount")
    public String updateReadcount(@RequestParam("num") int num) {
        try {
            boardService.updateReadcount(num);
            return "{\"success\": true}";
        } catch (Exception e) {
            return "{\"success\": false}";
        }
    }

//    @ResponseBody
//    @GetMapping("/getUserData")
//    public Map<String, String> getUserData(@RequestParam("num") int num){
//        System.out.println(num);
//        String user=memberService.getUserData(num);
//        Map<String, String> map=new HashMap<>();
//
//        map.put("userId",user);
//
//        return map;
//    }

}
