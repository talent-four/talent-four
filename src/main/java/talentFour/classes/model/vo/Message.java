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
   private String toId;
   private String message;
   private String fromId;
    @Override
    public String toString() {
        return toId+"/"+message+"/"+fromId;
    }
}
