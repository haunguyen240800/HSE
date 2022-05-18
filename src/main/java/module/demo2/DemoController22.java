package module.demo2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("DemoController22")
@RequestMapping("/demo21/demo22")
public class DemoController22 {
	@RequestMapping(value = "/list")
	public String demo2() {
		return "demo2";
	}
}
