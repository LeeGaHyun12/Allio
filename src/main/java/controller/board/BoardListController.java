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
import org.springframework.web.bind.annotation.CrossOrigin;
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

@CrossOrigin(origins = "*")
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

    @GetMapping("/Allio/board/boardlist")
    public String boardList(Model model) {

        List<BoardDto> boardList = boardService.getAllPortfolios();
        System.out.println(boardList);
        model.addAttribute("boardList", boardList);

        return "Allio/board/boardlist";
    }


    @GetMapping("/changeLanguage")
    @ResponseBody
    public Map<String, String> changeLanguage(@RequestParam(value = "locale", defaultValue = "en") String locale, HttpServletRequest request) {
        System.out.println("Request received with parameter locale: " + locale);
        System.out.println("Query String: " + request.getQueryString());  // Query String 확인
        System.out.println("Request URL: " + request.getRequestURL());     // Request URL 확인

        // locale 설정
        localeResolver.setLocale(request, null, new Locale(locale));

        // 세션에 언어 정보 저장
        request.getSession().setAttribute("userLocale", locale);

        Map<String, String> response = new HashMap<>();
        response.put("explore", getMessage("explore", locale));
        response.put("graphic_design", getMessage("graphic_design", locale));
        response.put("video_motion_graphics", getMessage("video_motion_graphics", locale));
        response.put("character_design", getMessage("character_design", locale));
        response.put("digital_art", getMessage("digital_art", locale));
        response.put("illustration", getMessage("illustration", locale));
        response.put("fine_art", getMessage("fine_art", locale));
        response.put("branding_editing", getMessage("branding_editing", locale));
        response.put("ui_ux", getMessage("ui_ux", locale));
        response.put("product_package_design", getMessage("product_package_design", locale));
        response.put("typography", getMessage("typography", locale));
        response.put("photography", getMessage("photography", locale));
        response.put("craft", getMessage("craft", locale));
        response.put("login", getMessage("login", locale));
        response.put("sign_up", getMessage("sign_up", locale));
        response.put("logout", getMessage("logout", locale));

        response.put("banner2_text", getMessage("banner2_text", locale));
        response.put("banner2_subtext", getMessage("banner2_subtext", locale));
        response.put("banner3_text", getMessage("banner3_text", locale));
        response.put("banner3_subtext", getMessage("banner3_subtext", locale));
        response.put("banner4_text", getMessage("banner4_text", locale));
        response.put("banner4_subtext", getMessage("banner4_subtext", locale));
        response.put("banner5_text", getMessage("banner5_text", locale));
        response.put("banner5_subtext", getMessage("banner5_subtext", locale));

        response.put("create_portfolio_text", getMessage("create_portfolio_text", locale));
        response.put("portfolio_and_designs", getMessage("portfolio_and_designs", locale));
        response.put("get_started_button", getMessage("get_started_button", locale));

        response.put("page_title", getMessage("page_title", locale));
        response.put("follow_chat", getMessage("follow_chat", locale));
        response.put("follow_button", getMessage("follow_button", locale));
        response.put("suggest_button", getMessage("suggest_button", locale));
        response.put("website", getMessage("website", locale));
        response.put("work_likes_collections", getMessage("work_likes_collections", locale));
        response.put("work_list", getMessage("work_list", locale));

        response.put("no_results_found", getMessage("no_results_found", locale));

        response.put("post_creation_title", getMessage("post_creation_title", locale));
        response.put("post_creation_legend", getMessage("post_creation_legend", locale));
        response.put("title_label", getMessage("title_label", locale));
        response.put("title_placeholder", getMessage("title_placeholder", locale));
        response.put("file_upload_label", getMessage("file_upload_label", locale));
        response.put("category_label", getMessage("category_label", locale));
        response.put("duration_label", getMessage("duration_label", locale));
        response.put("start_date_label", getMessage("start_date_label", locale));
        response.put("end_date_label", getMessage("end_date_label", locale));
        response.put("content_label", getMessage("content_label", locale));
        response.put("content_placeholder", getMessage("content_placeholder", locale));
        response.put("submit_button", getMessage("submit_button", locale));
        response.put("image_file_only", getMessage("image_file_only", locale));
        response.put("image_description_placeholder", getMessage("image_description_placeholder", locale));

        response.put("category_humanities", getMessage("category_humanities", locale));
        response.put("category_health", getMessage("category_health", locale));
        response.put("category_engineering", getMessage("category_engineering", locale));
        response.put("category_natural_science", getMessage("category_natural_science", locale));
        response.put("category_art_design", getMessage("category_art_design", locale));
        response.put("category_sports", getMessage("category_sports", locale));
        response.put("category_music", getMessage("category_music", locale));
        response.put("category_information_technology", getMessage("category_information_technology", locale));
        response.put("category_business_economics", getMessage("category_business_economics", locale));
        response.put("category_law", getMessage("category_law", locale));

        response.put("sign_up_title", getMessage("sign_up_title", locale));
        response.put("sign_up_header", getMessage("sign_up_header", locale));
        response.put("name_label", getMessage("name_label", locale));
        response.put("id_label", getMessage("id_label", locale));
        response.put("check_id_btn", getMessage("check_id_btn", locale));
        response.put("available_id", getMessage("available_id", locale));
        response.put("taken_id", getMessage("taken_id", locale));
        response.put("please_enter_id", getMessage("please_enter_id", locale));
        response.put("email_label", getMessage("email_label", locale));
        response.put("send_email_btn", getMessage("send_email_btn", locale));
        response.put("please_enter_email", getMessage("please_enter_email", locale));
        response.put("verification_code_label", getMessage("verification_code_label", locale));
        response.put("check_code_btn", getMessage("check_code_btn", locale));
        response.put("please_enter_code", getMessage("please_enter_code", locale));
        response.put("verification_success", getMessage("verification_success", locale));
        response.put("code_mismatch", getMessage("code_mismatch", locale));
        response.put("category_label2", getMessage("category_label", locale));
        response.put("select_category", getMessage("select_category", locale));
        response.put("subcategory_label", getMessage("subcategory_label", locale));
        response.put("password_label", getMessage("password_label", locale));
        response.put("confirm_password_label", getMessage("confirm_password_label", locale));
        response.put("profile_image_label", getMessage("profile_image_label", locale));
        response.put("sign_up_btn", getMessage("sign_up_btn", locale));
        response.put("email_sent", getMessage("email_sent", locale));
        response.put("email_failed", getMessage("email_failed", locale));
        response.put("check_id", getMessage("check_id", locale));

        response.put("page.title", getMessage("page.title", locale));
        response.put("login.title", getMessage("login.title", locale));
        response.put("login.username", getMessage("login.username", locale));
        response.put("login.password", getMessage("login.password", locale));
        response.put("login.saveId", getMessage("login.saveId", locale));
        response.put("login.button", getMessage("login.button", locale));
        response.put("login.error", getMessage("login.error", locale));


        return response;
    }


    private String getMessage(String key, String locale) {
        return messageSource.getMessage(key, null, new Locale(locale));
    }
}