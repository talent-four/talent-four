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

	private String inputImage;
	private String inputTel;
	private String inputIntroduce;
	private String accountName;
	private String bankName;
	private String accountNumber;
	private String license;
	private String[] university;
	
}
