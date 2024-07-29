package talentFour.classes.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Message {
   private String toId; // 보낼 아이디
   private String fromId; // 보낸 아이디
   private String message;
    @Override
    public String toString() {
        return toId+"/"+message+"/"+fromId;
    }
}
