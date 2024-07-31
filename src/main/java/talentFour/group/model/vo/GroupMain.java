package talentFour.group.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import talentFour.member.model.vo.Member;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class GroupMain {

	private int boardNo;
	private String boardTitle;
	private String studyStatus;
	private String startDate; // 모집 시작일
	private String boardContent; // 내용 
	private String memberNickname; // 닉네임
	private int studyNumber; // 모집인원
	private int readCount; // 조회수
	private int boardCode;
	private String location;
	private String address;
	
	
	
}
