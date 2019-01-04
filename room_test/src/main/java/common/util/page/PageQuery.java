package main.java.common.util.page;

/**
 * PageQuery
 * 
 * 
 * @since 2013-3-5 下午7:00:48
 */
public class PageQuery implements java.io.Serializable{
	
	private static final long serialVersionUID = 4674801445134097375L;
	
	private int             pageNum  = 1;                   //第几页
    private int             pageSize = 10;                  //每页多少条记录

    private int             startIndex;
    private int             endIndex;

    /** 默认的分页查询条件，第1页，每页10条 */
    public static PageQuery DEFAULT  = new PageQuery(1, 10);

    public PageQuery(int pageNum) {
        this(pageNum, 10);
    }

    public PageQuery(int pageNum, int pageSize) {
        init(pageNum, pageSize);
    }

    public void init(int pageNum, int pageSize) {
        if (pageNum <= 0) {
            pageNum = 1;
        }

        if (pageSize > 10000) {
            throw new IllegalArgumentException("page size can't be greater than 10000.");
        }

        this.pageNum = pageNum;
        this.pageSize = pageSize;

        this.startIndex = (this.pageNum - 1) * this.pageSize;
        this.endIndex = this.pageNum * this.pageSize;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public int getEndIndex() {
        return endIndex;
    }

    public int getPageNum() {
        return pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void increasePageNum() {
        increasePageNum(1);
    }

    public void increasePageNum(int offset) {
        this.init(this.pageNum + offset, pageSize);
    }

    @Override
    public String toString() {
        return "PageQuery [pageNum=" + pageNum + ", pageSize=" + pageSize + ", startIndex=" + startIndex
                + ", endIndex=" + endIndex + "]";
    }
}
