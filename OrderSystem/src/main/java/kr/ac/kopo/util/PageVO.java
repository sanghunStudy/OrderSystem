package kr.ac.kopo.util;

public class PageVO {
	private int displayRowCount =10; //한번에 출력할 개수
	private int rowStart, rowEnd; //시작 행번호, 끝 행번호
	private int totalPage,totalRow=0,//전체 페이지수,전체 데이터수
				page =1,pageStart,pageEnd;//현재 페이지, 시작페이지

	public void pageCalculate(int total) {
		getPage();
		totalRow = total;
		totalPage = (int)(total/displayRowCount);
		
		if(total % displayRowCount > 0)
			totalPage++;
		
		pageStart = (page -(page -1) % 10);
		pageEnd = pageStart + 9;
		if(pageEnd > totalPage)
			pageEnd = totalPage;
		
		rowStart = ((page -1) * displayRowCount) +1;
		rowEnd = rowStart + displayRowCount -1;
	}

	public int getDisplayRowCount() {
		return displayRowCount;
	}

	public void setDisplayRowCount(int displayRowCount) {
		this.displayRowCount = displayRowCount;
	}

	public int getRowStart() {
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

}
