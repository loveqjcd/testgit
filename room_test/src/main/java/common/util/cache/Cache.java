package main.java.common.util.cache;

/**
 * Cache
 */

public interface Cache<K, V> {
    /**
     * get.
     * 
     * @param key key.
     * @return instance or null.
     */
    V get(K key);

    /**
     * put.
     * 
     * @param key key.
     * @param value value.
     */
    void put(K key, V value);

    /**
     * put.
     * 
     * @param key key.
     * @param value value.
     * @param timeout timeout.
     */
    void put(K key, V value, long timeout);

    /**
     * put.
     * 
     * @param keys key array.
     * @param value value.
     */
    void put(K keys[], V value);

    /**
     * put.
     * 
     * @param keys key array.
     * @param value value.
     * @param timeout timeout.
     */
    void put(K keys[], V value, long timeout);

    /**
     * remove.
     * 
     * @param key key.
     */
    void remove(K key);

    /**
     * clear cache.
     */
    void clear();
}
