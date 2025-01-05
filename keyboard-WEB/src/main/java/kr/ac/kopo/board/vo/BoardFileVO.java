package kr.ac.kopo.board.vo;

public class BoardFileVO {
    private int fileNo;
    private int boardNo;
    private String fileOriName;
    private String fileSaveName;
    private String filePath;
    private long fileSize;
    private String fileType;
    

    public BoardFileVO() {

    }

	public BoardFileVO(int fileNo, int boardNo, String fileOriName, String fileSaveName, String filePath, long fileSize,
			String fileType) {
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.fileOriName = fileOriName;
		this.fileSaveName = fileSaveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileType = fileType;
	}

	// Getter/Setter
    public int getFileNo() {
        return fileNo;
    }

    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public String getFileOriName() {
        return fileOriName;
    }

    public void setFileOriName(String fileOriName) {
        this.fileOriName = fileOriName;
    }

    public String getFileSaveName() {
        return fileSaveName;
    }

    public void setFileSaveName(String fileSaveName) {
        this.fileSaveName = fileSaveName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

	@Override
	public String toString() {
		return "BoardFileVO [fileNo=" + fileNo + ", boardNo=" + boardNo + ", fileOriName=" + fileOriName
				+ ", fileSaveName=" + fileSaveName + ", filePath=" + filePath + ", fileSize=" + fileSize + ", fileType="
				+ fileType + "]";
	}
    
}
