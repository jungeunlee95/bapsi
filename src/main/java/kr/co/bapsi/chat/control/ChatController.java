package kr.co.bapsi.chat.control;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("/chat")
	public String viewChat() {
		return "jsp/chat/chat";
	}

}
