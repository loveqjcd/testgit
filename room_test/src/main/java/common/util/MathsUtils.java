package main.java.common.util;

import java.math.BigDecimal;

/**
 * MathsUtils
 * 
 * 
 * @since 2013-4-28 下午9:30:28
 */
public class MathsUtils
{
	public static BigDecimal zeroDecimal = new BigDecimal(0);

	/**
	 * 将字符串转换成BigDecimal对象。<br/>
	 * 可以防止空空指针。当value为<code>null</code>或""时，返回<code>null</code>。
	 * 
	 * @param value
	 * @return
	 */
	public static BigDecimal getDecimalValue(String value)
	{
		return (value == null || value == "") ? null : new BigDecimal(value);
	}

	/** 减去第二个，加上第三个 */
	public static BigDecimal sub2Add3(BigDecimal b1, BigDecimal b2, BigDecimal b3)
	{
		return add(subtract(b1, b2), b3);
	}

	/** b1 - b2 */
	public static BigDecimal subtract(BigDecimal b1, BigDecimal b2)
	{
		if (b1 == null)
		{
			if (b2 == null)
			{
				return null;
			} else
			{
				return zeroDecimal.subtract(b2);
			}
		} else
		{
			if (b2 == null)
			{
				return b1;
			} else
			{
				return b1.subtract(b2);
			}
		}
	}

	public static Integer subtract(Integer b1, Integer b2)
	{
		if (b1 == null)
		{
			if (b2 == null)
			{
				return null;
			} else
			{
				return 0 - b2.intValue();
			}
		} else
		{
			if (b2 == null)
			{
				return b1;
			} else
			{
				return b1.intValue() - b2.intValue();
			}
		}
	}

	public static BigDecimal add(BigDecimal b1, BigDecimal b2)
	{
		if (b1 == null)
		{
			return b2;
		} else if (b2 == null)
		{
			return b1;
		} else
		{
			return b1.add(b2);
		}
	}

	public static Integer add(Integer b1, Integer b2)
	{
		if (b1 == null)
		{
			return b2;
		} else if (b2 == null)
		{
			return b1;
		}

		return b1.intValue() + b2.intValue();
	}

	public static Long add(Long b1, Long b2)
	{
		if (b1 == null)
		{
			return b2;
		} else if (b2 == null)
		{
			return b1;
		}

		return b1.longValue() + b2.longValue();
	}

	public static BigDecimal div(BigDecimal b1, Integer b2)
	{
		if (b1 == null || b2 == null || b2.intValue() == 0)
		{
			return null;
		}

		return b1.divide(new BigDecimal(b2), 4, BigDecimal.ROUND_CEILING);
	}

	public static BigDecimal div(BigDecimal b1, Long b2)
	{
		if (b1 == null || b2 == null)
		{
			return null;
		}

		return b1.divide(new BigDecimal(b2), 4, BigDecimal.ROUND_CEILING);
	}

	public static BigDecimal div(Integer b1, Integer b2)
	{
		if (b1 == null || b2 == null || b2.intValue() == 0)
		{
			return null;
		}

		return new BigDecimal(b1.intValue() * 1.0 / b2.intValue());
	}

	public static BigDecimal div(BigDecimal b1, BigDecimal b2)
	{
		if (b1 == null || b2 == null || b2.intValue() == 0)
		{
			return null;
		}

		return b1.divide(b2, 4, BigDecimal.ROUND_CEILING);
	}
}
