package service.impl;

import bean.House;
import repository.IServiceRepository;
import repository.impl.ServiceRepository;
import service.IServiceService;

import java.util.List;

public class ServiceService implements IServiceService {
    private IServiceRepository repository = new ServiceRepository();

    @Override
    public List<House> showHouse() {
        try {
            List<House> houseList = repository.showHouse();
            if (houseList.size() == 0) {
                return null;
            } else {
                return houseList;
            }
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
    }

    @Override
    public void createHouse(House house) {
        repository.createHouse(house);
    }
}
