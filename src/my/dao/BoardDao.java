package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Board;
import my.model.BoardListView;
import my.util.JdbcUtil;

public class BoardDao {
	
	public void insert(Connection conn, Board board) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into board (memberId, boardName, boardContent, boardPicture, boardProduct)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, board.getMemberId());
			pstmt.setString(2, board.getBoardName());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setString(4, board.getBoardPicture());
			pstmt.setString(5, board.getBoardProduct());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Board selectByBoardProduct(Connection conn, String boardProduct) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Board board = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from board where boardProduct = ? order by boardId desc");
			pstmt.setString(1, boardProduct);
			rs = pstmt.executeQuery();
			if (rs.next()){
				board = new Board(); 
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return board;
	}
	
	public Board selectByMemberId(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Board board = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from board where memberId = ? order by boardId desc");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				board = new Board(); 
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return board;
	}
	
	public Board selectByBoardId(Connection conn, String boardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Board board = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from board where boardId = ? order by boardId desc");
			pstmt.setString(1, boardId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				board = new Board(); 
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return board;
	}
	
	public void deleteById(Connection conn, String boardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from board where boardId = ?");
			pstmt.setString(1, boardId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from board");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	private static final int BOARD_COUNT_PER_PAGE = 5;

	public BoardListView getBoardList(Connection conn, int pageNumber, String index, String searchText)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int boardTotalCount = 0;
		if(index == null && searchText == null) {
			boardTotalCount = selectCount(conn);
		}else {
			boardTotalCount = selectCountBySearchText(conn, index, searchText );
		}
		List<Board> boardList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (boardTotalCount > 0) {
				firstRow = (pageNumber - 1) * BOARD_COUNT_PER_PAGE + 1;
				endRow = firstRow + BOARD_COUNT_PER_PAGE - 1;
				if(searchText == null && index == null) {
					boardList = selectListLimit(conn, firstRow, endRow);
				}
				else {
					boardList = selectListLimit(conn, firstRow, endRow, index, searchText);
				}
				
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
		} catch (SQLException e) {
		} finally {
			JdbcUtil.close(conn);
		}
		return new BoardListView(boardList,
				boardTotalCount, currentPageNumber,
				BOARD_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	public int selectCountBySearchText(Connection conn, String index, String searchText) throws SQLException {
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		try {
			pstmt = conn.prepareStatement("select count(*) from board where "+index+" = ?");
			pstmt.setString(1, searchText);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Board> selectListLimit(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board order by boardId desc limit ?,?");
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
				boardList.add(board);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return boardList;
	}

	public List<Board> selectListLimit(Connection conn, int firstRow, int endRow, String index, String searchText) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board where "+index+" = ? order by boardId desc limit ?,?");
			pstmt.setString(1, searchText);
			pstmt.setInt(2, firstRow-1);
			pstmt.setInt(3, endRow);
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
				boardList.add(board);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return boardList;
	}
	
	
	/*
	public BoardListView getBoardListByMemberId(Connection conn, int pageNumber, String memberId)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int boardTotalCount = selectCount(conn);

		List<Board> boardList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (boardTotalCount > 0) {
				firstRow = (pageNumber - 1) * BOARD_COUNT_PER_PAGE + 1;
				endRow = firstRow + BOARD_COUNT_PER_PAGE - 1;
				boardList = selectListLimitByMemberId(conn, firstRow, endRow, memberId);
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
		} catch (SQLException e) {
		} finally {
			JdbcUtil.close(conn);
		}
		return new BoardListView(boardList,
				boardTotalCount, currentPageNumber,
				BOARD_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	public List<Board> selectListLimitByMemberId(Connection conn, int firstRow, int endRow, String memberId) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board where memberId = ? limit ?,?");
			pstmt.setString(1, memberId);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, endRow);
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
				boardList.add(board);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return boardList;
	}
	
	public BoardListView getBoardListByBoardProduct(Connection conn, int pageNumber, String boardProduct)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int boardTotalCount = selectCount(conn);

		List<Board> boardList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (boardTotalCount > 0) {
				firstRow = (pageNumber - 1) * BOARD_COUNT_PER_PAGE + 1;
				endRow = firstRow + BOARD_COUNT_PER_PAGE - 1;
				boardList = selectListLimitByBoardProduct(conn, firstRow, endRow, boardProduct);
			} else {
				currentPageNumber = 0;
				boardList = Collections.emptyList();
			}
		} catch (SQLException e) {
		} finally {
			JdbcUtil.close(conn);
		}
		return new BoardListView(boardList,
				boardTotalCount, currentPageNumber,
				BOARD_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	public List<Board> selectListLimitByBoardProduct(Connection conn, int firstRow, int endRow, String boardProduct) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board where boardProduct = ? limit ?,?");
			pstmt.setString(1, boardProduct);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, endRow);
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setMemberId(rs.getString(2));
				board.setBoardName(rs.getString(3));
				board.setBoardContent(rs.getString(4));
				board.setBoardPicture(rs.getString(5));
				board.setBoardProduct(rs.getString(6));
				boardList.add(board);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return boardList;
	}
	*/
}