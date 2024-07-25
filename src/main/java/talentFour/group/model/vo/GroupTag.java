package talentFour.group.model.vo;

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
public class GroupTag {

	private int tagNo; //태그번호
	private String tagName; // 태그이름
	private String tagImage; // 타그 이미지
	private int boardNo; //게시판 이름
	
}
