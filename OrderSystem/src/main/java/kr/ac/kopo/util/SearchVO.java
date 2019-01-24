package kr.ac.kopo.util;

public class SearchVO extends PageVO {

	private String searchKeyword =""; //검색 키워드
	private String searchType = ""; // 검색 필드:제목,내용 등
	private String[] searchTypeArr; // 검색 필드를 배열로 변환
	private int page =1;
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String[] getSearchTypeArr() {
		return searchType.split(",");
	}
	@Override
	public void pageCalculate(int total) {
		// TODO Auto-generated method stub
		super.pageCalculate(total);
	}
	@Override
	public int getDisplayRowCount() {
		// TODO Auto-generated method stub
		return super.getDisplayRowCount();
	}
	@Override
	public void setDisplayRowCount(int displayRowCount) {
		// TODO Auto-generated method stub
		super.setDisplayRowCount(displayRowCount);
	}
	@Override
	public int getRowStart() {
		// TODO Auto-generated method stub
		return super.getRowStart();
	}
	@Override
	public void setRowStart(int rowStart) {
		// TODO Auto-generated method stub
		super.setRowStart(rowStart);
	}
	@Override
	public int getRowEnd() {
		// TODO Auto-generated method stub
		return super.getRowEnd();
	}
	@Override
	public void setRowEnd(int rowEnd) {
		// TODO Auto-generated method stub
		super.setRowEnd(rowEnd);
	}
	@Override
	public int getTotalPage() {
		// TODO Auto-generated method stub
		return super.getTotalPage();
	}
	@Override
	public void setTotalPage(int totalPage) {
		// TODO Auto-generated method stub
		super.setTotalPage(totalPage);
	}
	@Override
	public int getTotalRow() {
		// TODO Auto-generated method stub
		return super.getTotalRow();
	}
	@Override
	public void setTotalRow(int totalRow) {
		// TODO Auto-generated method stub
		super.setTotalRow(totalRow);
	}
	@Override
	public int getPage() {
		// TODO Auto-generated method stub
		return super.getPage();
	}
	@Override
	public void setPage(int page) {
		// TODO Auto-generated method stub
		super.setPage(page);
	}
	@Override
	public int getPageStart() {
		// TODO Auto-generated method stub
		return super.getPageStart();
	}
	@Override
	public void setPageStart(int pageStart) {
		// TODO Auto-generated method stub
		super.setPageStart(pageStart);
	}
	@Override
	public int getPageEnd() {
		// TODO Auto-generated method stub
		return super.getPageEnd();
	}
	@Override
	public void setPageEnd(int pageEnd) {
		// TODO Auto-generated method stub
		super.setPageEnd(pageEnd);
	}
	
	
}
