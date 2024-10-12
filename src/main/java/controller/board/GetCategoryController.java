package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class GetCategoryController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/getDataByCategory")
    public List<BoardDto> getDataByCategory(@RequestParam("category") String category) {
        // 해당 카테고리에 속하는 데이터를 조회하여 반환
        return boardService.getBoardByCategory(category);
    }
}
