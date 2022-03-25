package codedeploy.experiment;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FibonacciController {

	@GetMapping("/")
	public String getHome() {
		return "Hello world!";
	}

	@GetMapping("/{index}")
	public long getFibonacci(@PathVariable("index") long index) {
		long previous = 1;
		long current = 1;
		for (long i = 3; i <= index; i++) {
			current += previous;
			previous = current - previous;
		}
		return current;
	}

}
