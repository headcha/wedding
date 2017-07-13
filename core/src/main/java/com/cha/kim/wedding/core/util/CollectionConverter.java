package com.cha.kim.wedding.core.util;

import java.util.ArrayList;
import java.util.List;


public class CollectionConverter<T, K> {
	private static CollectionConverter instance;

	private CollectionConverter(){}

	public static CollectionConverter getInstance() {
		if (instance == null)
			instance = new CollectionConverter();

		return instance;
	}

	public List<K> convert(List<T> originalList, Class<K> targetType, String methodName) {
		try {
			List<K> convertList = new ArrayList<>();
			for (T originalInstance : originalList)
				convertList.add((K) targetType.getMethod(methodName, originalInstance.getClass()).invoke(targetType.newInstance(), originalInstance));
			return convertList;
		} catch (Exception ex) {
			throw new RuntimeException("method invoke Exception", ex);
		}
	}
}
