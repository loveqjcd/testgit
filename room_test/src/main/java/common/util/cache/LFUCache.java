package main.java.common.util.cache;

import java.util.Comparator;

/**
 * LFU Cache.
 */

public class LFUCache<K, V> extends AbstractCache<K, V> implements Cache<K, V>
{
	private final Comparator<Entry<V>> LFU = new Comparator<Entry<V>>()
	{
		public int compare(Entry<V> a, Entry<V> b)
		{
			return a.touchs == b.touchs ? (int) (b.lastTouch - a.lastTouch) : (int) (b.touchs - a.touchs);
		}
	};

	public LFUCache()
	{
		super();
	}

	public LFUCache(int capacity)
	{
		super(capacity);
	}

	protected Comparator<Entry<V>> getComparator()
	{
		return LFU;
	}
}
