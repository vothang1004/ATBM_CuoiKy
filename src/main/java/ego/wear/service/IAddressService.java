package ego.wear.service;

import java.util.List;

import ego.wear.model.AddressModel;

public interface IAddressService {
	List<AddressModel> findByIdUser(long idUser);
	long insert(AddressModel addressModel);
}
