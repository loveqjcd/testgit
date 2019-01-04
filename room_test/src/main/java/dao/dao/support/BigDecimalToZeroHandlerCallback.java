package main.java.dao.dao.support;

import java.math.BigDecimal;
import java.sql.SQLException;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * BigDecimalToZeroHandlerCallback
 * 
 * 
 * @since 2013-3-25 下午9:34:40
 */
public class BigDecimalToZeroHandlerCallback implements TypeHandlerCallback {

    public void setParameter(ParameterSetter setter, Object value) throws SQLException {
        setter.setString(saveValueToDb((BigDecimal) value));
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
    private String saveValueToDb(BigDecimal value) {
        if (value != null) {
            return value.toString();
        }
        //else if (value == null || !value) {
        return BigDecimal.ZERO.toString();
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
    private BigDecimal convertDbToValue(String value) {
        if (value != null && value != "") {
            return new BigDecimal(value);
        } else {
            return BigDecimal.ZERO;
        }
    }
}
