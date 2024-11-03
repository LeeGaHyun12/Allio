package data.mapper;

import data.dto.BoardDto;
import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardMapperInter {
	@Insert("""
    	insert into allio_board (subject, userId, port_Id, port_photo, content, count, like_count, category, date, startDate, endDate)
    	values (#{subject}, #{userId}, #{port_Id}, #{port_photo}, #{content}, #{count}, #{like_count}, #{category}, now(), #{startDate}, #{endDate})
		""")
	void insertBoard(BoardDto dto);

	@Select("select * from allio_board order by like_count ")
	List<BoardDto> getAllPortfolios();

	@Select("select * from allio_board where num = #{num}")
	BoardDto getBoardByNum(int num);


	@Select("select * from allio_board where category = #{category}")
	List<BoardDto> getBoardByCategory(String category);

	@Select("select * from allio_board where category = #{keyword} OR subject LIKE CONCAT('%', #{keyword}, '%') OR category LIKE CONCAT('%', #{keyword}, '%')")
	List<BoardDto> findKeyword(@Param("keyword") String keyword);

	@Update("UPDATE allio_board SET like_count = like_count + 1 WHERE num = #{num}")
	public void updateLikeCount(@Param("num") int num);

	@Update("update allio_board set count=count+1 where num=#{num}")
	public void updateReadcount(@Param("num") int num);

	@Select("select * from allio_user where num")
	MemberDto getUserData(@Param("num") int num);

	@Select("SELECT * FROM allio_user WHERE userId = #{userId}")
	List<BoardDto> getBoardByUserId(String userId);





}