package com.fzy.webtools;

import java.util.Iterator;
import java.util.List;

public class CollectionUtils extends
		org.apache.commons.collections.CollectionUtils {
	
	public static final String DEFAULT_LIST_DELIMIT = ", ";
	
	public static String join(List list) {
		return join(list, null);
	}

	public static String join(List list, String delimit) {
		String result = "";
		if (list == null || list.size() < 1)
			return result;
		if (delimit == null)
			delimit = DEFAULT_LIST_DELIMIT;
		for (Iterator iterator = list.iterator();;) {
			Object object = (Object) iterator.next();
			result += (object == null ? "" : object.toString());
			if (iterator.hasNext()) {
				result += delimit;
			} else {
				return result;
			}
		}
	}
}
