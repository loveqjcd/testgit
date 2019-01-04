package main.java.common.util.page;

import java.util.HashMap;

/**
 * @author ckex ibatis map为查询参数
 */
public class SearchMap extends HashMap<String, Object> {

    private static final long serialVersionUID = 3210675127773137307L;

    public SearchMap() {
        super();
    }

    public SearchMap add(String key, Object value) {
        this.put(key, value);
        return this;
    }

}
