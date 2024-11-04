package data.service;

import controller.ncp.NcpObjectStorageService;
import data.dto.BoardDto;
import data.mapper.BoardMapperInter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    @Autowired
    private BoardMapperInter svInter;

    @Autowired
    private NcpObjectStorageService storageService;

    public List<BoardDto> searchKeyword(String keyword){
        return svInter.findKeyword(keyword);
    }


    public void insertBoard(BoardDto dto){

        svInter.insertBoard(dto);

    }


    public List<BoardDto> getAllPortfolios() {
        System.out.println(svInter.getAllPortfolios());
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

//    // NCP 스토리지에 파일 업로드 후 파일 URL 반환
//    public String uploadFileToNcp(MultipartFile file) throws IOException {
//        return NcpObjectStorageService.uploadFile(file);
//    }
 // NCP 스토리지에 파일 업로드 후 파일 URL 반환
    public String uploadFileToNcp(MultipartFile file) throws IOException {
        return storageService.uploadFile("allio", "portfolio", file);
    }


}
