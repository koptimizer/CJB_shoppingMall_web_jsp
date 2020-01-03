package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Flower;
import my.model.FlowerListView;
import my.model.Member;
import my.util.JdbcUtil;

public class FlowerDao {
	
	public void insert(Connection conn, Flower flower) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into flower (flowerName, mainPic, price, pic1, explain1 , pic2, explain2 , pic3, explain3, type)"
					+ " values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, flower.getFlowerName());
			pstmt.setString(2, flower.getMainPic());
			pstmt.setInt(3, flower.getPrice());
			pstmt.setString(4, flower.getPic1());
			pstmt.setString(5, flower.getExplain1());
			pstmt.setString(6, flower.getPic2());
			pstmt.setString(7, flower.getExplain2());
			pstmt.setString(8, flower.getPic3());
			pstmt.setString(9, flower.getExplain3());
			pstmt.setString(10, flower.getType());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Flower selectByFlowerName(Connection conn, String flowerName) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Flower flower = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from flower where flowerName = ?");
			pstmt.setString(1, flowerName);
			rs = pstmt.executeQuery();
			if (rs.next()){
				flower = new Flower(); 
				flower.setFlowerName(rs.getString(1));
				flower.setMainPic(rs.getString(2));
				flower.setPrice(rs.getInt(3));
				flower.setFav(rs.getInt(4));
				flower.setPic1(rs.getString(5));
				flower.setExplain1(rs.getString(6));
				flower.setPic2(rs.getString(7));
				flower.setExplain2(rs.getString(8));
				flower.setPic3(rs.getString(9));
				flower.setExplain3(rs.getString(10));
				flower.setType(rs.getString(11));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return flower;
	}
	
	public void deleteByFlowerName(Connection conn, String flowerName) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from flower where flowerName = ?");
			pstmt.setString(1, flowerName);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void updateFav(Connection conn, String flowerName, int inc) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update flower set fav = fav + "+inc+" where flowerName=?");
			pstmt.setString(1, flowerName);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from flower");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	public List<Flower> selectFlowerList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Flower> flowerList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from flower ");			
			rs  = pstmt.executeQuery(); 
			flowerList = new ArrayList<Flower>();
			while (rs.next()){
				Flower flower = new Flower();
				flower.setFlowerName(rs.getString(1));
				flower.setMainPic(rs.getString(2));
				flower.setPrice(rs.getInt(3));
				flower.setFav(rs.getInt(4));
				flower.setPic1(rs.getString(5));
				flower.setExplain1(rs.getString(6));
				flower.setPic2(rs.getString(7));
				flower.setExplain2(rs.getString(8));
				flower.setPic3(rs.getString(9));
				flower.setExplain3(rs.getString(10));
				flower.setType(rs.getString(11));
				flowerList.add(flower);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return flowerList;
	}
	
	public List<Flower> selectFlowerListByFav(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Flower> flowerList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from flower order by fav desc");			
			rs  = pstmt.executeQuery(); 
			flowerList = new ArrayList<Flower>();
			while (rs.next()){
				Flower flower = new Flower();
				flower.setFlowerName(rs.getString(1));
				flower.setMainPic(rs.getString(2));
				flower.setPrice(rs.getInt(3));
				flower.setFav(rs.getInt(4));
				flower.setPic1(rs.getString(5));
				flower.setExplain1(rs.getString(6));
				flower.setPic2(rs.getString(7));
				flower.setExplain2(rs.getString(8));
				flower.setPic3(rs.getString(9));
				flower.setExplain3(rs.getString(10));
				flower.setType(rs.getString(11));
				flowerList.add(flower);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return flowerList;
	}
	
	public List<Flower> selectFlowerListByType(Connection conn, String type) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Flower> flowerList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from flower where type = ?");
			pstmt.setString(1, type);
			rs  = pstmt.executeQuery(); 
			flowerList = new ArrayList<Flower>();
			while (rs.next()){
				Flower flower = new Flower();
				flower.setFlowerName(rs.getString(1));
				flower.setMainPic(rs.getString(2));
				flower.setPrice(rs.getInt(3));
				flower.setFav(rs.getInt(4));
				flower.setPic1(rs.getString(5));
				flower.setExplain1(rs.getString(6));
				flower.setPic2(rs.getString(7));
				flower.setExplain2(rs.getString(8));
				flower.setPic3(rs.getString(9));
				flower.setExplain3(rs.getString(10));
				flower.setType(rs.getString(11));
				flowerList.add(flower);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return flowerList;
	}
	
	private static final int MOVIE_COUNT_PER_PAGE = 5;

	public FlowerListView getFlowerList(Connection conn, int pageNumber)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int flowerTotalCount = selectCount(conn);

		List<Flower> flowerList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (flowerTotalCount > 0) {
				firstRow = (pageNumber - 1) * MOVIE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MOVIE_COUNT_PER_PAGE - 1;
				flowerList = selectListLimit(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				flowerList = Collections.emptyList();
			}
		} catch (SQLException e) {
		} finally {
			JdbcUtil.close(conn);
		}
		return new FlowerListView(flowerList,
				flowerTotalCount, currentPageNumber,
				MOVIE_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	public List<Flower> selectListLimit(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Flower> flowerList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from flower limit ?,?");
			pstmt.setInt(1, firstRow);
			pstmt.setInt(2, endRow);
			rs  = pstmt.executeQuery(); 
			flowerList = new ArrayList<Flower>();
			while (rs.next()){
				Flower flower = new Flower();
				flower.setFlowerName(rs.getString(1));
				flower.setMainPic(rs.getString(2));
				flower.setPrice(rs.getInt(3));
				flower.setFav(rs.getInt(4));
				flower.setPic1(rs.getString(5));
				flower.setExplain1(rs.getString(6));
				flower.setPic2(rs.getString(7));
				flower.setExplain2(rs.getString(8));
				flower.setPic3(rs.getString(9));
				flower.setExplain3(rs.getString(10));
				flower.setType(rs.getString(11));
				flowerList.add(flower);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return flowerList;
	}

}