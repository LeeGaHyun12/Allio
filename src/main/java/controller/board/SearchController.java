package controller.board;


import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    @Autowired
    private BoardService boardService;

    @GetMapping("board/search")
    public String searchlist(@RequestParam("keyword") String keyword, Model model){
        List<BoardDto> boardList = boardService.searchKeyword(keyword);

        // 모델에 검색 결과를 추가합니다.
        model.addAttribute("boardList", boardList);
        model.addAttribute("searchKeyword", keyword);

        return "board/searchlist";
    }
    @GetMapping("/search")
    @ResponseBody
    public Map<String,String> search(@RequestParam("keyword") String keyword) {

        Map<String,String> map = new HashMap<>();
        map.put("keyword",keyword);
        return map;
    }
}
