package ego.wear.DAO;

import java.util.List;

import ego.wear.model.AddressModel;

public interface IAddressDAO extends IGenericDAO<AddressModel>{
	List<AddressModel> findByIdUser(long idUser);
	long insert(AddressModel addressModel);
}
