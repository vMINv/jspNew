package jdbc;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class orderDTO {
	private String ono, fno, id, menu, total, opro;
}
