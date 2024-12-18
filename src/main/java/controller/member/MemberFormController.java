package controller.member;

import data.dto.MemberDto;
import data.service.MemberService;
import data.service.RegisterMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MemberFormController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private RegisterMail registerMail;

    @GetMapping("/member/form")
    public String form(){
        return "member/form";
    }

    @ResponseBody //json으로 반환
    @GetMapping("/member/idcheck")
    public Map<String , Integer> getIdCheck(
            @RequestParam String searchid

    ){
        Map<String ,Integer> map=new HashMap<>();
        int count = memberService.getIdCheckCount(searchid);
        map.put("count", count);
        return map;

    }

    @PostMapping("/member/insert")
    public String saveData(
            @ModelAttribute MemberDto dto,
            @RequestParam("myfile")MultipartFile myfile,
            HttpServletRequest request
    ){
        System.out.println("dto = " + dto);

        String password = dto.getPasswd();
        // 서블릿 컨텍스트 가져오기
        ServletContext context = request.getServletContext();
        //업로드될 경로
        String savePath=request.getSession().getServletContext().getRealPath("/profile");
        //업로드한 파일의 확장자 분리
        String ext=myfile.getOriginalFilename().split("\\.")[1];
        //업로드할 파일명
        String photoname= UUID.randomUUID()+ext;
        dto.setProf_photo(photoname);

        //실제 업로드
        try {
            myfile.transferTo(new File(savePath+File.separator+photoname));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        //db에 저장
        memberService.insertMember(dto);

        return "redirect:/member/loginform";

    }

    // 이메일 인증
    @PostMapping("login/mailConfirm")
    @ResponseBody
    String mailConfirm(@RequestParam("email") String email) throws Exception {

        String code = registerMail.sendSimpleMessage(email);
        System.out.println("인증코드 : " + code);
        return code;
    }

}
