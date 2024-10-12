package data.service;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.mapper.BoardMapperInter;
import data.mapper.MemberMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberService {
    @Autowired
    private MemberMapperInter memInter;

    @Autowired
    private BoardMapperInter borInter;

    public int getTotalCount(){
        return memInter.getTotalCount();
    }

    public int getIdCheckCount(String port_Id){
        return memInter.getIdCheckCount(port_Id);
    }

    public void insertMember(MemberDto dto){
        memInter.insertMember(dto);
    }


    public List<MemberDto> getAllMembers(){
        return memInter.getAllMembers();
    }

    public MemberDto getData(int num)
    {
        return memInter.getData(num);
    }
    public MemberDto getDataById(String userId)
    {
        return memInter.getDataById(userId);
    }

    public boolean isEqualPassCheck(int num,String passwd)
    {
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("num", num);
        map.put("passwd", passwd);
        int n=memInter.isEqualPassCheck(map);
        return n==1?true:false;
    }

    public boolean isLoginCheck(String userId,String passwd)
    {
        return memInter.isLoginCheck(userId, passwd)==1?true:false;
    }


    public MemberDto getProfPhoto(String port_Id){
        return memInter.getProfPhoto(port_Id);
    }

    public String getProf(int num){
        return memInter.getProf(num);
    }

//    public String getUserData(int num) { return memInter.getUserDatauser(num);
//    }

    public List<BoardDto> getBoardByUserId(String userId)
    {
        return borInter.getBoardByUserId(userId);
    }

}

