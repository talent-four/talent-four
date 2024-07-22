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
public class TutorCalculate {
	
	private int settleStatus;
	private String memberNickname; 
	private String boardTitle;
	private int classPrice;
	private int commission;
	private String settleDate;
	private int ingsum;
	private int allsum;
	
	
}
