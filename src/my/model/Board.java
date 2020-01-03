package my.model;

public class Board {
	
	private int boardId;
	private String memberId;
	private String boardName;
	private String boardContent;
	private String boardPicture;
	private String boardProduct;
	
	public Board() {}
	
	public Board(String memberId, String boardName, String boardContent, String boardPicture, String boardProduct) {
		super();
		this.memberId = memberId;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardPicture = boardPicture;
		this.boardProduct = boardProduct;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardPicture() {
		return boardPicture;
	}

	public void setBoardPicture(String boardPicture) {
		this.boardPicture = boardPicture;
	}

	public String getBoardProduct() {
		return boardProduct;
	}

	public void setBoardProduct(String boardProduct) {
		this.boardProduct = boardProduct;
	}
	
	
}