package data.mapper;

import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapperInter {
    @Select("select count(*) from allio_user")
    public int getTotalCount();

    @Select("select count(*) from allio_user where userId=#{port_Id}")
    public int getIdCheckCount(String port_Id);

    @Insert("""
			insert into allio_user (userId,name,passwd,prof_photo,email,category) values (#{userId},#{name},#{passwd},#{prof_photo},
			#{email},#{category})
			""")
    public void insertMember(MemberDto dto);

    @Select("select * from allio_user order by num desc")
    public List<MemberDto> getAllMembers();

    @Select("SELECT * FROM allio_user WHERE userId=#{userId}")
    MemberDto findMember(String userId);

    @Select("select * from allio_user where num=#{num}")
    public MemberDto getData(int num);

    @Select("select * from allio_user where userId=#{userId}")
    public MemberDto getDataById(String userId);

    @Select("select count(*) from allio_user where num=#{num} and passwd=#{passwd}")
    public int isEqualPassCheck(Map<String, Object> map);

    @Select("""
			select count(*) from allio_user where userId=#{userId} and passwd=#{passwd}
			""")
    public int isLoginCheck( String userId, String passwd);

    @Select("select prof_photo from allio_user where userId=#{port_Id}")
    public MemberDto getProfPhoto(String port_Id);

    @Select("select prof_photo from allio_user where userId=(select userId from allio_board where num=#{num})")
    public String getProf(int num);


}