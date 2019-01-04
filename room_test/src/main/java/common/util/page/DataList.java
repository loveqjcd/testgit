package main.java.common.util.page;

import java.util.ArrayList;
import java.util.List;

import main.java.common.util.StrUtils;



/**
 * 说明：分页信息
 */
@SuppressWarnings("unchecked")
public class DataList implements java.io.Serializable{
	
	private static final long serialVersionUID = -8001743623997133035L;

	private int currentlyPageNo;	// 当前页码

	private int pageTotal;			// 总页数

	private int dataTotal;			// 总信息数

	private int pageSize;			// 一页显示多少条信息

	private boolean haveNextPage;	// 是否有下一条

	private boolean haveBeforePage;	// 是否有上一条

	private List<Object> data;		// 一页的信息
	
	/**
	 * 说明：主要用于特殊情况，例如基于lucene查询时，先返回的是ids，再根据ids到数据库中进行加载
	 */
	private String ids;
	
	/**
	 * 说明：判断是否拥有ids值
	 * @return
	 */
	public boolean hasIds(){
		return StrUtils.isNotEmpty(this.ids);
	}

	public DataList(){
		this(0, 0, 0,0, true, true,new ArrayList());
	}
	
	/**
	 * 主要用于构建基于lucene等查询出来的只返回id组合的结果
	 * @param currentlyPageNo
	 * @param pageSize
	 * @param dataTotal
	 * @param ids
	 */
	public DataList(int currentlyPageNo, int pageSize, int dataTotal,String ids){
		this.currentlyPageNo = currentlyPageNo;
		this.pageSize = pageSize;
		this.dataTotal = dataTotal;
		this.setIds(ids);
	}

	public DataList(int currentlyPageNo, int pageSize, int dataTotal,int pageTotal, boolean haveNextPage, boolean haveBeforePage,List data) {
		this.currentlyPageNo = currentlyPageNo;
		this.pageSize = pageSize;
		this.dataTotal = dataTotal;
		this.pageTotal = pageTotal;
		this.haveBeforePage = haveBeforePage;
		this.haveNextPage = haveNextPage;
		this.data = data;
	}

	public int getCurrentlyPageNo() {
		return currentlyPageNo;
	}

	public void setCurrentlyPageNo(int currentlyPageNo) {
		this.currentlyPageNo = currentlyPageNo;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getDataTotal() {
		return dataTotal;
	}

	public void setDataTotal(int dataTotal) {
		this.dataTotal = dataTotal;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public boolean isHaveNextPage() {
		return haveNextPage;
	}

	public void setHaveNextPage(boolean haveNextPage) {
		this.haveNextPage = haveNextPage;
	}

	public boolean isHaveBeforePage() {
		return haveBeforePage;
	}

	public void setHaveBeforePage(boolean haveBeforePage) {
		this.haveBeforePage = haveBeforePage;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}

