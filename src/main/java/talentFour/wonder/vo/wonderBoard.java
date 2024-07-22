package talentFour.wonder.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor

public class wonderBoard {

    private int boardNo;
    private String boardTitle;
    private String memberNickname;
    private String boardContent;
    private String wonderType;
    private String hashTag;
    private String createDate;
    private String updatDt;
    private int readCount;
    private int board_cd;
	private String qaStatus;

}
