package controller.member;

import data.dto.MemberDto;
import data.service.MemberService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MemberListController {

    @NonNull
    private MemberService memberService;

    @GetMapping("/member/list")
    public String memberList(Model model)
    {
        List<MemberDto> list=memberService.getAllMembers();

        model.addAttribute("list",list);

        return "list";
    }

    @ResponseBody
    @GetMapping("/profile")
    public Map<String, String> getProf(@RequestParam("num") int num){
        System.out.println(num);
        String prof=memberService.getProf(num);
        Map<String, String> map=new HashMap<>();

        map.put("prof_photo",prof);

        return map;
    }



}