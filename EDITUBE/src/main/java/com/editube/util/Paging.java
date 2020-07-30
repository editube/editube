package com.editube.util;

public class Paging {
	private int maxNum;
	private int pageNum;
	private int listCount;
	private int pageCount;
	private String listName;
	
	public Paging(int maxNumm,int pageNum, 
			int listCount, int pageCount,
			String listName) {
		this.maxNum=pageNum;
		this.pageNum=pageNum;
		this.listCount= listCount;
		this.pageCount=pageCount;
		this.listName = listName;
	}
	
	public String makePaging() {
		int totalPage =(maxNum % listCount>0)?
				maxNum/listCount+1:
					maxNum/listCount;
		int currentGroup = (pageNum % pageCount > 0)?
				pageNum/pageCount+1:
					pageNum/pageCount;
		
		int start = (currentGroup*pageCount)-(pageCount-1);
		int end = (currentGroup*pageCount >= totalPage)?
				totalPage:currentGroup*pageCount;
		
		StringBuffer sb = new StringBuffer();
		if(start != 1) {
			sb.append("<a class = 'pno' href=' "+ listName+
					"?pageNum"+(start-1)+"'>");
			sb.append("&nbsp;이전&nbsp;");
			sb.append("</a>");
		}
		
		for(int i=start; i <=end; i++) {
			if(pageNum != 1) {
				sb.append("<a class = 'pno' href=' "+ listName+
						"?pageNum"+i+"'>");
				sb.append("&nbsp;"+i+"&nbsp;");
			}
			else {
				sb.append("<font class = 'pno' style='color:red;'>");
				sb.append("&nbsp;"+i+"&nbsp;</font>");
			}
		}
			if(end != totalPage) {
				sb.append("<a class = 'pno' href=' "+ listName+"?pageNum"+(end+1)+"'>");
				sb.append("&nbsp;다음&nbsp;");
				sb.append("</a>");
			}
		return sb.toString();		
	}
	
}
