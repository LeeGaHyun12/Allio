package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@NoArgsConstructor
@Data
@Alias("MemberDto")
@Builder //AllArgs 하면 전체를 다 줘야하는데, builder는 간단하게 필요한 것만 setter 정의가 가능하다
@AllArgsConstructor
public class MemberDto {
    private int num;
    private String userId;
    private String name;
    private String passwd;
    private String prof_photo;
    private String email;
    private String category;
}
