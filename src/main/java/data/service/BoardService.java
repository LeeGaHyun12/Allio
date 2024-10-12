package data.service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardMapperInter svInter;

    public List<BoardDto> searchKeyword(String keyword){
        return svInter.findKeyword(keyword);
    }


    public void insertBoard(BoardDto dto){

        svInter.insertBoard(dto);

    }


    public List<BoardDto> getAllPortfolios() {
        return svInter.getAllPortfolios();
    }

    public BoardDto getBoardByNum(int num) {
        return svInter.getBoardByNum(num);
    }


    public List<BoardDto> getBoardByCategory(String category) {
        return svInter.getBoardByCategory(category);
    }


    public void increaseLikeCount(int num) {
        svInter.updateLikeCount(num);
    }

    public void updateReadcount(int num){
        svInter.updateReadcount(num);
    }

    // 추가: userId를 사용하여 BoardDto 리스트를 가져오는 메서드
    public List<BoardDto> getBoardByUserId(String userId) {
        return svInter.getBoardByUserId(userId);
    }



}
