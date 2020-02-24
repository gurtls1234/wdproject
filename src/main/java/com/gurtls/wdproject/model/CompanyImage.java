package com.gurtls.wdproject.model;

import java.util.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(of= {"sn"})
public class CompanyImage implements Comparable<CompanyImage>{
	private long sn;
	private long wdSn;
	private int order;
	private String path;
	private Date createdAt;
	private Date updatedAt;
	
//	@Override
//	public boolean equals(Object other) {
//		WdImage me = this;
//		
//		if(me == other) {
//			return true;
//		}
//		
//		if(!(other instanceof WdImage)) {
//			return false;
//		}
//		
//		WdImage otherImage = (WdImage)other;
//		
////		if(me.sn == otherImage.sn) {
////			return true;
////		}
////		
////		return false;
//		
//		return me.sn == otherImage.sn;
//	}
	
	@Override
	public int compareTo(CompanyImage o) {
		if(o == this || o.getSn() == getSn()) {
			return 0;
		}
		
		if(getWdSn() != o.getWdSn()) {
			return (int)(getSn() - o.getWdSn());
		}
		
		if(getOrder() != o.getOrder()) {
			return getOrder() - o.getOrder();
			//return Comparator.comparingInt(WdImage::getOrder).compare(this, o);
		} 
		
		return (int)(getSn() - o.getSn());
	}
}