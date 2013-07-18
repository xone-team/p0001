package com.fzy.webtools;

import org.apache.commons.lang.StringEscapeUtils;

public class StringUtils extends org.apache.commons.lang.StringUtils {

	public static String toUnicode(final String src) {
		char[] utfBytes = src.toCharArray();
		String unicodeBytes = "";
		for (int byteIndex = 0; byteIndex < utfBytes.length; byteIndex++) {
			String hexB = Integer.toHexString(utfBytes[byteIndex]);
			if (hexB.length() <= 2) {
				hexB = "00" + hexB;
			}
			unicodeBytes = unicodeBytes + "\\u" + hexB.toUpperCase();
		}
		return unicodeBytes;
	}

	public static String camel2underline(String src) {
		String result = "";
		for (int i = 0; i < src.length(); i++) {
			char c = src.charAt(i);
			if (Character.isUpperCase(c) && i > 0)
				result += "_" + c;
			else
				result += c;
		}
		return result.toLowerCase();
	}

	public static String camel2hyphen(String src) {
		String result = "";
		for (int i = 0; i < src.length(); i++) {
			char c = src.charAt(i);
			if (Character.isUpperCase(c) && i > 0)
				result += "-" + c;
			else
				result += c;
		}
		return result.toLowerCase();
	}
	
	public static String escapeAssicXml(String value){
		if(value == null) return null;
		String result = "";
        for (int i = 0; i < value.length(); i++) {
            String temp = value.substring(i, i + 1);
            if (StringUtils.isAssic(temp)) {
                result += StringEscapeUtils.escapeXml(temp);
            } else {
            	result += temp;
            }
        }
		return result;
	}
	
	public static String underline2camel(String src) {
		String result = "";
		if(StringUtils.isBlank(src)) return "";
		else	src = src.trim().toLowerCase();
		
		boolean isNextUpper = false;
		for (int i = 0; i < src.length(); i++) {
			char c = src.charAt(i);
//			if(i == 0 && Character.isLetter(c)){
//				result += Character.toUpperCase(c);
//				continue;
//			}
			if(c == '_'){
				isNextUpper = true;
				continue;
			}
			if(isNextUpper && Character.isLetter(c)){
				result += Character.toUpperCase(c);
				isNextUpper = false;
				continue;
			}
			result += c;
		}
		return result;
	}
    
    public static boolean isAssic(String src){
    	return src == null ? false : src.matches("[\u0000-\u00ff]+");
    }
	
    public static String defaultString(Object str) {
        return str == null ? EMPTY : str.toString();
    }

    public static String defaultString(Object str, String defaultStr) {
        return str == null ? defaultStr : str.toString();
    }

    public static String defaultIfEmpty(Object str, String defaultStr) {
        return StringUtils.isEmpty(defaultString(str)) ? defaultStr : str.toString();
    }

	public static String unescape(String src) {
		if (src == null)
			return null;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(
							src.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(
							src.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}


	public static boolean hasText(CharSequence str) {
		if (!hasLength(str)) {
			return false;
		}
		int strLen = str.length();
		for (int i = 0; i < strLen; i++) {
			if (!Character.isWhitespace(str.charAt(i))) {
				return true;
			}
		}
		return false;
	}

	public static boolean hasLength(CharSequence str) {
		return (str != null && str.length() > 0);
	}
	
	/**
	 * <p>
	 * Check if a String starts with a specified prefix.
	 * </p>
	 * 
	 * <p>
	 * <code>null</code>s are handled without exceptions. Two <code>null</code>
	 * references are considered to be equal. The comparison is case sensitive.
	 * </p>
	 * 
	 * <pre>
	 *  StringUtils.startsWith(null, null)      = true
	 *  StringUtils.startsWith(null, &quot;abc&quot;)     = false
	 *  StringUtils.startsWith(&quot;abcdef&quot;, null)  = false
	 *  StringUtils.startsWith(&quot;abcdef&quot;, &quot;abc&quot;) = true
	 *  StringUtils.startsWith(&quot;ABCDEF&quot;, &quot;abc&quot;) = false
	 * </pre>
	 * 
	 * @see java.lang.String#startsWith(String)
	 * @param str
	 *            the String to check, may be null
	 * @param prefix
	 *            the prefix to find, may be null
	 * @return <code>true</code> if the String starts with the prefix, case
	 *         sensitive, or both <code>null</code>
	 * @since 2.4
	 */
	public static boolean startsWith(String str, String prefix) {
		return startsWith(str, prefix, false);
	}

	/**
	 * <p>
	 * Case insensitive check if a String starts with a specified prefix.
	 * </p>
	 * 
	 * <p>
	 * <code>null</code>s are handled without exceptions. Two <code>null</code>
	 * references are considered to be equal. The comparison is case
	 * insensitive.
	 * </p>
	 * 
	 * <pre>
	 *  StringUtils.startsWithIgnoreCase(null, null)      = true
	 *  StringUtils.startsWithIgnoreCase(null, &quot;abc&quot;)     = false
	 *  StringUtils.startsWithIgnoreCase(&quot;abcdef&quot;, null)  = false
	 *  StringUtils.startsWithIgnoreCase(&quot;abcdef&quot;, &quot;abc&quot;) = true
	 *  StringUtils.startsWithIgnoreCase(&quot;ABCDEF&quot;, &quot;abc&quot;) = true
	 * </pre>
	 * 
	 * @see java.lang.String#startsWith(String)
	 * @param str
	 *            the String to check, may be null
	 * @param prefix
	 *            the prefix to find, may be null
	 * @return <code>true</code> if the String starts with the prefix, case
	 *         insensitive, or both <code>null</code>
	 * @since 2.4
	 */
	public static boolean startsWithIgnoreCase(String str, String prefix) {
		return startsWith(str, prefix, true);
	}

	/**
	 * <p>
	 * Check if a String starts with a specified prefix (optionally case
	 * insensitive).
	 * </p>
	 * 
	 * @see java.lang.String#startsWith(String)
	 * @param str
	 *            the String to check, may be null
	 * @param prefix
	 *            the prefix to find, may be null
	 * @param ignoreCase
	 *            inidicates whether the compare should ignore case (case
	 *            insensitive) or not.
	 * @return <code>true</code> if the String starts with the prefix or both
	 *         <code>null</code>
	 */
	public static boolean startsWith(String str, String prefix,
			boolean ignoreCase) {
		if (str == null || prefix == null) {
			return (str == null && prefix == null);
		}
		if (prefix.length() > str.length()) {
			return false;
		}
		return str.regionMatches(ignoreCase, 0, prefix, 0, prefix.length());
	}

    // endsWith
    //-----------------------------------------------------------------------

    /**
     * <p>Check if a String ends with a specified suffix.</p>
     *
     * <p><code>null</code>s are handled without exceptions. Two <code>null</code>
     * references are considered to be equal. The comparison is case sensitive.</p>
     *
     * <pre>
     * StringUtils.endsWith(null, null)      = true
     * StringUtils.endsWith(null, "def")     = false
     * StringUtils.endsWith("abcdef", null)  = false
     * StringUtils.endsWith("abcdef", "def") = true
     * StringUtils.endsWith("ABCDEF", "def") = false
     * StringUtils.endsWith("ABCDEF", "cde") = false
     * </pre>
     *
     * @see java.lang.String#endsWith(String)
     * @param str  the String to check, may be null
     * @param suffix the suffix to find, may be null
     * @return <code>true</code> if the String ends with the suffix, case sensitive, or
     *  both <code>null</code>
     * @since 2.4
     */
    public static boolean endsWith(String str, String suffix) {
        return endsWith(str, suffix, false);
    }

    /**
     * <p>Case insensitive check if a String ends with a specified suffix.</p>
     *
     * <p><code>null</code>s are handled without exceptions. Two <code>null</code>
     * references are considered to be equal. The comparison is case insensitive.</p>
     *
     * <pre>
     * StringUtils.endsWithIgnoreCase(null, null)      = true
     * StringUtils.endsWithIgnoreCase(null, "def")     = false
     * StringUtils.endsWithIgnoreCase("abcdef", null)  = false
     * StringUtils.endsWithIgnoreCase("abcdef", "def") = true
     * StringUtils.endsWithIgnoreCase("ABCDEF", "def") = true
     * StringUtils.endsWithIgnoreCase("ABCDEF", "cde") = false
     * </pre>
     *
     * @see java.lang.String#endsWith(String)
     * @param str  the String to check, may be null
     * @param suffix the suffix to find, may be null
     * @return <code>true</code> if the String ends with the suffix, case insensitive, or
     *  both <code>null</code>
     * @since 2.4
     */
    public static boolean endsWithIgnoreCase(String str, String suffix) {
        return endsWith(str, suffix, true);
    }

    /**
     * <p>Check if a String ends with a specified suffix (optionally case insensitive).</p>
     *
     * @see java.lang.String#endsWith(String)
     * @param str  the String to check, may be null
     * @param suffix the suffix to find, may be null
     * @param ignoreCase inidicates whether the compare should ignore case
     *  (case insensitive) or not.
     * @return <code>true</code> if the String starts with the prefix or
     *  both <code>null</code>
     */
    private static boolean endsWith(String str, String suffix, boolean ignoreCase) {
        if (str == null || suffix == null) {
            return (str == null && suffix == null);
        }
        if (suffix.length() > str.length()) {
            return false;
        }
        int strOffset = str.length() - suffix.length();
        return str.regionMatches(ignoreCase, strOffset, suffix, 0, suffix.length());
    }
}
