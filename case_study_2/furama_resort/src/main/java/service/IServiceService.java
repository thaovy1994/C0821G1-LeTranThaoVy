package service;

import bean.House;

import java.util.List;

public interface IServiceService {
    List<House> showHouse();
    void createHouse(House house);
}
