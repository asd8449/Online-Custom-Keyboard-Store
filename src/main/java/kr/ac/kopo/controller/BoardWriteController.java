package kr.ac.kopo.controller;

import java.io.File;
import java.util.Collection;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.ac.kopo.service.BoardService;
import kr.ac.kopo.util.KopoFileNamePolicy;

public class BoardWriteController implements Controller {
	
	private BoardService boardService;
	
	public BoardWriteController() {
		boardService = new BoardService();
	}

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		System.out.println(title + " : " + writer + " : " + content);
		
		// 파일정보 처리...
		
		Collection<Part> parts =  request.getParts();
		for(Part part : parts) {
			if(part.getName().startsWith("attach")) {
				String fileOriName = part.getSubmittedFileName();
				if(fileOriName != null && fileOriName.length() > 0) {
					//System.out.println("[" + fileOriName + "]");	
					String fileSaveName = new KopoFileNamePolicy().rename(new File(fileOriName)).getName();
					//System.out.println("fileSaveName : " + fileSaveName);
					long fileSize = part.getSize();
					part.write(fileSaveName);
				}
			}
		}
			
		
		return "redirect:/board/list.do";
	}

}
