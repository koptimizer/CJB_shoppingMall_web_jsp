package my.model;
import java.util.List;

public class FlowerListView {

	private int flowerTotalCount;
	private int currentPageNumber;
	private List<Flower> flowerList; // 각 페이지 별 들어가는 정보
	private int pageTotalCount;
	private int flowerCountPerPage;
	private int firstRow;
	private int endRow;

	public FlowerListView(List<Flower> flowerList, int flowerTotalCount,
			int currentPageNumber, int flowerCountPerPage, int startRow,
			int endRow) {
		this.flowerList = flowerList;
		this.flowerTotalCount = flowerTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.flowerCountPerPage = flowerCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (flowerTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = flowerTotalCount / flowerCountPerPage;
			if (flowerTotalCount % flowerCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getFlowerTotalCount() {
		return flowerTotalCount;
	}

	public void setFlowerTotalCount(int flowerTotalCount) {
		this.flowerTotalCount = flowerTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Flower> getFlowerList() {
		return flowerList;
	}

	public void setFlowerList(List<Flower> flowerList) {
		this.flowerList = flowerList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getFlowerCountPerPage() {
		return flowerCountPerPage;
	}

	public void setFlowerCountPerPage(int flowerCountPerPage) {
		this.flowerCountPerPage = flowerCountPerPage;
	}
	
	
}
