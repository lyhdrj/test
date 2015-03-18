package me.kafeitu.demo.activiti.dao;

import me.kafeitu.demo.activiti.entity.oa.Leave;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

/**
 * 请假实体管理接口
 *
 * @author HenryYan
 */
@org.springframework.stereotype.Repository
public interface LeaveDao extends Repository<Leave, Long>,LeaveInterface {
	@Query("select a from Leave a where a.id=?1")
	public Leave findByLeaveId(Long id);//使用Query注解
	
	public Leave readById(Long id);//通过解析方法名创建查询	
	
	@Query("from Leave a where a.userId = :uid and a.leaveType= :ltype") 
	public Leave fUserIdAndLeaveType(@Param("uid")String userid,@Param("ltype")String  leaveType);
	
	
	
	
	public Page<Leave> findAll(Pageable pageable);
}
