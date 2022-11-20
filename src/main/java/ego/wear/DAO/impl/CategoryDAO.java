package ego.wear.DAO.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import ego.wear.DAO.ICategoryDAO;
import ego.wear.condition.Condition;
import ego.wear.mapper.CategoryMapper;
import ego.wear.model.CategoryModel;
import ego.wear.pagination.IPageble;
import ego.wear.pagination.PageRequest;
import ego.wear.sort.Sorter;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO{
	public static CategoryDAO categoryDao = null;
	public static CategoryDAO getInstance() {
		if(categoryDao == null) {
			categoryDao = new CategoryDAO();
		}
		return categoryDao;
	}
	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}
	@Override
	public int delete(long id) {
		String sql = "Delete from category where id = ?";
		Connection conn = getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			int result = ps.executeUpdate();
			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	@Override
	public List<CategoryModel> findAllPagination(IPageble pageble) {
		StringBuilder sql = new StringBuilder("select * from category");
		if(pageble != null) {
			if(pageble.getCondition() != null) {
				int length = pageble.getCondition().length;
				for(int i = 0; i < length; i++) {
					Condition con = pageble.getCondition()[i];
					if(i > 0) {
						sql.append(" AND " + con.getConditionName() + " " + con.getConditionType() + " " + con.getConditionValue());
					}else {
						sql.append(" WHERE " + con.getConditionName() + " " + con.getConditionType() + " " + con.getConditionValue());
					}
					
				}
//				sql.append(" WHERE " + pageble.getCondition().getConditionName() + " = " + pageble.getCondition().getConditionValue());
			}
			if(pageble.getSorter() != null) {
				sql.append(" ORDER BY " + pageble.getSorter().getSortBy() + " " + pageble.getSorter().getSortName());
			}
			if(pageble.getOffset() != null && pageble.getLitmit() != null) {
				sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLitmit());
			}
		}		
		List<CategoryModel> list = query(sql.toString(), new CategoryMapper());
		if(list != null) return list;
		return null;
	}
	@Override
	public CategoryModel findById(long id) {
		String sql = "SELECT * FROM category where id = ?";
		return query(sql, new CategoryMapper(), id).get(0);
	}
	
	@Override
	public int update(CategoryModel categoryModel) {
		String sql = "UPDATE category SET name = ?,  code = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		int result = update(sql, categoryModel.getName(), categoryModel.getCode(), categoryModel.getModifiedBy(), categoryModel.getModifiedDate(), categoryModel.getId());
		return result;
	}

	@Override
	public long insert(CategoryModel categoryModel) {
		String sql = "INSERT INTO category(name, code, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?)";
		long id = insert(sql, categoryModel.getName(), categoryModel.getCode(), categoryModel.getCreatedBy(), categoryModel.getCreatedDate());
		return id;
	}
	public static void main(String[] args) {
		int result = CategoryDAO.getInstance().delete(11);
		System.out.println(result);
	}
	
}
