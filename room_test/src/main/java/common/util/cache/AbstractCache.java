package main.java.common.util.cache;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * AbstractCache
 * 
 * 
 * @since 2013-3-21 下午10:00:03
 * @param <K>
 * @param <V>
 */
abstract class AbstractCache<K, V> implements Cache<K, V>
{
	private static final int DEFAULT_CAPACITY = 128;

	private static final long DEFAULT_CHECK_INTERVAL = 10 * 1000;

	private boolean mChanged = false;

	private int mCapacity, mMaxCapacity;

	private Map<K, Entry<V>> mCache;

	private List<Entry<V>> mAvailable = new ArrayList<Entry<V>>();

	private final Lock mLock = new ReentrantLock();

	public AbstractCache()
	{
		this(DEFAULT_CAPACITY);
	}

	public AbstractCache(int capacity)
	{
		this(capacity, (int) (capacity * 1.5));
	}

	public AbstractCache(int capacity, int maxCapacity)
	{
		if (capacity <= 0)
			throw new IllegalArgumentException("capacity <= 0");

		if (capacity >= maxCapacity)
			throw new IllegalArgumentException("capacity >= maxCapacity");

		mCapacity = capacity;
		mMaxCapacity = maxCapacity;
		mCache = new HashMap<K, Entry<V>>(capacity);

		Thread th = new Thread("CacheScanThread")
		{
			public void run()
			{
				while (true)
				{
					try
					{
						Thread.sleep(DEFAULT_CHECK_INTERVAL);
					} catch (InterruptedException e)
					{
					}
					int x = mAvailable.size() - mCapacity;
					if (x > 0)
					{
						try
						{
							mLock.lock();
							removeEldestEntry(x);
						} finally
						{
							mLock.unlock();
						}
					}
				}
			}
		};
		th.setDaemon(true);
		th.start();
	}

	public V get(K key)
	{
		if (key == null)
			throw new NullPointerException("Key is null.");

		try
		{
			mLock.lock();
			Entry<V> entry = mCache.get(key);
			if (entry != null)
			{
				if (entry.expire < 0 || entry.expire > System.currentTimeMillis())
				{
					mChanged = true;
					entry.touch();
					return entry.value;
				}
				remove(key);
			}
			return null;
		} finally
		{
			mLock.unlock();
		}
	}

	public void put(K key, V value)
	{
		put(key, value, -1);
	}

	public void put(K key, V value, long timeout)
	{
		if (key == null)
			throw new NullPointerException("Key is null.");
		if (timeout == 0)
			return;

		long expire = timeout > 0 ? System.currentTimeMillis() + timeout : -1;
		try
		{
			mLock.lock();
			if (mAvailable.size() == mMaxCapacity)
				removeEldestEntry(1);

			mCache.put(key, newEntry(value, expire));
		} finally
		{
			mLock.unlock();
		}
	}

	public void put(K keys[], V value)
	{
		put(keys, value, -1);
	}

	public void put(K keys[], V value, long timeout)
	{
		if (timeout == 0)
			return;

		long expire = timeout > 0 ? System.currentTimeMillis() + timeout : -1;
		try
		{
			mLock.lock();
			int l = keys.length, x = (mAvailable.size() + l) - mMaxCapacity;
			if (x > 0)
				removeEldestEntry(x);

			for (int i = 0; i < l; i++)
				mCache.put(keys[i], newEntry(value, expire));
		} finally
		{
			mLock.unlock();
		}
	}

	public void remove(K key)
	{
		try
		{
			mLock.lock();
			mCache.remove(key).expire = 0;
		} finally
		{
			mLock.unlock();
		}
	}

	public void clear()
	{
		try
		{
			mLock.lock();
			mCache.clear();
			mAvailable.clear();
		} finally
		{
			mLock.unlock();
		}
	}

	protected Entry<V> newEntry(V value, long expire)
	{
		Entry<V> entry = new Entry<V>(value, expire);
		entry.touch();
		mAvailable.add(entry);
		return entry;
	}

	abstract protected Comparator<Entry<V>> getComparator();

	private void removeEldestEntry(int x)
	{
		if (mAvailable.isEmpty())
			return;

		if (mChanged)
			Collections.sort(mAvailable, getComparator());

		Entry<V> entry;
		int len = mAvailable.size() - 1;
		for (int i = 0; i < x; i++)
		{
			while (true)
			{
				entry = mAvailable.remove(len--);
				if (entry.expire != 0)
				{
					entry.expire = 0;
					break;
				}
				if (len < 0)
					return;
			}
		}
	}

	static class Entry<V>
	{
		Entry(V v, long e)
		{
			value = v;
			expire = e;
		}

		V value;
		long expire, touchs, lastTouch;

		void touch()
		{
			touchs++;
			lastTouch = System.currentTimeMillis();
		}
	}
}
