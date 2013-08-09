package com.xone.model.hibernate.entity;

public abstract class MyModel {
	
	public final String UNKNOWN_STATUS_NAME = "未知";
	/**
	 * 删除标志
	 */
	public enum FlagDeleted {
		NORMAL("0", "正常"), DELETED("1", "删除");
		protected String value = "0";
		protected String name = "";
		private FlagDeleted(String value, String name) {
			this.value = value;
		}
		public String getValue() {
			return this.value;
		}
		public String getName() {
			return this.name;
		}
	}
	
}
