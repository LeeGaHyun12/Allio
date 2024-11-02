package controller.common;

import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@RestController
@RequiredArgsConstructor
@CrossOrigin("*")
public class MessageController {

    private final MessageSource messageSource;

    @GetMapping("/welcome")
    public ResponseEntity<Object> welcome(@RequestParam String name, @RequestHeader(value = "Accept-Language", defaultValue = "ko") String language) {
        Locale locale = Locale.forLanguageTag(language);
        System.out.println("Current locale: " + locale);
        return ResponseEntity.ok(
                messageSource.getMessage(
                        "welcome",
                        new String[]{name},
                        locale
                )
        );
    }
}