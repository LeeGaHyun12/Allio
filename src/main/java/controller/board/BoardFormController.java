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
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class BoardFormController {
    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;
    //게시물 작성
    @GetMapping("/board/writeform")
    public String form() {
        return "board/writeform";
    }


    @PostMapping("/board/upload")
    public String writeform(
            @RequestParam("subject") String subject,
            @RequestParam("content") String content,
            @RequestParam("upload")MultipartFile upload,
            @RequestParam("category") String category,
            HttpServletRequest request,
            HttpSession session
    ) {
        //업로드될 경로
        String savePath = request.getSession().getServletContext().getRealPath("/photo");
        //업로드한 파일의 확장자 분리
        String ext = upload.getOriginalFilename().split("\\.")[1];
        //업로드할 파일명
        String photoname = UUID.randomUUID() + "."+ext;



        try {
                upload.transferTo(new File(savePath+"/"+photoname));
            } catch (IllegalStateException|IOException e) {
                e.printStackTrace();
            }


        BoardDto dto = BoardDto.builder()
                .subject(subject)
                .port_photo(photoname)
                .content(content)
                .category(category)
                .build();



        //실제 업로드

        //세션으로부터 아이디 얻기
        String loginid=(String) session.getAttribute("loginid");
        dto.setUserId(loginid);
        dto.setPort_Id(loginid);

        //확인할 거... 추가후 저장된 시퀀스 값
        System.out.println("num="+dto.getNum());

        //db에 저장
        boardService.insertBoard(dto);

        return "redirect:/";

    }
}
