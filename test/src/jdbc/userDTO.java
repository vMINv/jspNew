package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class userDTO {
	private String id, per, password, mail, mname;
}
