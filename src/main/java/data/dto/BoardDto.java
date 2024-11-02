package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Alias("BoardDto")
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
    private LocalDate startDate; // 작업 시작일
    private LocalDate endDate;   // 작업 종료일
}
