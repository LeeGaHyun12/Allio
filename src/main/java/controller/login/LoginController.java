package controller.login;

import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private MemberService memberService;

    @ResponseBody //json으로 반환한다
    @GetMapping("/member/login")
    public Map<String,String> isLogin(
            @RequestParam(defaultValue = "no") String saveid, //Null이 넘어올경우 디폴트값이 적용된다
            @RequestParam String userId,
            @RequestParam String passwd,
            HttpSession session

    ){
        System.out.println("saveid="+saveid);
        Map<String,String> map=new HashMap<>();
        //로그인 상태
        boolean loginStatus=memberService.isLoginCheck(userId,passwd);

        if(loginStatus){
            //아이디와 비번이 맞은 경우
            map.put("status","success");
            //로그인 성공시 세션에 저장
            session.setAttribute("saveid",saveid.equals("no")?"no":"yes");
            session.setAttribute("loginok","yes");
            session.setAttribute("loginid",userId);

        }else{
            //아이디와 비번이 틀린 경우
            map.put("status","fail");
        }
        return map;
    }

    @GetMapping("/member/loginform")
    public String loginform(){return "member/loginform";
    }



    //로그아웃시 호출
    @ResponseBody
    @GetMapping("/member/logout")
    public void memberLogout(HttpSession session){
        session.removeAttribute("loginok");
    }

}
