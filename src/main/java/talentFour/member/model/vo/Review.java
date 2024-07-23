package talentFour.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
@Builder
@ToString
public class Review {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createdDate;
	private String updateDate;
	private int boardStatus;
	private String memberNickname; //게시글(리뷰) 작성자
	private double reviewStar;
	private int parents; // 리뷰의 상위 게시글
	private String tag;
	private int report;
	private int thumbs;
	private String profileImage;
	private String lectureName;
	private String instructorName;
	private String classURL;
}
