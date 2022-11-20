package ego.wear.DAO.impl;

import java.sql.Timestamp;
import java.util.List;

import ego.wear.DAO.ISubCategoryDAO;
import ego.wear.mapper.SubCategoryMapper;
import ego.wear.model.SubCategoryModel;
import ego.wear.util.GenerateCode;

public class SubCategoryDAO extends AbstractDAO<SubCategoryModel> implements ISubCategoryDAO {
	public static SubCategoryDAO subCategoryDao = null;
	public static SubCategoryDAO getInstance() {
		if(subCategoryDao == null) {
			subCategoryDao = new SubCategoryDAO();
		}
		return subCategoryDao;
	}
	@Override
	public List<SubCategoryModel> findAll() {
		String sql = "SELECT * FROM sub_category";
		return query(sql, new SubCategoryMapper());
	}
	@Override
	public SubCategoryModel findById(long id) {
		String sql = "SELECT * FROM sub_category where id = ?";
		return query(sql, new SubCategoryMapper(), id).get(0);
	}
	@Override
	public long insert(SubCategoryModel subCategoryModel) {
		String sql = "INSERT INTO sub_category(name, code, category_id, created_by, created_date)"
				+ "VALUES(?, ?, ?, ?, ?)";
		long id = insert(sql, subCategoryModel.getName(), subCategoryModel.getCode(), subCategoryModel.getCategoryId(), subCategoryModel.getCreatedBy(), subCategoryModel.getCreatedDate());
		return id;
	}
	
	@Override
	public void update(SubCategoryModel subCategoryModel) {
		String sql = "UPDATE sub_category SET name = ?,  code = ?, category_id = ?, modified_by = ?, modified_date = ? WHERE id = ?";
		update(sql, subCategoryModel.getName(), subCategoryModel.getCode(), subCategoryModel.getCategoryId(), subCategoryModel.getModifiedBy(), subCategoryModel.getModifiedDate(), subCategoryModel.getId());
	}
	public static void main(String[] args) {
		SubCategoryModel oldSub = SubCategoryDAO.getInstance().findById(1);
		if(oldSub != null) {
			oldSub.setName("Áo sơ mi nam");
			oldSub.setCode(GenerateCode.generateCode(oldSub.getName()));
			oldSub.setModifiedDate(new Timestamp(System.currentTimeMillis()));
			
			SubCategoryDAO.getInstance().update(oldSub);
		}
	}

}
