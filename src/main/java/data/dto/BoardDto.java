package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;

@NoArgsConstructor
@Data
@Alias("BoardDto")
@Builder
@AllArgsConstructor
public class BoardDto {
    private int num;
    private String port_Id;
    private String subject;
    private String userId;
    private Timestamp date;
    private String port_photo;
    private String content;
    private int count;
    private int like_count;
    private String category;

}
