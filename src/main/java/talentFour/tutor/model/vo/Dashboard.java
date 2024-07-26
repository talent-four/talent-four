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
public class Dashboard {
	
	private String className;
	private int classNo;
	private int paidCount;
	private int views;
	private int review;
	private int allPaidcount;
	private int allreviewcount;

}
