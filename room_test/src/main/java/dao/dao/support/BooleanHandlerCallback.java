package main.java.dao.dao.support;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * BooleanHandlerCallback
 * 
 * 
 * @since 2013-3-25 下午9:34:34
 */
public class BooleanHandlerCallback implements TypeHandlerCallback {

    public void setParameter(ParameterSetter setter, Object value) throws SQLException {
        setter.setString(saveValueToDb((Boolean) value));
    }

    public Object getResult(ResultGetter getter) throws SQLException {
        if (getter.getObject() == null) {
            return null;
        }

        return convertDbToValue(getter.getString());
    }

    public Object valueOf(String s) {
        return convertDbToValue(s);
    }

    /**
     * 将POJO中的值转换数据库值存储
     * 
     * @param value
     * @return
     */
    private String saveValueToDb(Boolean value) {
        if (value != null && value) {
            return "Y";
        }
        //else if (value == null || !value) {
        return "N";
        //        } else {
        //            throw new IllegalArgumentException("incorrect param " + value);
        //        }
    }

    /**
     * 将数据库的值转换为POJO所需要的值
     * 
     * @param value
     * @return
     */
    private Boolean convertDbToValue(String value) {
        if ("Y".equalsIgnoreCase(value)) {
            return new Boolean(true);
        } else {
            return new Boolean(false);
        }
    }
}
