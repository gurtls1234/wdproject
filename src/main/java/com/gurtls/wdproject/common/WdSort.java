package com.gurtls.wdproject.common;

public enum WdSort {
	latest("최신순"),
	popularity("인기순");
	
	private String nameKo;
	
	private WdSort(String nameKo) {
		this.nameKo = nameKo;
	}
	
	public String getNameKo() {
		return nameKo;
	}
	
	public static boolean contains(String name) {
		for(WdSort sort : values())
			if(sort.name().equals(name))
				return true;
		return false;
	}
}
