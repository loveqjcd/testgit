package main.java.common.util.cache;

import java.util.Comparator;

/**
 * LRU(Least Recently Used) Cache.
 */

public class LRUCache<K, V> extends AbstractCache<K, V> implements Cache<K, V>
{
	private final Comparator<Entry<V>> LRU = new Comparator<Entry<V>>()
	{
		public int compare(Entry<V> a, Entry<V> b)
		{
			return (Math.abs(a.lastTouch - b.lastTouch) < 100) ? (int) (b.touchs - a.touchs) : (int) (b.lastTouch - a.lastTouch);
		}
	};

	public LRUCache()
	{
		super();
	}

	public LRUCache(int capacity)
	{
		super(capacity);
	}

	protected Comparator<Entry<V>> getComparator()
	{
		return LRU;
	}
}
