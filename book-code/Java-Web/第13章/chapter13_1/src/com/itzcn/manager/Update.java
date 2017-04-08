package com.itzcn.manager;

import org.hibernate.Session;

import com.itzcn.dao.Student;
import com.itzcn.hibernatesession.HibernateSessionFactory;

public class Update {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Session session = null;//声明Session对象
		try{
			session = HibernateSessionFactory.getSession();//获取Session
			session.beginTransaction();//开启事务
			Student student = new Student();//实例化Student对象
			student.setId(2);
			student.setName("admin888");
			student.setPass("888888");
			session.update(student);//更新Student对象
			session.getTransaction().commit();//提交事务
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();//出错将回滚事务
		}finally{
			HibernateSessionFactory.closeSession();//关闭Session对象
		}
	}
}
