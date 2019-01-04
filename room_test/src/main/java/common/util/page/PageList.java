package main.java.common.util.page;

import java.util.ArrayList;
import java.util.Collection;

/**
 * 包含“分页”信息的<code>List</code>。
 */
public class PageList<E> extends ArrayList<E> implements java.io.Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 4323066128057985942L;

    private Paginator         paginator;
    

	private int currentlyPageNo;	// 当前页码

	private int pageTotal;			// 总页数

	private int dataTotal;			// 总信息数

	private int pageSize;			// 一页显示多少条信息

	private boolean haveNextPage;	// 是否有下一条

	private boolean haveBeforePage;	// 是否有上一条
	
	/**
	 * 分页查询中处理分页信息 aola
	 * @param pageQuery
	 * @param count  查询的总count
	 */
	public void  doPageQuery(PageQuery pageQuery,Integer count){
		if(pageQuery==null||count==null){
			return ;
		}
		this.setCurrentlyPageNo(pageQuery.getPageNum());
		this.setDataTotal(count);
		this.setPageSize(pageQuery.getPageSize());
		if(count%pageQuery.getPageSize()==0){
			this.setPageTotal(count/pageQuery.getPageSize());
		}else{
			this.setPageTotal((count/pageQuery.getPageSize())+1);
		}
		if(pageQuery.getPageNum()<this.getPageTotal()){
			this.setHaveNextPage(true);
		}else{
			this.setHaveNextPage(false);
		}
		
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

	/**
     * 创建一个<code>PageList</code>。
     */
    public PageList() {
        paginator = new Paginator();
    }

    /**
     * 创建<code>PageList</code>，并将指定<code>Collection</code>中的内容复制到新的list中。
     * 
     * @param c 要复制的<code>Collection</code>
     */
    public PageList(Collection<E> c) {
        this(c, null);
    }

    /**
     * 创建<code>PageList</code>，并将指定<code>Collection</code>中的内容复制到新的list中。
     * 
     * @param c 要复制的<code>Collection</code>
     */
    public PageList(Collection<E> c, Paginator paginator) {
        super(c);
        this.paginator = (paginator == null) ? new Paginator() : paginator;
    }

    /**
     * 取得分页器，可从中取得有关分页和页码的所有信息。
     * 
     * @return 分页器对象
     */
    public Paginator getPaginator() {
        return paginator;
    }

    /**
     * 设置分页器。
     * 
     * @param paginator 要设置的分页器对象
     */
    public void setPaginator(Paginator paginator) {
        if (paginator != null) {
            this.paginator = paginator;
        }
    }
}
