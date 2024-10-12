package controller.board;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.BoardService;
import data.service.MemberService;
import lombok.NonNull;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Handler;

@Controller
public class BoardListController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;
    @GetMapping("board/boardlist")
    public String boardList(Model model) {

        List<BoardDto> boardList = boardService.getAllPortfolios();
        model.addAttribute("boardList", boardList);

        return "board/boardlist";
    }



}
