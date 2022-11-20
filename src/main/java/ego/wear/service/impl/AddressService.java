package ego.wear.service.impl;

import java.util.List;

import ego.wear.DAO.impl.AddressDAO;
import ego.wear.model.AddressModel;
import ego.wear.service.IAddressService;

public class AddressService implements IAddressService{
	public static AddressService addressService;
	public static AddressService getInstance() {
		if(addressService == null) {
			addressService = new AddressService();
		}
		return addressService;
	}

	@Override
	public List<AddressModel> findByIdUser(long idUser) {
		return AddressDAO.getInstance().findByIdUser(idUser);
	}

	@Override
	public long insert(AddressModel addressModel) {
		return AddressDAO.getInstance().insert(addressModel);
	}

}
