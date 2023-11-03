package com.ezen.biz.utils;

/*
 * 현재 페이지와 관련된 정보 저장
 * - 현재 페이지 번호
 * - 페이지당 게시글의 수
 */
public class Criteria {
	// Integer : pageNum,rowsPerPage 왜 기본형이 아닌 참조형으로 선언???
	// 값을 전달하지 하지 않아도 오류 발생 x : 기본값 null 을 받을 수 있도록
	private Integer pageNum;	// 현재 페이지 번호
	private Integer rowsPerPage;	// 페이지당 게시글의 수
    // 검색어
    private String searchword;
    private String searchtype;
	
    // 검색 관련 추가
    private int ca_no;
    private int sca_no;
    private String company;//기본값 null
    
	// 생성자
	// 기본값: 페이지번호=1, 게시글의수=10
	public Criteria() {		
		this(1, 6,"title","");
		sca_no=0;
		ca_no=0;
		company=null;

	}		
	
	public Criteria(int pageNum, int rowsPerPage,String searchtype,String searchword) {
		this.pageNum = pageNum;
		this.rowsPerPage = rowsPerPage;
		this.searchtype=searchtype;
		this.searchword=searchword;		
	}
	
	
	public int getCa_no() {
		return ca_no;
	}

	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}

	public int getSca_no() {
		return sca_no;
	}

	public void setSca_no(int sca_no) {
		this.sca_no = sca_no;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public void setRowsPerPage(Integer rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getSearchtype() {
		return searchtype;
	}

	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}

	public int getPageNum() {
		return pageNum;
	}

	// 페이지 번호는 0 이상이어야 함.
	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	// 페이지 당 게시글의 수는 5~20 사이로 한정
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage <= 5) {
			this.rowsPerPage = 5;
		} else if (rowsPerPage > 20) {
			this.rowsPerPage = 20;
		} else {
			this.rowsPerPage = rowsPerPage;
		}
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", rowsPerPage=" + rowsPerPage + ", searchword=" + searchword
				+ ", searchtype=" + searchtype + ", ca_no=" + ca_no + ", sca_no=" + sca_no + ", company=" + company
				+ "]";
	}



}
