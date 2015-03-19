package me.kafeitu.demo.activiti.dao;

import me.kafeitu.demo.activiti.entity.oa.Leave;

import org.springframework.data.domain.Page;

public interface LeaveInterface {
	public void delete(Leave entity);
	public void save(Leave entity);
	public Page<Leave> queryCriteria(Leave entity);//criteria query
}
