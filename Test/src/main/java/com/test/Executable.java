package com.test;
public interface Executable {
	
	/**
	 * 在回调机制中被调用方执行这个方法, 如果没有返回值返回<code>null</code>
	 * @return 执行结果, 可能是<code>null</code>
	 */
	Object execute();
	void invoke();
}
