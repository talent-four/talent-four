package talentFour.group.model.vo;

import java.sql.Date;

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
public class member {

	private int memberNo; 
	private String memberEmail;
	private String memberNickname;
	private String memberPw;
	private Date enrillDate;
	private String secessionFlag;
	private int memberStatus;
	private String memberProfile;
	
	
	
	
	
}
