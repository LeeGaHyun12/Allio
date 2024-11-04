package controller.board;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.MemberService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MypageController {

    private final MemberService memberService;

    @GetMapping("/board/mypageform")
    public String showMypage(
            Model model,
            HttpSession session,
            @RequestParam(value = "userid", required = false) String userId // userId를 URL 매개변수로 받아옴
    ) {
        // 로그인된 사용자 ID 가져오기
        String loginId = (String) session.getAttribute("loginid");

        // userId가 없으면 로그인한 사용자의 ID로 설정
        if (userId == null) {
            userId = loginId;
        }

        // userId가 없으면 로그인 페이지로 리다이렉트
        if (userId == null) {
            return "redirect:/member/login";
        }

        // userId로 사용자 정보 조회
        MemberDto dto = memberService.getDataById(userId);
        model.addAttribute("dto", dto);

        List<BoardDto> portfolioList = memberService.getBoardByUserId(userId);
        model.addAttribute("portfolioList", portfolioList);

        return "board/mypageform";
    }
}
