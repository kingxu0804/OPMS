package com.opms.unti;

import java.util.HashMap;
import java.util.Map;

public class SelectOption {
	public String getValue(int i)
	{
		Map<Integer,String> map=new HashMap<Integer,String>();
		map.put(1, "企业文化");
		map.put(2, "管理知识");
		map.put(3, "财务知识");
		map.put(4, "技术分享");
		map.put(5, "服务器");
		map.put(6, "市场销售");
		map.put(7, "运营");
		map.put(8, "销售");
		String  value=map.get(i);
		return value;
	}

}
