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
	private String tagName;
	private Date startDate;
	private String boardContent;
	private String memberNickname;
	private int studyNumber;
	private int readCount;
	private int memberNo;
	private int boardCode;
	private String tagImage;
	
	
	
}
