package main.java.common.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IdUtil {

	public static String getIds(List<?> list) {
		StringBuffer sb = new StringBuffer();
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				try {
					// 获取对象中名为"id"元素
					Field field = obj.getClass().getDeclaredField("id");
					// 判断该对象是否可以访问
					if (!field.isAccessible()) {
						// 设置为可访问
						field.setAccessible(true);
					}
					if(sb.length() == 0) {
						sb.append(field.get(obj));
					}else {
						sb.append(",").append(field.get(obj));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}
	
	//根据参数字段名称获取
	public static String getIds(List<?> list, String name) {
		StringBuffer sb = new StringBuffer();
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				try {
					// 获取对象中名为"id"元素
					Field field = obj.getClass().getDeclaredField(name);
					// 判断该对象是否可以访问
					if (!field.isAccessible()) {
						// 设置为可访问
						field.setAccessible(true);
					}
					if(sb.length() == 0) {
						sb.append(field.get(obj));
					}else {
						sb.append(",").append(field.get(obj));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}
	
	public static <K, V> Map<K, V> list2Map2(List<V> list, String fieldName4Key, Class<V> c) {
		Map<K, V> map = new HashMap<K, V>();
		if (list != null) {
			try {
				PropertyDescriptor propDesc = new PropertyDescriptor(fieldName4Key, c);
				Method methodGetKey = propDesc.getReadMethod();
				for (int i = 0; i < list.size(); i++) {
					V value = list.get(i);
					@SuppressWarnings("unchecked")
					K key = (K) methodGetKey.invoke(list.get(i));
					map.put(key, value);
				}
			} catch (Exception e) {
				throw new IllegalArgumentException("field can't match the key!");
			}
		}
		return map;
	}
	
	public static <K, V> Map<K, V> list2Map3(List<V> list, String keyMethodName, Class<V> c) {  
        Map<K, V> map = new HashMap<K, V>();  
        if (list != null) {  
            try {  
                Method methodGetKey = c.getMethod(keyMethodName);  
                for (int i = 0; i < list.size(); i++) {  
                    V value = list.get(i);  
                    @SuppressWarnings("unchecked")  
                    K key = (K) methodGetKey.invoke(list.get(i));  
                    map.put(key, value);  
                }  
            } catch (Exception e) {  
                throw new IllegalArgumentException("field can't match the key!");  
            }  
        }  
        return map;  
    }  
	
	public static void main(String[] args) {
//		AdvertDo advertDo = new AdvertDo();
//		advertDo.setId(1l);
//		List<AdvertDo> list = new ArrayList<AdvertDo>();
//		list.add(advertDo);
//		advertDo = new AdvertDo();
//		advertDo.setId(3l);
//		list.add(advertDo);
//		System.out.println(getIds(list));
	}

}
