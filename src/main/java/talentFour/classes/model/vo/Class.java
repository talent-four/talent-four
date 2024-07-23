package talentFour.classes.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Class {

	private int classNo;
	private String className;
	private String classIntro;
	private String classPhoto;
	private String classUrl;
	private String classCreateDt; 
	private int classStatus;
	private int classPrice;
	private int memberNo;
	private String memberNickname;
	private String categoryCode;
	private String memberProfile;
	private String main;
	private String sub;

}
