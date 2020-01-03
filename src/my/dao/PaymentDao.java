package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Board;
import my.model.BoardListView;
import my.model.Payment;
import my.model.PaymentListView;
import my.model.Payment;
import my.util.JdbcUtil;

public class PaymentDao {
	
	public void insert(Connection conn, Payment payment) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into payment (memberId, memberName, memberEmail, receiveName, receiveAddress, receiveTel, receiveText, receiveDate, flowerName, amount, price)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, payment.getMemberId());
			pstmt.setString(2, payment.getMemberName());
			pstmt.setString(3, payment.getMemberEmail());
			pstmt.setString(4, payment.getReceiveName());
			pstmt.setString(5, payment.getReceiveAddress());
			pstmt.setString(6, payment.getReceiveTel());
			pstmt.setString(7, payment.getReceiveText());
			pstmt.setString(8, payment.getReceiveDate());
			pstmt.setString(9, payment.getFlowerName());
			pstmt.setInt(10, payment.getAmount());
			pstmt.setInt(11, payment.getPrice());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String orderId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from payment where orderId = ?");
			pstmt.setString(1, orderId);
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
			rs = stmt.executeQuery("select count(*) from payment");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	private static final int PAYMENT_COUNT_PER_PAGE = 5;

	public PaymentListView getPaymentList(Connection conn, int pageNumber, String memberId)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int paymentTotalCount = selectCount(conn);
		List<Payment> paymentList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (paymentTotalCount > 0) {
				firstRow = (pageNumber - 1) * PAYMENT_COUNT_PER_PAGE;
				endRow = PAYMENT_COUNT_PER_PAGE;
				paymentList =
						selectListLimit(conn, firstRow, endRow, memberId);
			} else {
				currentPageNumber = 0;
				paymentList = Collections.emptyList();
			}
		} catch (SQLException e) {	
			
		} finally {
			JdbcUtil.close(conn);
		}
		return new PaymentListView(paymentList,
				paymentTotalCount, currentPageNumber,
				PAYMENT_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	public List<Payment> selectListLimit(Connection conn, int firstRow, int endRow, String memberId) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Payment> paymentList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from payment where memberId = ? limit ?,?");
			pstmt.setString(1, memberId);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, endRow);
			rs  = pstmt.executeQuery(); 
			paymentList = new ArrayList<Payment>();
			while (rs.next()){
				Payment payment = new Payment();
				payment.setOrderId(rs.getInt(1));
				payment.setMemberId(rs.getString(2));
				payment.setMemberName(rs.getString(3));
				payment.setMemberEmail(rs.getString(4));
				payment.setReceiveName(rs.getString(5));
				payment.setReceiveAddress(rs.getString(6));
				payment.setReceiveTel(rs.getString(7));
				payment.setReceiveText(rs.getString(8));
				payment.setReceiveDate(rs.getString(9));
				payment.setFlowerName(rs.getString(10));
				payment.setAmount(rs.getInt(11));
				payment.setPrice(rs.getInt(12));
				paymentList.add(payment);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return paymentList;
	}
	
}