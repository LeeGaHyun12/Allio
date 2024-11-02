package controller.board;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.BoardService;
import data.service.MemberService;
import lombok.NonNull;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Handler;

@Controller
public class BoardListController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;
    @Qualifier("localeResolver")
    @Autowired
    private LocaleResolver localeResolver;
    @Qualifier("messageSource")
    @Autowired
    private MessageSource messageSource;

    @GetMapping("board/boardlist")
    public String boardList(Model model) {

        List<BoardDto> boardList = boardService.getAllPortfolios();
        model.addAttribute("boardList", boardList);

        return "board/boardlist";
    }


    @GetMapping("/changeLanguage")
    @ResponseBody
    public Map<String, String> changeLanguage(@RequestParam(value = "locale", defaultValue = "en") String locale, HttpServletRequest request) {
        System.out.println("Request received with parameter locale: " + locale);
        System.out.println("Query String: " + request.getQueryString());  // Query String 확인
        System.out.println("Request URL: " + request.getRequestURL());     // Request URL 확인

        // locale 설정
        localeResolver.setLocale(request, null, new Locale(locale));

        Map<String, String> response = new HashMap<>();
        response.put("explore", getMessage("explore", locale));
        return response;
    }


    private String getMessage(String key, String locale) {
        return messageSource.getMessage(key, null, new Locale(locale));
    }
}