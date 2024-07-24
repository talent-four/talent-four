package talentFour.classes.model.vo;

import java.util.List;

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
public class Category {
	private String categoryCode;
	private String categoryName;
	private String parentId;
	
	private List<Category> subCategory;
}
