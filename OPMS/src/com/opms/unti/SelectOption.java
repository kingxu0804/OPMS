package com.opms.unti;

import java.util.HashMap;
import java.util.Map;

public class SelectOption {
	public String getValue(int i)
	{
		Map<Integer,String> map=new HashMap<Integer,String>();
		map.put(1, "��ҵ�Ļ�");
		map.put(2, "����֪ʶ");
		map.put(3, "����֪ʶ");
		map.put(4, "��������");
		map.put(5, "������");
		map.put(6, "�г�����");
		map.put(7, "��Ӫ");
		map.put(8, "����");
		String  value=map.get(i);
		return value;
	}

}
