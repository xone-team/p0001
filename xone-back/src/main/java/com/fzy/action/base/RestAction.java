package com.fzy.action.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface RestAction {
	public Object execute(HttpServletRequest request, HttpServletResponse response);
}
