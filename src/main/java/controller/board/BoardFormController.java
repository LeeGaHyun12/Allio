package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import data.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BoardFormController {

    private final BoardService boardService;
    private final MemberService memberService;

    // 게시물 작성 폼 페이지 요청
    @GetMapping("/board/writeform")
    public String form() {
        return "board/writeform";
    }


    // 게시물 업로드 및 데이터 처리
    @PostMapping("/board/upload")
    public String writeForm(
            @RequestParam("subject") String subject,
            @RequestParam("content") String content,
            @RequestParam("upload") MultipartFile[] uploads,
            @RequestParam("category") String category,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            HttpSession session,
            Model model
    ) {
        String loginId = (String) session.getAttribute("loginid");
        List<String> photoUrls = new ArrayList<>();

        // 로그인 체크
        if (loginId == null) {
            model.addAttribute("errorMessage", "로그인 후 게시물을 작성할 수 있습니다.");
            return "redirect:/member/loginform";
        }

        for (MultipartFile upload : uploads) {
            if (!upload.isEmpty()) {
                try {
                    // NCP 스토리지에 파일 업로드 후 URL 반환
                    String photoUrl = boardService.uploadFileToNcp(upload);
                    photoUrls.add(photoUrl);
                } catch (IOException e) {
                    model.addAttribute("errorMessage", "파일 업로드 중 오류가 발생했습니다.");
                    e.printStackTrace();
                    return "board/writeform";  // 오류 발생 시 다시 폼으로 돌아가기
                }
            }
        }

        BoardDto dto = BoardDto.builder()
                .subject(subject)
                .port_photo(String.join(",", photoUrls))
                .content(content)
                .category(category)
                .userId(loginId)
                .port_Id(loginId)
                .startDate(LocalDate.parse(startDate))
                .endDate(LocalDate.parse(endDate))
                .build();

        boardService.insertBoard(dto);
        return "redirect:/";
    }

}
