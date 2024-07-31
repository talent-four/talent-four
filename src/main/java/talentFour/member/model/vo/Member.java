package talentFour.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberNickname;
	private String memberPw;
	private String enrollDate;
	private String SecessionFlag;
	private int memberStatus;
	private String memberProfile;
}
