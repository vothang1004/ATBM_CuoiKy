package ego.wear.DAO.impl;

import java.util.List;

import ego.wear.DAO.IAddressDAO;
import ego.wear.mapper.AddressMapper;
import ego.wear.model.AddressModel;

public class AddressDAO extends AbstractDAO<AddressModel> implements IAddressDAO{
	public static AddressDAO addressDAO = null;
	public static AddressDAO getInstance() {
		if(addressDAO == null) {
			addressDAO = new AddressDAO();
		}
		return addressDAO;
	}
	public AddressDAO() {
		
	}

	@Override
	public List<AddressModel> findByIdUser(long idUser) {
		String sql = "Select * from address where id_user=?";
		List<AddressModel> result = query(sql, new AddressMapper(), idUser);
		if(result.size() > 0) return result;
		return null;
	}

	@Override
	public long insert(AddressModel addressModel) {
		String sql = "insert into address(province, district, village, detail, id_user, created_by, created_date, modified_by, modified_date)"
				+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		long id = insert(sql, addressModel.getProvince(), addressModel.getDistrict(), addressModel.getVillage(),
				addressModel.getDetail(), addressModel.getIdUser(), addressModel.getCreatedBy(), addressModel.getCreatedDate(),
				addressModel.getModifiedBy(), addressModel.getModifiedDate());
		return id;
	}
	public static void main(String[] args) {
		AddressModel model = new AddressModel(0, null, null, null, null, "test2", "tes2", "test2", "detail", 2);
		long id = AddressDAO.getInstance().insert(model);
		System.out.println(id);
	}

}
