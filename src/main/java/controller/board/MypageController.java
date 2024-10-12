package controller.board;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.MemberService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MypageController {

    private final MemberService memberService;

    @GetMapping("/board/mypageform")
    public String showMypage(Model model, HttpSession session) {
        String loginId = (String) session.getAttribute("loginid");
        if (loginId != null) {
            MemberDto dto = memberService.getDataById(loginId);
            model.addAttribute("dto", dto);

            List<BoardDto> portfolioList = memberService.getBoardByUserId(loginId);
            model.addAttribute("portfolioList", portfolioList);

            return "board/mypageform";
        } else {
            return "redirect:/member/login";
        }
    }
}
