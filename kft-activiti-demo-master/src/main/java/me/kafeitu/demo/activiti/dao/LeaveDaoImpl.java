package me.kafeitu.demo.activiti.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import me.kafeitu.demo.activiti.entity.oa.Leave;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly = true)
public class LeaveDaoImpl implements LeaveInterface {
	@PersistenceContext
	private EntityManager em;
    
	
	@Transactional(readOnly = false)
	public void save(Leave entity) {
		if(entity.getId() ==null)
		 em.persist(entity);
		else
		 em.merge(entity);
		System.out.println(entity.getReason()+"save");
		//return entity;
	}
	
	@SuppressWarnings("unchecked")
	public Page<Leave> queryCriteria(final Leave entity){
		List<Leave> list=new ArrayList<Leave>();
		CriteriaBuilder cb=em.getCriteriaBuilder();
		CriteriaQuery<Leave> cq=cb.createQuery(Leave.class);
		Root<Leave> root=cq.from(Leave.class);
		Path<String> p_u=root.get("userId");
		Path<String> p_t=root.get("leaveType");
		Path<String> p_r=root.get("reason");
		Predicate p = cb.equal(p_u , entity.getUserId());	
		 p=cb.and(p,cb.or(cb.equal(p_t , entity.getLeaveType()),cb.like(p_r, "no%",'\\')));
		Query q=em.createQuery(cq.where(p));
		q.setFirstResult(0);
		q.setMaxResults(15);
		list=q.getResultList();
			
		/*Specification<Leave> spec=new Specification<Leave>(){
			public Predicate toPredicate(Root<Leave> root,
					CriteriaQuery<?> cq, CriteriaBuilder cb) {
				Path<String> p_u=root.get("userId");
				Path<String> p_t=root.get("leaveType");
				Path<String> p_r=root.get("reason");
				Predicate p = cb.and(cb.equal(p_u , entity.getUserId()),cb.equal(p_t , entity.getLeaveType()));	
				 p=cb.and(cb.or(p,cb.equal(p_r, "no")));
			     cq.where(p);
				
				return cq.getRestriction();
			}
			
		};*/
		
		//Query q=em.createQuery(cq.where(spec.toPredicate(root, cq, cb)));
		Page<Leave> page =new PageImpl<Leave>(list,new PageRequest(0,15),3);
		//list=q.getResultList();
		
		return page;
		
		
		
	}

	@Override
	public void delete(Leave entity) {
		
		System.out.println(entity.getReason()+"delete");

	}
}
