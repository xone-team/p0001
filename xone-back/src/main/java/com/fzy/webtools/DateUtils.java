package com.fzy.webtools;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DateUtils extends org.apache.commons.lang.time.DateUtils {
	private static final Log log = LogFactory.getLog(DateUtils.class);
	public static final String PATTERN_SHOW = "yyyy-MM-dd";

	public static final String PATTERN_LONG = "yyyyMMddHHmmss";
	public static final String PATTERN_SHOW_LONG = "yyyy-MM-dd HH:mm:ss";

	public static final String PATTERN_DAY = "yyyyMMdd";
	
	
	/**取当前日期字符串, 长格式
	 * @param pattern
	 * @return
	 */
	public static String getDateLongPattern() {
		return getDateString(PATTERN_LONG, -1, 0);
	}
	
	/**取当前日期字符串
	 * @param pattern
	 * @return
	 */
	public static String getDateString(String pattern) {
		return getDateString(pattern, -1, 0);
	}

	/**取日期字符串
	 * @param pattern
	 * @param dateType {Calendar.YEAR, Calendar.MONTH, Calendar.WEEK_OF_YEAR, Calendar.DAY_OF_MONTH, Calendar.HOUR_OF_DAY, Calendar.MINUTE, Calendar.SECOND, Calendar.MILLISECOND}
	 * @param offset
	 * @return
	 */
	public static String getDateString(String pattern, int dateType, int offset) {
		Calendar c = Calendar.getInstance();
		if (dateType > 0 && offset != 0)
			c.add(dateType, offset);
		return format(c.getTime(), pattern);
	}

	/**转换日期条件的上限， src 为 yyyy-MM-dd 格式
	 * @param src
	 * @return
	 */
	public static Date parseConditionEndDate(String src) {
		Date result = null;
		if(src == null) return result;
		Date d = parseDateSafely(src, PATTERN_SHOW);
		if (d != null) {
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			c.add(Calendar.DATE, 1);
			result = c.getTime();
		}
		return result;
	}
	
	/**转换日期条件的上限， src 为 yyyy-MM-dd 格式， 转成 yyyyMMddhhmmss 格式
	 * @param src
	 * @return
	 */
	public static String parseConditionEndDateToString(String src) {
		String result = null;
		if(StringUtils.isBlank(src)) return result;
		Date d = parseConditionEndDate(src);
		if (d != null)
			result = format(d, PATTERN_LONG);
		return result;
	}
	
	public static Date parseDate(String src, String pattern) throws ParseException{
		return parseDate(src, new String[]{pattern});
	}

	/**将日期字符串 src 从 srcPattern 格式转成 targetPattern 格式
	 * @param src
	 * @param srcPattern
	 * @param targetPattern
	 * @return
	 */
	public static String parseDateSafely(String src, String srcPattern, String targetPattern) {
		String result = null;
		if(StringUtils.isBlank(src)) return result;
		try {
			result = parseDate(src, srcPattern, targetPattern);
		} catch (Exception e) {
			log.debug("src:["+src+"]");
			log.debug("srcPattern:["+srcPattern+"]");
			log.debug("targetPattern:["+targetPattern+"]");
			log.debug(e.getMessage(),e);
		}
		return result;
	}

	
	public static String parseDate(String src, String srcPattern, String targetPattern) throws ParseException {
		String result = null;
		if(StringUtils.isBlank(src)) return result;
		Date d = parseDate(src, srcPattern);
		if (d != null)
			result = format(d, targetPattern);
		return result;
	}
	
	public static Date parseDateSafely(String src, String pattern){
		Date result = null;
		if(StringUtils.isBlank(src)) return result;
		try {
			result = parseDate(src, pattern);
		} catch (ParseException e) {
			log.debug("src:["+src+"]");
			log.debug("pattern:["+pattern+"]");
			log.debug(e.getMessage(),e);
		}
		return result;
	}
	
	public static String formatSafely(Date date, String pattern){
		String result = null;
		try {
			result = format(date, pattern);
		} catch (Exception e) {
			log.debug("date:["+date+"]");
			log.debug("pattern:["+pattern+"]");
			log.debug(e.getMessage(),e);
		}
		return result;
	}
	
	public static String format(Date date, String pattern){
		return DateFormatUtils.format(date, pattern);
	}
	
	
}
