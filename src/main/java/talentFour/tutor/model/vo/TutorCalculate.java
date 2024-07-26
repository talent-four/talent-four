package talentFour.tutor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TutorCalculate {
	
	private int settleStatus;
	private String memberNickname; 
	private String className;
	private int classPrice;
	private int commission;
	private String settleDate;
	private int ingsum;
	private int finsum;
	private int allsum;
	private int memberNo;
	
	
	private String bankName;
	private String accountName;
	private String account;
	
}
