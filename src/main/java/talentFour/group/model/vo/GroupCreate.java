package talentFour.group.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class GroupCreate {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date studyStart;
	private Date studyEnd;
	private int studyNumber; // 모집인원
	private String studyAddress; // 모입장소
	private String studyType;  // 온라인/오프라인
	private String studyCost;
	private String studyStatus; //모입상태(모집중/모집완료)
	private String studyTel; // 연락처(오픈카톡 이메일 등)
	private List<String> stackList;
	
	
	
	
}
