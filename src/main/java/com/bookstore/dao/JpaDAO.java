package com.bookstore.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

// import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class JpaDAO<E> {
	
	private static EntityManagerFactory entityManagerFactory; // Được khởi tạo để quản lý các đối tượng EntityManager giúp thực hiện với thao tác dữ liệu
	
	static {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		// Tạo một đối tượng EntityManagerFactory nhận vào một định danh có tên là BookStoreWebsite
	}
	
	public JpaDAO() {
	}
	
	public E create(E entity)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager(); // Khởi tạo đối tượng EntityManager từ entityManagerFactory
		entityManager.getTransaction().begin(); // Bắt đầu một giao dịch trong EntityManager
		entityManager.persist(entity); // Thêm entity vào cơ sở dữ liệu
		entityManager.flush(); // Đồng bộ hoá cơ sở dữ liệu
		entityManager.refresh(entity); // Cập nhật lại thực thể entity từ cơ sở dữ liệu
		
		entityManager.getTransaction().commit(); // Kết thúc giao dịch, nếu k có lỗi tất cả các thay đổi được xác nhận và lưu trữ
		entityManager.close(); // Đóng EntityManager sau khi hoàn thành giao dịch
		return entity; // Trả về thực thể entity
	}
	
	public E update(E entity)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entity = entityManager.merge(entity); // Cập nhật thực thể entity là sử dụng phương thức merge()
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}
	
	
	public E find(Class<E> type, Object id)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		E entity = entityManager.find(type, id);
		if(entity != null)
		{
			entityManager.refresh(entity); // Nếu tìm thấy thì làm mới csdl đảm bảo thực thể đc tìm thấy là phiên bản mới nhất
		}
		entityManager.close();
		return entity;
	}
	
	
	public void delete(Class<E> type, Object id)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		Object reference = entityManager.getReference(type, id); // Lấy tham chiếu đến thực thể cần xoá, trả về một đối tượng tham chiếu đến thực thể
		entityManager.remove(reference); // Xoá thực thể được tham chiếu tới
		entityManager.getTransaction().commit();
		entityManager.close();
	}
	
	public List<E> findwithNameQuery(String queryName)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		
		List<E> result = query.getResultList(); // Trả về một List các đối tượng thoả mãn truy vấn
		entityManager.close();
		return result;
	}
	
	public List<E> findwithNameQuery(String queryName, int firstResult, int maxResult)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult); // Thiết lập vị trí bắt đầu lấy kết quả, tham số firstResult là vị trí bắt đầu
		query.setMaxResults(maxResult); // Thiết lập số lượng kết quả tối đa được lấy, tham số maxResult là số lượng kết quả tối đa
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	
	public List<E> findAllWithPagination(String queryName, int firstResult, int maxResult)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	public List<Object[]> findwithNameQueryObjects(String queryName, int firstResult, int maxResult)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		
		List<Object[]> result = query.getResultList();
		
		entityManager.close();
		return result;
	}
	
	public List<E> findwithNameQuery(String queryName, String paramName, Object paramValue)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setParameter(paramName, paramValue); // Thiết lập giá trị cho tham số trong truy vấn, paraName là tên tham số, paramValue là giá trị được truyền vào tham số đó
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
	
	public List<E> findwithNameQueryWithPagination(String queryName, String paramName, Object paramValue, int firstResult, int maxResults) {
	    EntityManager entityManager = entityManagerFactory.createEntityManager();
	    Query query = entityManager.createNamedQuery(queryName);
	    query.setParameter(paramName, paramValue);
	    query.setFirstResult(Math.max(firstResult, 0)); // Kiểm tra giá trị không nhỏ hơn 0
	    query.setMaxResults(maxResults);
	    List<E> result = query.getResultList();
	    entityManager.close();
	    return result;
	}
	

	
	public List<E> findwithNameQuery(String queryName, Map<String, Object> parameters)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		
		Set<Entry<String, Object>> setParameters = parameters.entrySet(); // Lấy tập hơp các cặp khoá - giá trị từ parameters
		
		for(Entry<String, Object> entry : setParameters) {
			query.setParameter(entry.getKey(), entry.getValue());
			// entry.getKey(): trả về khoá( tên tham số)
			// entry.getValue(): trả về giá trị tương ứng
		}
		
		List<E> result = query.getResultList();
		entityManager.close();
		return result;
	}
		
	public long countwithNameQuery(String queryname)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryname);
	
		long result = (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public long countwithNameQuery(String queryname, String paramName, Object paramValue)
	{
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryname);
		query.setParameter(paramName, paramValue);
		
		long result = (long) query.getSingleResult();
		entityManager.close();
		return result;
	}
	
	public void close()
	{
		if(entityManagerFactory != null)
		{
			entityManagerFactory.close();
		}
	}

}
