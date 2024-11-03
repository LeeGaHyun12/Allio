package controller.login;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import data.dto.KakaoProfile;
import data.dto.MemberDto;
import data.dto.OAuthToken;
import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpHeaders;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class LoginController {

    @Value("${cos.key}")
    private String cosKey;

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

            String userName = memberService.getUserName(userId);
            session.setAttribute("userName", userName);
        }else{
            //아이디와 비번이 틀린 경우
            map.put("status","fail");
        }
        return map;
    }

    @GetMapping("/member/loginform")
    public String loginform(){return "member/loginform";
    }

    @GetMapping("/auto/kakao/callback")
    public String kakaocallback(String code, HttpSession session) throws JsonProcessingException {

        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpBody 오브젝트 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "014c858037f00f7a1f3d02e1b378ff3b");
        params.add("redirect_uri", "http://localhost:9000/auto/kakao/callback");
        params.add("code", code);

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);

        //Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        ObjectMapper objectMapper = new ObjectMapper();

        OAuthToken oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);

        System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());

        //POST 방식으로 key=value 데이터를 요청(카카오쪽으로)
        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
                new HttpEntity<>(headers2);

        //Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
        ResponseEntity<String> response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest2,
                String.class
        );

        System.out.println(response2.getBody());
        ObjectMapper objectMapper2 = new ObjectMapper();

        KakaoProfile kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);

        String kakaoUserId = String.valueOf(kakaoProfile.getId());
        //Member 오브젝트: userId, name, passwd, email
        System.out.println("카카오 아이디(번호):" +kakaoProfile.getId());
        System.out.println("카카오 이메일:" +kakaoProfile.getKakao_account().getEmail());

        System.out.println("카카오 유저네임: " + kakaoProfile.getProperties().getNickname());
        System.out.println("카카오 이메일: "+kakaoProfile.getKakao_account().getEmail());
        System.out.println("카카오 패스워드: "+cosKey);

        MemberDto kakaoDto = MemberDto.builder()
                .userId(String.valueOf(kakaoProfile.getId()))
                .name(kakaoProfile.getProperties().getNickname())
                .passwd(String.valueOf(cosKey))
                .email(kakaoProfile.getKakao_account().getEmail())
                .category("상관없음")
                .build();



        //가입자 혹은 비가입자 체크해서 처리
        MemberDto originMemberDto = memberService.findMember(kakaoUserId);

        if(originMemberDto == null){
            System.out.println("기존 회원이 아니기에 자동 회원가입을 진행합니다.");
            memberService.insertMember(kakaoDto);
        }else {
            System.out.println("기존 회원입니다. 로그인 처리합니다.");
            // 기존 회원일 경우 사용자 정보를 kakaoDto에 재할당합니다.
            kakaoDto = originMemberDto;
        }


        //로그인 처리
        session.setAttribute("loginok", "yes");
        session.setAttribute("loginid", kakaoDto.getUserId());
        session.setAttribute("saveid", "yes"); // 자동 로그인 유지 여부 설정

        System.out.println("자동 로그인을 진행합니다.");
        return "redirect:/";
    }

    //로그아웃시 호출
    @ResponseBody
    @GetMapping("/member/logout")
    public void memberLogout(HttpSession session){
        session.removeAttribute("loginok");
    }

}