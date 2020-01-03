package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Board;
import my.model.Member;
import my.util.JdbcUtil;

public class MemberDao {
	
	public void insert(Connection conn, Member member) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into member (memberId,memberPw,memberName,memberAdd,memberTel,memberEmail)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberAdd());
			pstmt.setString(5, member.getMemberTel());
			pstmt.setString(6, member.getMemberEmail());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public boolean checkMemberPw(Connection conn, String memberId, String memberPw) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		String dbmemberPw = "";
		try {
			pstmt = conn.prepareStatement
			("select * from member where memberId = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				dbmemberPw = rs.getString(2);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		if(memberPw.equals(dbmemberPw)) {
			return true;
		}else { 
			return false;
		}
	}
	
	public boolean checkOverlapMemberId(Connection conn, String memberId)
			throws SQLException {
		Member member = null;
		member = selectById(conn, memberId);
		if(member != null) {
			member=null;
			return false;	
		}
		else {
			member=null;
			return true;
		}
	}
	
	public Member selectById(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Member member = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from member where memberId = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				member = new Member(); 
				member.setMemberId(rs.getString(1));
				member.setMemberPw(rs.getString(2));
				member.setMemberName(rs.getString(3));
				member.setMemberAdd(rs.getString(4));
				member.setMemberTel(rs.getString(5));
				member.setMemberEmail(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return member;
	}
	
	public String selectNameById(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Member member = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from member where memberId = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				member = new Member(); 
				member.setMemberId(rs.getString(1));
				member.setMemberPw(rs.getString(2));
				member.setMemberName(rs.getString(3));
				member.setMemberAdd(rs.getString(4));
				member.setMemberTel(rs.getString(5));
				member.setMemberEmail(rs.getString(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return member.getMemberName();
	}
	
	public void deleteById(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from member where memberId = ?");
			pstmt.setString(1, memberId);
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
			rs = stmt.executeQuery("select count(*) from member");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public void modifyPassword(Connection conn, String memberId, String memberPw) throws SQLException {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement
					("update member set memberPw = ? where memberId = ?");
			pstmt.setString(1, memberPw);
			pstmt.setString(2, memberId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
		}
	
	}
}