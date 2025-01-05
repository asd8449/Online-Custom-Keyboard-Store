package kr.ac.kopo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.service.BoardService;
import kr.ac.kopo.util.KopoFileNamePolicy;

public class BoardWriteController implements Controller {

    private BoardService boardService;

    public BoardWriteController() {
        boardService = new BoardService();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 파라미터 수신
        String noStr   = request.getParameter("no");   // 수정 시 게시글 번호
        String title   = request.getParameter("title");
        String writer  = request.getParameter("writer");
        String content = request.getParameter("content");
        String type    = request.getParameter("type");

        System.out.println("[BoardWriteController] no=" + noStr
            + ", title=" + title + ", writer=" + writer
            + ", content=" + content + ", type=" + type);

        // VO 생성
        BoardVO board = new BoardVO(title, writer, content, type);

        // no가 있으면 수정 모드
        boolean isUpdate = false;
        if (noStr != null && !noStr.trim().isEmpty()) {
            board.setOriNo(Integer.parseInt(noStr));
            isUpdate = true;
        }

        // 톰캣 실제 경로( /resources/images ) 획득
        String realPath = request.getServletContext().getRealPath("/resources/images");
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // 파일 Part 처리
        Collection<Part> parts = request.getParts();
        List<BoardFileVO> uploadedFiles = new ArrayList<>();

        for (Part part : parts) {
            if (part.getName().startsWith("attach")) {
                String fileOriName = part.getSubmittedFileName();
                if (fileOriName != null && !fileOriName.trim().isEmpty()) {
                    // 중복 방지용 고유파일명 생성
                    File renameFile = new KopoFileNamePolicy().rename(new File(uploadDir, fileOriName));
                    String fileSaveName = renameFile.getName();
                    String fullPath = renameFile.getAbsolutePath();

                    // 실제 파일 저장
                    part.write(fullPath);

                    // DB 저장 경로(웹 접근용)
                    String relativePath = "/resources/images/" + fileSaveName;

                    // 파일 정보 VO 생성
                    BoardFileVO fileVO = new BoardFileVO();
                    fileVO.setFileOriName(fileOriName);
                    fileVO.setFileSaveName(fileSaveName);
                    fileVO.setFilePath(relativePath);
                    fileVO.setFileSize(part.getSize());

                    uploadedFiles.add(fileVO);
                }
            }
        }

        // 첨부파일 여부
        if (!uploadedFiles.isEmpty()) {
            board.setHasFile("Y");
            board.setFiles(uploadedFiles);
        } else {
            board.setHasFile("N");
        }

        // isUpdate 여부에 따른 DB 로직 분기
        if (isUpdate) {
            // 기존 글 수정
        	board.setNo(Integer.parseInt(noStr));
            boardService.updateBoardWithFiles(board);
        } else {
            // 새 글 등록
            boardService.insertBoardWithFiles(board);
        }

        // 완료 후 목록으로 이동
        return "redirect:/board/list.do";
    }
}
