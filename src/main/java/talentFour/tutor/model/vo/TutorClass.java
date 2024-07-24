package talentFour.tutor.model.vo;

import java.sql.Date;

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
public class TutorClass {

	private int classNo;
	private String classPhoto;
	private String className;
	private int classStatus ;
	private String classCreateDate;
	private String classCount;
	
}
