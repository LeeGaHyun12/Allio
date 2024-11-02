package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@Controller
public class BoardFormController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

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
            @RequestParam("upload") MultipartFile upload,
            @RequestParam("category") String category,
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate,
            HttpServletRequest request,
            HttpSession session
    ) {
        // 업로드 경로 설정
        String savePath = request.getSession().getServletContext().getRealPath("/photo");
        String photoname = null;

        if (!upload.isEmpty()) {
            String ext = upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf(".") + 1);
            photoname = UUID.randomUUID() + "." + ext;
            try {
                upload.transferTo(new File(savePath + "/" + photoname));
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }

        String loginId = (String) session.getAttribute("loginid");

        BoardDto dto = BoardDto.builder()
                .subject(subject)
                .port_photo(photoname)
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
