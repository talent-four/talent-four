package talentFour.tutor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TutorRegister {

	private int memberNo;
	private int memberStatus;
	private String memberProfile;
	private String memberNickname;
	private String tutorProfile;
	private String tutorTel;
	private String tutorIntroduce;
	private String accountName;
	private String bankName;
	private String account;
	private String education;
	
}
