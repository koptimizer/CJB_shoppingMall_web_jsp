package my.model;
import java.util.List;

public class PaymentListView {

	private int paymentTotalCount;
	private int currentPageNumber;
	private List<Payment> paymentList; // 각 페이지 별 들어가는 정보
	private int pageTotalCount;
	private int paymentCountPerPage;
	private int firstRow;
	private int endRow;

	public PaymentListView(List<Payment> paymentList, int paymentTotalCount,
			int currentPageNumber, int paymentCountPerPage, int firstRow,
			int endRow) {
		this.paymentList = paymentList;
		this.paymentTotalCount = paymentTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.paymentCountPerPage = paymentCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (paymentTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = paymentTotalCount / paymentCountPerPage;
			if( paymentTotalCount % paymentCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getBoardTotalCount() {
		return paymentTotalCount;
	}

	public void setBoardTotalCount(int paymentTotalCount) {
		this.paymentTotalCount = paymentTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Payment> getPaymentList() {
		return paymentList;
	}

	public void setPaymentList(List<Payment> paymentList) {
		this.paymentList = paymentList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getPaymentCountPerPage() {
		return paymentCountPerPage;
	}

	public void setPaymentCountPerPage(int paymentCountPerPage) {
		this.paymentCountPerPage = paymentCountPerPage;
	}
	
	
}
